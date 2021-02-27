<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="data" class="java.util.Date" />
<fmt:formatDate var="dataAtual" value="${data}" pattern="dd/MM/yyyy" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
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
	<div class="col-md-10 offset-md-1">
		<hr />

		<h5>Consulta de Compromisso</h5>

		<br> <br>

		<form autocomplete="off" id="formConsulta">
			<div class="row">
				<div class="col-md-7">
					<div class="row">
						<div class="col-md-6">

							<label>Data de Início:</label> <input type="date"
								name="dataInicio" id="dataInicio" class="form-control" />
						</div>
						<div class="col-md-6">

							<label>Data do Fim:</label> <input type="date" name="dataFim"
								id="dataFim" class="form-control" />
						</div>
					</div>
				</div>
			</div>
			<br> <input type="submit" value="Consultar Compromisso"
				class="btn btn-dark rounded-pill" />
		</form>
		<br>
		<table class="table table-hover table-striped" id="tabelaCompromissos">
			<thead>
				<tr>
					<th>Nome do Compromisso</th>
					<th>Data</th>
					<th>Hora</th>
					<th>Tipo</th>
					<th>Prioridade</th>
					<th>Operações</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="/springMvc02/edicao-compromisso"
						class="btn btn-dark ">Editar</a> <a
						href="/springMvc02/exclusao-compromisso" class="btn btn-danger">Excluir</a>
					</td>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">Quatidade de compromissos</td>
				</tr>
			</tfoot>

		</table>
	</div>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-3.5.1.min.js"></script>
	<script src="//cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
	<script>
	$(document).ready( function () {
	    $('#tabelaCompromissos').DataTable({
	    language: {
	        url: '//cdn.datatables.net/plug-ins/1.10.22/i18n/Portuguese-Brasil.json'
	    }
	} );


	$("#formConsulta").validate({
	rules:{
					'dataInicio' : {
					required : true
				},
					'dataFim' : {
					required : true
				}
	
			}
		});
	})
	
</script>
</body>
</html>