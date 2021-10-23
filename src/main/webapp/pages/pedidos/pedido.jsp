<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.quazar.tcc.model.Cliente"%>
<%@ page import="com.quazar.tcc.model.Pedido"%>
<%@ page import="com.quazar.tcc.service.PedidoService"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%
	@SuppressWarnings("unchecked")
	List<Pedido> listaPedidos = (ArrayList<Pedido>) request.getAttribute("pedidos");
	PedidoService pedidoService = new PedidoService();
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
		<link rel="stylesheet" href="./pedido2.css" />
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
  
	<div class="containerPedido">
	<%
		if(session.getAttribute("cliente") != null){
	%>

	<main class="contact">
	<div class="contactForm">
	<form action="fazerPedido" method="POST">
		<div class="form">
			<h2>Faça o Seu Pedido</h2>
            <div class="inputBox">
			<input type="text" name="titulo" id="titulo" required />
			<span>Digite o titulo do pedido</span>
			</div>

			<div class="inputBox">
			<textarea type="text" name="pedido" required ></textarea>
			<span>Digite aqui o seu pedido</span>
			</div>

		<label>Digite a categoria do pedido</label><br>
		<select name="categoria">
			<option value="marcenaria">Marcenaria</option>
			<option value="eletronica">Eletronica</option>
			<option value="eletroeletronica">Eletroeletronica</option>
			<option value="pedreiro">Pedreiro</option>
			<option value="pintor">Pintor</option>
		</select>

		<div class="inputBox">
		<input type="submit" value="Enviar">
		</div>
		</div>
	</form>
	</div>
	</main>
	
	<h3>Seus pedidos</h3>
	<table>
		<thead>
			<tr>
				<th>Id do pedido</th>
				<th>Id do cliente</th>
				<th>Nome do cliente</th>
				<th>Titulo</th>
				<th>Categoria</th>
				<th>Pedido</th>
				<th>Atualizar</th>
				<th>Deletar</th>
			</tr>
		</thead>
		<tbody>
			<%
				try{
					List<Pedido> pedidos = pedidoService.selectPedidosByIdCliente((Cliente) request.getSession().getAttribute("cliente"));
					for(Pedido pedido : pedidos){
			%>
			<tr>
				<td><%= pedido.getId() %></td>
				<td><%= pedido.getId_cliente() %></td>
				<td><%= pedido.getCliente().getUser().getNome() %></td>
				<td><%= pedido.getTitulo() %></td>
				<td><%= pedido.getCategoria() %></td>
				<td><%= pedido.getPedido() %></td>
				<td><a href="atualizarPedido">Atualizar</a></td>
				<td><a href="deletarPedido?id_pedido=<%= pedido.getId() %>">Deletar</a></td>
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

	<h3>pedidos feitos</h3>
	<table>
		<thead>
			<tr>
				<th>Id do pedido</th>
				<th>Id do cliente</th>
				<th>Nome do cliente</th>
				<th>Titulo</th>
				<th>Categoria</th>
				<th>Pedido</th>
			</tr>
		</thead>
		<tbody>
			<%
				try{
					for(Pedido pedido : listaPedidos){
			%>
			<tr>
				<td><%= pedido.getId() %></td>
				<td><%= pedido.getId_cliente() %></td>
				<td><%= pedido.getCliente().getUser().getNome() %></td>
				<td><%= pedido.getTitulo() %></td>
				<td><%= pedido.getCategoria() %></td>
				<td><%= pedido.getPedido() %></td>
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