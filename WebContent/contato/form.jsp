<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includes/header.jsp" />
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-5 mt-4">
	        <div class="card">
	        	<div class="card-header">
					<c:if test="${contato != null}">
                    	<h4>Atualizar Contato</h4>
                    </c:if>
                    <c:if test="${contato == null}">
                    	<h4>Novo Contato</h4>
                    </c:if>
				</div>
	            <div class="card-body">
	            	<c:if test="${contato != null}">
	            	<form id="frm-salvar" action="contatos" method="post">
	            		<input type="hidden" name="cmd" value="put">
	            		<input type="hidden" name="id" value="<c:out value='${contato.id}' />">
	            	</c:if>
	            	<c:if test="${contato == null}">
	            	<form id="frm-salvar" action="contatos" method="post">
	            		<input type="hidden" name="cmd" value="post">
	            	</c:if>
		                <div class="form-group">
		                    <label for="nome">Nome</label>
		                    <input type="text" value="<c:out value='${contato.nome}' />" class="form-control" id="nome" name="nome" required>
		                </div>
		
		                <div class="form-group">
		                    <label for="email">Email</label>
		                    <input type="email" value="<c:out value='${contato.email}' />" class="form-control" id="email" name="email" required>
		                </div>
		
		                <div class="form-group">
		                    <label for="telefone">Telefone</label>
		                    <input type="text" value="<c:out value='${contato.telefone}' />" class="form-control" id="telefone" name="telefone" required maxlength="15">
		                </div>
						
						<div class="float-right">
		                	<button type="submit" class="btn btn-success btn-salvar" style="width:6rem;">Salvar</button>
		                	<a href="<%= request.getHeader("referer") %>" class="btn btn-secondary btn-cancelar" style="width:6rem;">Cancelar</a>
	                	</div>
	                </form>
	            </div>
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
			
			$('#frm-salvar').on('submit', function (evt) {
		    	$('.btn-salvar').prop('disabled', true);
		    	$('.btn-cancelar').addClass('disabled');
		    });
		})();
    </script>
<jsp:include page="/includes/footer.jsp" />