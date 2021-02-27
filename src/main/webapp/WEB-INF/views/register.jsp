<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">


</head>
<body style="background-image: url('https://minasfazciencia.com.br/wp-content/uploads/2020/04/linguagem-de-programa%C3%A7%C3%A3o-e1587932942136.jpg'); width: 100%; height: 120%; background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

		
		<img
			src="https://i.ibb.co/5vrL80d/Design-sem-nome-4-removebg-preview.png"
			class="col-md-4 offset-md-4 ">
		<div class="container mt-4">
			<div class="row">
				<div class="col-md-4 offset-md-4 text-center">

					<div class="card bg-dark">
						<div class="card-body">
							<h5 class="card-title text-secondary">Criar conta de usuário</h5>
							<h6 class="card-subtitle mb-2 text-secondary">Preencha os campos
								abaixo</h6>
							<hr />
							<c:if test="${not empty mensagem_sucesso}">
								<div class="alert alert-success
alert-dismissible fade show"
									role="alert">
									<strong>Sucesso!</strong> ${mensagem_sucesso}
									<button type="button" class="btn-close" data-bsdismiss="alert"
										aria-label="Close"></button>
								</div>
							</c:if>
							<c:if test="${not empty mensagem_erro}">
								<div class="alert alert-danger alert-dismissible
fade show"
									role="alert">
									<strong>Erro!</strong> ${mensagem_erro}
									<button type="button" class="btn-close" data-bs-dismiss="alert"
										aria-label="Close"></button>
								</div>
							</c:if>
							<form id="formRegister" action="registerUser" method="post">

								<label class="text-secondary">Nome do usuário</label>
								<form:input path="register.nome" type="text" id="nome"
									name="nome" class="form-control" placeholder="Joaquin da Silva"
									autocomplete="off" />
								<br> <label class="text-secondary">Email de acesso:</label>
								<form:input path="register.email" type="text" id="email"
									name="email" class="form-control" placeholder="joao@email.com"
									autocomplete="off" />
								<br> <label class="text-secondary">Senha de acesso:</label>
								<form:input path="register.senha" type="password" id="senha"
									name="senha" class="form-control" placeholder="Digite aqui" />
								<br> <label class="text-secondary">Confirmar senha</label>
								<form:input path="register.confirmaSenha" type="password"
									id="senhaConfirmacao" name="senhaConfirmacao"
									class="form-control" placeholder="Digite aqui" />
								<br>
								<div class="d-grid ">
									<input type="submit" value="Cadastrar Usuário"
										class="btn btn-secondary rounded-pill" />
								</div>
							</form>
							<div class="d-grid">
								<a href="/springMvc02/" class="btn btn-secondary rounded-pill">Voltar
									a página inicial</a>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>





	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
