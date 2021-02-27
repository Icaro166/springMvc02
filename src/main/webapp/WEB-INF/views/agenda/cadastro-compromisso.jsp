<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<jsp:useBean id="data" class="java.util.Date" />
<fmt:formatDate var="dataAtual" value="${data}" pattern="dd/MM/yyyy" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style >
label.error {color: #d9534f;}
input.error, select.error, textarea.error{border: 1px solid #d9534f; }
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand text-light" href="#">Agenda de
				Compromissos</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active text-light"
						aria-current="page" href="/springMvc02/">Página inicial</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-light" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> Gerenciar Compromissos </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="/springMvc02/cadastro-compromisso">Cadastrar
									Compromissos</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item"
								href="/springMvc02/consulta-compromisso">Consultar
									Compromissos</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item"
								href="/springMvc02/relatorio-compromisso">Relatório de
									Compromissos</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6">
				<h5>Seja bem vindo a Agenda de Compromisso</h5>
				<div class="col-md-2">
					<p class="badge bg-secondary rounded-pill fs-6">${dataAtual}</p>
				</div>
			</div>
			<div class="col-md-6 text-end">

				Usuário Autenticado <strong>${usuario_autenticado.nome}</strong> <small>(${usuario_autenticado.email })</small><br>
				<a href="/springMvc02/logout"
					onclick="return confirm('Deseja realmente sair do sistema?')"
					class="btn btn-dark rounded-pill">Sair do Sistema</a>
			</div>

		</div>
	</div>
	<hr/>
	<div class="col-md-6 offset-md-3">
	<h5>Formúlario para cadastro de Compromisso</h5>
	Preencha os campos abaixo para criar um compromisso.
	<br>
	<br>

	<form autocomplete="off" id="formCadastro" method="post" action="cadastrarCompromisso">
		<div class="row">
			<div class="col-md-4">
				<label>Nome do Compromisso</label> 
				<form:input path="compromisso.nome" type="text" name="nome"
					id="nome" class="form-control " />
			</div>
			<div class="col-md-7">
				<div class="row">
					<div class="col-md-6">

						<label>Data do Compromisso:</label> 
						<form:input path="compromisso.dataCompromisso"  type="date"
							name="dataCompromisso" id="dataCompromisso" class="form-control" />
					</div>
					<div class="col-md-6">

						<label>Hora do Compromisso:</label> <form:input path="compromisso.horaCompromisso"  type="text"
							name="horaCompromisso" id="horaCompromisso" class="form-control text-center" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="cold-md-3">
				<label>Tipo do Compromisso</label> 
				<form:select path="compromisso.tipo" name="tipo" id="tipo" class="form-select">
				<form:option value="">Escolha uma opção</form:option>
						<form:options items="${tipos}"/>
					</form:select>
			</div>

			<div class="cold-md-3">
				<label>Prioriadade do Compromisso</label>
				 <form:select path="compromisso.prioridade" name="prioridade" id="prioridade" class="form-select">
				 <form:option value="">Escolha uma opção</form:option>
						<form:options items="${prioridades}"/>
					</form:select>
			</div>
		</div>

		<div class="row-mt-3">
			<div class="col-md-12">
				<label>Descrição do Compromisso</label>
				<form:textarea path="compromisso.descricao" name="descricao" id="descricao" class="form-control"></form:textarea>
				<br>

			</div>
		</div>
		<input type="submit" value="Cadastrar Compromisso"
			class="btn btn-dark rounded-pill" />
	</form>
</div>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-3.5.1.min.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	<script src="resources/js/jquery.maskedinput.min.js"></script>
	
	<script>
	$("#horaCompromisso").mask("99:99");
$(document).ready(function(){
$("#formCadastro").validate({
rules : {
'nome' : {
required : true,
minlength : 6,
maxlength : 150
},
'dataCompromisso' : {
required : true
},
'horaCompromisso' : {
required : true
},
'tipo' : {
required : true
},
'prioridade' : {
required : true
},
'descricao' : {
required : true,
minlength : 6,
maxlength : 250
}
}
});
});
</script>
	
</body>
</html>