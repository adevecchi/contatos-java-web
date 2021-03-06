<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includes/header.jsp" />
	<div class="container">
    	<div class="font-weight-bold mt-3 shadow p-3 mb-4 bg-light rounded">
			Lista de Contatos
		</div>
        
        <div class="mb-3">
            <form action="contatos" method="post">
            	<input type="hidden" name="cmd" value="new">
            	<button type="submit" class="btn btn-primary">Adicionar</button>
            </form>
        </div>
        
        <table class="table table-hover">
        	<thead>
            	<tr>
                	<th>#</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th width="5%">&nbsp;</th>
                    <th width="5%">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="contato" items="${contatos}">
            	<tr>
                	<td><c:out value="${contato.id}" /></td>
                    <td><c:out value="${contato.nome}" /></td>
                    <td><c:out value="${contato.email}" /></td>
                    <td><c:out value="${contato.telefone}" /></td>
                    <td>
                    	<form action="contatos" method="post">
                    		<input type="hidden" name="cmd" value="edit">
                    		<input type="hidden" name="id" value="<c:out value='${contato.id}' />">
                    		<button type="submit" class="btn btn-info btn-sm">Editar</button>
                    	</form>
                    </td>
                    <td>
                    	<button type="button" class="btn btn-danger btn-sm btn-excluir" data-id="<c:out value='${contato.id}' />" data-toggle="modal" data-target="#modal-excluir">
                            Excluir
                        </button>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${contatos.size() == 0}">
            	<tr>
            		<td colspan="6" class="text-center">Nenhum contato</td>
            	</tr>
            </c:if>
            </tbody>
        </table>
        
        <nav aria-label="Page navigation contacts">
			<ul class="pagination float-right -justify-content-center">
				<c:choose>
					<c:when test="${ currentPage == 1 }">
						<li class="page-item disabled">
							<a class="page-link" href="#">Anterior</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="contatos?page=${ currentPage - 1 }">Anterior</a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:forEach begin="1" end="${ numPages }" var="i">
					<c:choose>
						<c:when test="${ currentPage == i }">
							<li class="page-item active" aria-current="page"><span class="page-link">${i}</span></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="contatos?page=${ i }">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${ currentPage == numPages }">
						<li class="page-item disabled">
							<a class="page-link" href="#">Pr??ximo</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="contatos?page=${ currentPage + 1 }">Pr??ximo</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
    </div>
    
    <div class="modal fade" id="modal-excluir" tabindex="-1" aria-labelledby="excluirLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">Excluir</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                <p>Deseja excluir o contato?</p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary btn-action" data-dismiss="modal">N??o</button>
	                <form id="frm-excluir" action="contatos" method="post">
	                	<input type="hidden" name="cmd" value="del">
	                	<input type="hidden" name="id" value="">
	                    <button type="submit" class="btn btn-danger btn-action">Sim</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" crossorigin></script>
	<script>
		(function(){
			$('.nav-link').removeClass('active');
			$('#m-contatos').addClass('active');
			
			$('.btn-excluir').on('click', function (evt) {
		    	$('#frm-excluir').find('input[name=id]').val($(this).data('id'));
		    });
			
		    $('#frm-excluir').on('submit', function (evt) {
		        $('.btn-action').prop('disabled', true);
		        $('.modal-body>p').text('Precessando...');
		    });
		})();
	</script>
<jsp:include page="/includes/footer.jsp" />