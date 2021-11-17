<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.quazar.tcc.model.Cliente"%>
<%@ page import="com.quazar.tcc.model.PrestadorServico"%>
<%@ page import="com.quazar.tcc.model.Administrador"%>
<%@ page import="com.quazar.tcc.model.Telefone"%>
<%@ page import="com.quazar.tcc.model.ServicosPrestador"%>

<%
	Cliente cliente = null;
	PrestadorServico prestadorServico = null;
	Administrador administrador = null;
	Telefone telefone = (Telefone) session.getAttribute("telefone");
	List<ServicosPrestador> listaServicosPrestador = null;
	
	if(session.getAttribute("cliente") != null){
		cliente = (Cliente) session.getAttribute("cliente");
	} 
	else if(session.getAttribute("prestador") != null){
		prestadorServico = (PrestadorServico) session.getAttribute("prestador");
		listaServicosPrestador = (List<ServicosPrestador>) session.getAttribute("servicosPrestador");
	}
	else if(session.getAttribute("administrador") != null){
		administrador = (Administrador) session.getAttribute("administrador");
	}
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
<link rel="stylesheet" type="text/css" href="../../global/global.css" />
<link rel="stylesheet" type="text/css" href="../../styles/menu.css" />
<link rel="stylesheet" type="text/css"
	href="../../pages/perfil/perfil.css" />
<link rel="stylesheet" type="text/css" href="../../styles/footer.css" />
</head>
<body>
	<div class="menuFixed">
		<nav class="menu">
			<ul>
				<li class="logo">Reparo Já</li>
				<li class="items"><a href="../../index.jsp">Home</a></li>
				<li class="items"><a href="../anuncioServicos/anuncioServico">Serviços</a></li>
				<li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
				<li class="items"><a href="../quemSomos/quemsomos.jsp">Quem
						Somos</a></li>
				<li class="items"><a href="../contato/contato.jsp">Contato</a></li>
				<%
          	if(session.getAttribute("cliente") == null && session.getAttribute("prestador") == null && session.getAttribute("administrador") == null){
          %>
				<li class="login"><a href="../login/login.jsp">Login</a></li>
				<%
          	}
          	else{
          %>
				<li class="login"><a href="../../logout">Logout</a></li>
				<%
          	}
          %>
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

	<section class="seccion-perfil-usuario">
		<div class="perfil-usuario-header">
			<div class="perfil-usuario-portada">
				<div class="perfil-usuario-avatar">
					<img src="../../img/FotoPerfil.jpg" alt="img-avatar" />
					<button type="button" class="boton-avatar">
						<i class="far fa-image"></i>
					</button>
				</div>
				<button type="button" class="boton-portada">
					<i class="far fa-image"></i> Mudar foto de capa
				</button>
			</div>
		</div>

		<div class="perfil-usuario-body">
			<div class="perfil-usuario-bio">
				<h3 class="titulo">
					<%
					if(cliente != null){
						out.print(cliente.getUser().getNome());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getNome());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getNome());
					}
					else{
						out.print("Erro, Nulo");
					}
				%>
				</h3>
				<p class="texto">Descrição do perfil a se criar, procura-se
					técnicos para arrumar minha geladeira , na região de Guaianases,
					Zona Leste de São Paulo.</p>
			</div>
			<div class="perfil-usuario-footer">
				<ul class="lista-datos">
					<li><i class="icono fa fa-envelope"></i> Email: <%
					if(cliente != null){
						out.print(cliente.getUser().getEmail());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getEmail());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getEmail());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<li><i class="fa fa-map-marker" aria-hidden="true"></i> CEP: <%
					if(cliente != null){
						out.print(cliente.getUser().getCep());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getCep());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getCep());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<li><i class="fa fa-home" aria-hidden="true"></i> Bairro: <%
					if(cliente != null){
						out.print(cliente.getUser().getBairro());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getBairro());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getBairro());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<li><i class="fa fa-home" aria-hidden="true"></i> Rua: <%
					if(cliente != null){
						out.print(cliente.getUser().getRua());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getRua());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getRua());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<li><i class="fa fa-home" aria-hidden="true"></i> Numero da
						casa: <%
					if(cliente != null){
						out.print(cliente.getUser().getNumeroCasa());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getNumeroCasa());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getNumeroCasa());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<%
            	if(prestadorServico != null){
            %>
					<li><i class="icono fas fa-user-check"></i> Tipo de Prestador:
						<%= prestadorServico.getTipoPrestador() %></li>
					<%
				if(listaServicosPrestador != null){
					for(ServicosPrestador servicosPrestador : listaServicosPrestador){
			%>
					<li><i class="icono fas fa-building"></i>Cargo: <%= servicosPrestador.getServico().getNome() %>
					</li>
					<%
						}
					}
				}
            %>
				</ul>
				<ul class="lista-datos">
					<li><i class="fa fa-id-card" aria-hidden="true"></i> CPF: <%
					if(cliente != null){
						out.print(cliente.getUser().getCpf());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getCpf());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getCpf());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<li><i class="icono fas fa-phone-alt"></i>Telefone: <%
          			if(telefone != null){
          				out.print(telefone.getNumero());
          			}
          			else{
          				out.print("telefone não cadastrado");
          			}
          		%></li>
					<li><i class="icono fa fa-star"></i>Estrelas:</li>
					<li><i class="icono fas fa-calendar-alt"></i>Idade: <%
					if(cliente != null){
						out.print(cliente.getUser().getIdade());
					}
					else if(prestadorServico != null){
						out.print(prestadorServico.getUser().getIdade());
					}
					else if(administrador != null){
						out.print(administrador.getUser().getIdade());
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<li><i class="icono fas fa-user-check"></i> Tipo: <%
					if(cliente != null){
						out.print("Cliente");
					}
					else if(prestadorServico != null){
						out.print("Prestador de Serviços");
					}
					else if(administrador != null){
						out.print("Administrador");
					}
					else{
						out.print("Erro, todos nulos");
					}
				%></li>
					<%
	            if(prestadorServico != null){
			%>
					<li><i class="icono fa fa-envelope"></i> Quantidade de
						Funcionarios: <%= prestadorServico.getQtdeFuncionarios() %></li>
					<%
				}
            %>
				</ul>
			</div>
			<div class="redes-sociales">
				<a href="#"> <i class="boton-redes instagram fas fa-cogs"></i>
				</a>
			</div>
		</div>

		<div class="botoes">
			<%
			if(cliente != null){
				%>
			<a class="deletar"
				href="../../deletarCliente?
				id=<%= cliente.getId() %>&id_user=<%= cliente.getId_user() %>&id_fone=<%= telefone.getId() %>">Deletar
				Conta</a> <a class="editar"
				href="../../attCliente?id=<%= cliente.getId_user() %>">Atualizar
				Dados</a>
			<%
						
			}
       			
			else if(prestadorServico != null){
				%>
			<a class="deletar"
				href="../../deletarPrestador?
				id=<%= prestadorServico.getId() %>&id_user=<%= prestadorServico.getId_user() %>&id_fone=<%= telefone.getId() %>">Deletar
				Conta</a> <a class="editar"
				href="../../attPrestador?id=<%= prestadorServico.getId_user() %>">Atualizar
				Dados</a>
			<%
						
			}
			%>

		</div>
	</section>

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
