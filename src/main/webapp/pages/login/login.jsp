<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String log = (String) request.getAttribute("log");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="shortcut icon" href="../../img/logoFundo.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Reparo Já</title>
<link rel="stylesheet" href="../../global/global.css" />
<link rel="stylesheet" href="../../styles/menu.css" />
<link rel="stylesheet" href="./login.css" />
<link rel="stylesheet" href="../../styles/footer.css" />
</head>
<body>
	<!-- Inicio do Menu -->
	<div class="menuFixed">
		<nav class="menu">
			<ul>
				<li class="logo">Reparo Já</li>
				<li class="items"><a href="../../index.jsp">Home</a></li>
				<li class="items"><a href="../anuncioServicos/anuncioServico">Serviços</a></li>
				<li class="items"><a href="../prestadores/prestadores">Prestadores</a></li>
				<%
          	if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
          %>
				<li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
				<%
          	}
          %>
				<li class="items"><a href="../quemSomos/quemsomos.jsp">Quem
						Somos</a></li>
				<li class="items"><a href="../contato/contato.jsp">Contato</a></li>
				<li class="login"><a href="../login/login.jsp">Login</a></li>
				<li class="btn"><a href="#"><i class="fas fa-bars"></i></a></li>
			</ul>
		</nav>
		<script>
        $(document).ready(function () {
          $(".btn").click(function () {
            $(".items").toggleClass("show");
            $("ul li").toggleClass("hide");
          });
        });
      </script>
	</div>
	<!-- Fim do Menu -->

	<!-- Conteudo -->
	<main class="contact">
		<div class="contactForm">
			<form action="login" method="POST">
				<img src="../../img/logo.png" />
				<h2>Faça o Login</h2>
				<div class="form">
					<div class="inputBox">
						<input type="email" name="email" id="email" required /> <span>E-mail</span>
					</div>

					<div class="inputBox">
						<input type="password" name="senha" id="senha" required /> <span>Senha</span>
					</div>

					<%
            	if(log != null){
            %>
					<script>
              alert("Email ou Senha Incorreto");
            </script>
					<% 		
            	} 	
            %>

					<div class="inputBox">
						<input type="submit" name="" value="Login" onClick="{login}"
							class="button" />
					</div>

					<div class="divCadastrar">
						<a href="../cadastroCliente/cadastrarCliente.jsp"
							class="linkCadastrar">Cadastrar Cliente</a> <a
							href="../cadastroPrestador/cadastrarPrestador.jsp"
							class="linkCadastrar">Cadastrar Prestador de
							Serviço</a>
					</div>
				</div>
			</form>
		</div>
	</main>
	<!-- Fim do Conteudo -->

	<!-- Inicio do Footer -->
	<div class="footer-container">
		<section class="footer-subscription">
			<p class="footer-subscription-heading">Receba as nossas melhores
				ofertar diretamente no seu e-mail.</p>
			<p class="footer-subscription-text">Você pode cancelar sua
				inscrição a qualquer momento.</p>
			<div class="input-areas">
				<form>
					<input type="email" name="email" placeholder="Seu Email"
						class="footer-input" />
					<Button class="button">Increva-se</Button>
				</form>
			</div>
		</section>
		<div class="footer-links"></div>
		<section class="social-media">
			<div class="social-media-wrapper">
				<div class="footer-logo">
					<a href="#" class="social-logo"> Reparo Já </a>
				</div>
				<small class="website-rights">© 2021 Quazar</small>
				<div class="social-icons">
					<a href="#" class="social-icon-link facebook" target="_blank"
						arial-label="Facebook"> <i
						class="fab fa-facebook"></i>
					</a> <a href="#" class="social-icon-link instagram" target="_blank"
						arial-label="Instagram"> <i
						class="fab fa-instagram"></i>
					</a> <a href="#" class="social-icon-link youtube" target="_blank"
						arial-label="Youtube"> <i class="fab fa-youtube"></i>
					</a> <a href="#" class="social-icon-link twitter" target="_blank"
						arial-label="Twitter"> <i class="fab fa-twitter"></i>
					</a> <a href="#" class="social-icon-link linkedin" target="_blank"
						arial-label="Linkedin"> <i
						class="fab fa-linkedin"></i>
					</a>
				</div>
			</div>
		</section>
	</div>
	<!-- Fim do Footer -->
</body>
</html>
