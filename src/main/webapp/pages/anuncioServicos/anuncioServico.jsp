<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.quazar.tcc.model.PrestadorServico"%>
<%@ page import="com.quazar.tcc.model.AnuncioServico"%>
<%@ page import="com.quazar.tcc.service.AnuncioServicoService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%
	@SuppressWarnings("unchecked")
	List<AnuncioServico> listaAnuncioPedidos = (ArrayList<AnuncioServico>) request.getAttribute("anuncioServicos");
	AnuncioServicoService anuncioServicoService = new AnuncioServicoService();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<link rel="shortcut icon" href="../../img/logoFundo.png" type="image/x-icon" />
		<link
		  rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
		/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
		<title>Reparo Já</title>
		<link rel="stylesheet" href="../../global/global.css" />
		<link rel="stylesheet" href="../../styles/menu.css" />
		<link rel="stylesheet" href="./anuncio.css" />
		<link rel="stylesheet" href="../../styles/footer.css" />
	  </head>
<body>
	
	<!-- Inicio do Menu -->
	<div class="menuFixed">
		<nav class="menu">
		  <ul>
			<li class="logo">Reparo Já</li>
			<li class="items"><a href="../../index.jsp">Home</a></li>
			<li class="items"><a href="../pedidos/pedido">Pedidos</a></li>
			<li class="items"><a href="../anuncioServicos/anuncioServico">Anuncio Servico</a></li>
			<li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
			<li class="items">
			  <a href="../quemSomos/quemsomos.jsp">Quem Somos</a>
			</li>
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
			<li class="btn">
			  <a href="#"><i class="fas fa-bars"></i></a>
			</li>
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

	<div class="containerAnuncio">
	<%
		if(session.getAttribute("prestador") != null){
	%>
	<form action="fazerAnuncio" method="POST">
		<label>Digite aqui o titulo do seu anuncio</label><br>
		<input type="text" name="titulo" id="titulo"><br>
		<label>Digite aqui o seu anuncio</label><br>
		<textarea name="descricao"></textarea><br>
		<label>Selecione uma categoria</label><br>
		<select name="categoria">
			<option value="marcenaria">Marcenaria</option>
			<option value="eletronica">Eletronica</option>
			<option value="eletroeletronica">Eletroeletronica</option>
			<option value="pedreiro">Pedreiro</option>
			<option value="pintor">Pintor</option>
		</select> <br><br>
		<input type="submit" value="Enviar">
	</form>
	
	<h3>Seus anuncios</h3>
	<table>
		<thead>
			<tr>
				<th>Id do anuncio</th>
				<th>Id do prestador</th>
				<th>Nome do prestador</th>
				<th>Titulo</th>
				<th>Categoria</th>
				<th>Anuncio</th>
				<th>Atualizar</th>
				<th>Deletar</th>
			</tr>
		</thead>
		<tbody>
			<%
				try{
					List<AnuncioServico> anuncioServicos = anuncioServicoService
							.selectAnunciosServicoByIdPrestador((PrestadorServico)request.getSession().getAttribute("prestador"));
					for(AnuncioServico as : anuncioServicos){
			%>
			<tr>
				<td><%= as.getId() %></td>
				<td><%= as.getId_prestador() %></td>
				<td><%= as.getPrestadorServico().getUser().getNome() %></td>
				<td><%= as.getTitulo() %></td>
				<td><%= as.getCategoria() %></td>
				<td><%= as.getDescricao() %></td>
				<td><a href="atualizarAnuncio">Atualizar</a></td>
				<td><a href="deletarAnuncio?id_anuncio=<%= as.getId() %>">Deletar</a></td>
			</tr>
			<%
					}
				}
				catch(Exception e){
					out.print("Erro");
				}
			%>
		</tbody>
	</table>
	<%
		}
	%>

	<h3>Anuncios feitos</h3>
	<table>
		<thead>
			<tr>
				<th>Id do anuncio</th>
				<th>Id do prestador</th>
				<th>Nome do prestador</th>
				<th>Titulo</th>
				<th>Categoria</th>
				<th>Anuncio</th>
			</tr>
		</thead>
		<tbody>
			<%
				try{
					for(AnuncioServico as : listaAnuncioPedidos){
			%>
			<tr>
				<td><%= as.getId() %></td>
				<td><%= as.getId_prestador() %></td>
				<td><%= as.getPrestadorServico().getUser().getNome() %></td>
				<td><%= as.getTitulo() %></td>
				<td><%= as.getCategoria() %></td>
				<td><%= as.getDescricao() %></td>
			</tr>
			<%
					}
				}
				catch(Exception e){
					out.print("Erro");
				}
			%>
		</tbody>
	</table>
  </div>

  <!-- Inicio do Footer -->
  <div class="footer-container">
	<section class="footer-subscription">
	  <p class="footer-subscription-heading">
		Receba as nossas melhores ofertar diretamente no seu e-mail.
	  </p>
	  <p class="footer-subscription-text">
		Você pode cancelar sua inscrição a qualquer momento.
	  </p>
	  <div class="input-areas">
		<form>
		  <input
			type="email"
			name="email"
			placeholder="Seu Email"
			class="footer-input"
		  />
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
		  <a
			href="#"
			class="social-icon-link facebook"
			target="_blank"
			arial-label="Facebook"
		  >
			<i class="fab fa-facebook"></i>
		  </a>
		  <a
			href="#"
			class="social-icon-link instagram"
			target="_blank"
			arial-label="Instagram"
		  >
			<i class="fab fa-instagram"></i>
		  </a>
		  <a
			href="#"
			class="social-icon-link youtube"
			target="_blank"
			arial-label="Youtube"
		  >
			<i class="fab fa-youtube"></i>
		  </a>
		  <a
			href="#"
			class="social-icon-link twitter"
			target="_blank"
			arial-label="Twitter"
		  >
			<i class="fab fa-twitter"></i>
		  </a>
		  <a
			href="#"
			class="social-icon-link linkedin"
			target="_blank"
			arial-label="Linkedin"
		  >
			<i class="fab fa-linkedin"></i>
		  </a>
		</div>
	  </div>
	</section>
  </div>
  <!-- Fim do Footer -->
</body>
</html>