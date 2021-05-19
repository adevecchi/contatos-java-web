<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/includes/header.jsp" />
	<div class="container">
		<div class="jumbotron mt-5">
			<h1 class="display-4">Gerenciamento de Contatos</h1>
			<p class="lead">JSP, Servlet, JDBC, MySQL com Paginação.</p>
			<hr class="my-4">
			<p>
				Aplicativo web de gerenciamento de contatos simples com recursos para Criar, Ler, Atualizar e Excluir em uma coleção de contatos.
				Com recurso de paginação de tabela com Bootstrap sem a utilização de plugins como o jTable (jtable.org) ou DataTable (datatables.net).
			</p>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" crossorigin></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" crossorigin></script>
	<script>
		(function(){
			$('.nav-link').removeClass('active');
			$('#m-home').addClass('active');
		})();
	</script>
<jsp:include page="/includes/footer.jsp" />