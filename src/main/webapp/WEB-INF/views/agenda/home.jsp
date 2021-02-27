<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <jsp:useBean id="data" class="java.util.Date"/>
  <fmt:formatDate var="dataAtual" value="${data}" pattern="dd/MM/yyyy"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="#">Agenda de Compromissos</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="/springMvc02/">Página inicial</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           Gerenciar Compromissos
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/springMvc02/cadastro-compromisso">Cadastrar Compromissos</a></li>
            <li><hr class="dropdown-divider"></li>	
            <li ><a class="dropdown-item" href="/springMvc02/consulta-compromisso">Consultar Compromissos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/springMvc02/relatorio-compromisso">Relatório de Compromissos</a></li>
          </ul>
        </li>
        
      </ul>
    </div>
  </div>
</nav>
<div class="container mt-4">
<div class="row">
<div class="col-md-6">
<h5 >Seja bem vindo a Agenda de Compromisso</h5>
<div class="col-md-2">
<p class="badge bg-secondary rounded-pill fs-6">${dataAtual}</p>
</div>
</div>
<div class="col-md-6 text-end">

Usuário Autenticado <strong>${usuario_autenticado.nome}</strong>
<small>(${usuario_autenticado.email })</small><br>
<a href="/springMvc02/logout" onclick="return confirm('Deseja realmente sair do sistema?')"
class="btn btn-dark rounded-pill" >Sair do Sistema</a>
</div>

</div>
</div>
<hr/>

<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>