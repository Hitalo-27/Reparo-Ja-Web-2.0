<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.quazar.tcc.model.PrestadorServico"%>
<%@ page import="com.quazar.tcc.model.AnuncioServico"%>
<%@ page import="com.quazar.tcc.model.Cliente"%>
<%@ page import="com.quazar.tcc.model.Telefone"%>
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
<link rel="shortcut icon" href="../../img/logoFundo.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Reparo Já</title>
<link rel="stylesheet" type="text/css" href="./bootstrap.min.css" />
<link rel="stylesheet" href="../../global/global.css" />
<link rel="stylesheet" href="../../styles/menu.css" />
<link rel="stylesheet" href="./style.css" />
<link rel="stylesheet" href="../../styles/footer.css" />
<link rel="stylesheet" href="./responsive.css" />
<link rel="stylesheet" href="./anuncio.css" />
<link rel="stylesheet" href="../../styles/modal.css" />
<link rel="stylesheet" href="./cardAnuncio.css" />
<link rel="stylesheet" href="./anuncio.css" />
<script defer src="../../js/scriptAnuncio.js"></script>
</head>
<body>

	<!-- Inicio do Menu -->
	<div class="menuFixed">
		<nav class="menu">
			<ul>
				<li class="logo">Reparo Já</li>
				<%
          			if(session.getAttribute("prestador") != null){
          		%>
				<li class="items"><a href="../homePrestador/homePrestador">Home</a></li>
				<%
          			} else{
          		%>
				<li class="items"><a href="../../index.jsp">Home</a></li>
				<%
          			}
          		%>
				<li class="items"><a href="../anuncioServicos/anuncioServico">Serviços</a></li>
				<li class="items"><a href="../prestadores/prestadores">Prestadores</a></li>
				<%
				if (session.getAttribute("cliente") != null || session.getAttribute("prestador") != null
						|| session.getAttribute("administrador") != null) {
				%>
				<li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
				<%
				}
				%>
				<li class="items"><a href="../quemSomos/quemsomos.jsp">Quem
						Somos</a></li>
				<li class="items"><a href="../contato/contato.jsp">Contato</a></li>
				<%
				if (session.getAttribute("cliente") == null && session.getAttribute("prestador") == null
						&& session.getAttribute("administrador") == null) {
				%>
				<li class="login"><a href="../login/login.jsp">Login</a></li>
				<%
				} else {
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
	<!-- Fim do Menu -->

	<div class="containerAnuncio">
		<%
		if (session.getAttribute("prestador") != null) {
		%>

		<main class="contact">
			<div class="contactForm">
				<form action="fazerAnuncio" method="POST">
					<div class="form">
						<h2>Faça o Seu Anuncio Aqui!</h2>
						<div class="inputBox">
							<input type="text" name="titulo" id="titulo" required> <span>Digite
								aqui o titulo do seu anuncio</span>
						</div>

						<div class="inputBox">
							<textarea name="descricao" required></textarea>
							<span>Digite aqui o seu anuncio</span>
						</div>

						<div class="inputBox">
							<label>Selecione uma categoria: </label> <select name="categoria"
								id="categoria">
								<option value="0">Selecionar Categoria</option>
								<option value="eletroeletronica">Eletrodomesticos</option>
								<option value="marcenaria">Marcenaria</option>
								<option value="eletricista">Eletricista</option>
								<option value="pedreiro">Pedreiro</option>
								<option value="pintor">Pintor</option>
								<option value="encanador">Encanador</option>
							</select>
						</div>

						<div class="inputBox">
							<label>Selecione uma sub-categoria: </label> <select
								name="subcategoria" id="subcategoria"></select>
						</div>
						
						<div class="imagemServico">
							<h3>Adicione uma Imagem</h3>
							<input type="file" name="img" id="img" accept="image/png, image/gif, image/jpeg" />
						</div>

						<div class="inputBox">
							<input type="submit" value="Fazer Anuncio">
						</div>
					</div>
				</form>
			</div>
		</main>

		<div class="seusAnuncios">
			<h1>Seus anuncios</h1>
		</div>
		
		<section class="cards-wrapper">
			<%
			try {
				List<AnuncioServico> anuncioServicos = anuncioServicoService
				.selectAnunciosServicoByIdPrestador((PrestadorServico) request.getSession().getAttribute("prestador"));
				for (AnuncioServico as : anuncioServicos) {
			%>

			<div class="card-grid-space">
				<div class="card-container">
						<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />

					<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
					<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
					<h6 class="nameLocal">
						<i class="fas fa-map-marker-alt"></i>
						<%=as.getPrestadorServico().getUser().getBairro()%>,
						<%=as.getPrestadorServico().getUser().getRua()%></h6>
					<h6> <i class="fas fa-envelope"></i> <%=as.getPrestadorServico().getUser().getEmail()%></h6>
					<p> <%=as.getDescricao()%> </p>

					<div class="buttons">
						<button class="primary"> <a href="attAnuncio?id_anuncio=<%=as.getId()%>"> Atualizar </a> </button>
						<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Excluir </a> </button>
					</div>

					<div class="skills">
						<h6><%=as.getCategoria()%></h6>
						<ul>
							<li><%=as.getSubcategoria()%></li>
						</ul>
					</div>
				</div>
			</div>

			<%
			}
			} catch (Exception e) {
			out.print("Erro");
			}
			%>
			<%
			}
			%>
		</section>

		<div class="search">
			<nav class="main-incline">
				<h1>Pesquisar serviços</h1>
				<form id="form-inline-main" class="form-inline" action="buscarServico" method="post">
				  <input id="form-inline-input"  class="form-control mr-sm-2" type="search" name="pesquisaServico" placeholder="Pesquisar" aria-label="Pesquisar">
				  <button style="background: #3c3163; color: #FFF" id="btn-button-search" class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar</button>
				</form>
			</nav>		
		</div>

		

<div class="categorias">

<h1 class="categoriasDisponiveis">Todas as nossas categorias disponiveis!</h1>
<!-- Grid dos campos de categoria  -->
<div class="col-md-12">
<div class="full margin_bottom_30">
<div class="accordion border_circle">
<div class="bs-example">
<div class="panel-group" id="accordion">

	<!-- Categorias -->

	<div class="panel panel-default">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
					href="#collapseG"> <i class="fa fa-search"></i>
					Todos <i class="fa fa-angle-down"></i>
				</a>
			</p>
		</div>

		<div id="collapseG" class="panel-collapse collapse in show">
			<!-- Corpo da categoria  -->
			<div class="panel-body">

				<section class="cards-wrapper">
					<%
					try {
						for (AnuncioServico as : listaAnuncioPedidos) {
					%>
						<div class="card-grid-space">
							<div class="card-container">
								<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
			
								<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
								<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
								<h6 class="nameLocal">
									<i class="fas fa-map-marker-alt"></i>
									<%=as.getPrestadorServico().getUser().getBairro()%>,
									<%=as.getPrestadorServico().getUser().getRua()%></h6>
								<h6> <i class="fas fa-envelope"></i> <%=as.getPrestadorServico().getUser().getEmail()%></h6>
								<p> <%=as.getDescricao()%> </p>

								<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal(<%= as.getPrestadorServico().getId()%>)">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Excluir </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
			
								<div class="skills">
									<h6><%=as.getCategoria()%></h6>
									<ul>
										<li><%=as.getSubcategoria()%></li>
									</ul>
								</div>
							</div>
						</div>
				
					<%
					}
					} catch (Exception e) {
					out.print("Erro");
					}
					%>
				</section>

			</div>
		</div>
	</div>

	<div class="panel panel-default" id="eletrodomestico">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseF"> <i class="fas fa-car-battery"></i>
					Eletrodomestico <i class="fa fa-angle-down"></i>
				</a>
			</p>
		</div>

		<div id="collapseF" class="panel-collapse collapse in">
			<!-- Corpo da categoria  -->
			<div class="panel-body">

				<section class="cards-wrapper">
					<%
					try {
						for (AnuncioServico as : listaAnuncioPedidos) {
							if(as.getSubcategoria().equals("Eletrodomestico")){
					%>
					

					<div class="card-grid-space">
						<div class="card-container">
								<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
		
							<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
							<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
							<h6 class="nameLocal">
								<i class="fas fa-map-marker-alt"></i>
								<%=as.getPrestadorServico().getUser().getBairro()%>,
								<%=as.getPrestadorServico().getUser().getRua()%></h6>
							<p> <%=as.getDescricao()%> </p>
		
							<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
		
							<div class="skills">
								<h6><%=as.getCategoria()%></h6>
								<ul>
									<li><%=as.getSubcategoria()%></li>
								</ul>
							</div>
						</div>
					</div>
					<%
							}
					}
					} catch (Exception e) {
					out.print("Erro");
					}
					%>
				</section>
			</div>
		</div>
	</div>


	<div class="panel panel-default" id="eletricista">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseA"> <i class="fas fa-bolt"></i>
					Eletricista <i class="fa fa-angle-down"></i>
				</a>
			</p>
		</div>

		<div id="collapseA" class="panel-collapse collapse in">
			<!-- Corpo da categoria  -->
			<div class="panel-body">
				<!-- Subcategoria  -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseOne"> <i
								class="fas fa-bolt"></i> Instalação <i
								class="fa fa-angle-down"></i>
							</a>
						</p>
					</div>

					<div id="collapseOne" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Instalacao")){
								%>
								

								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>

				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseTwo"> <i
								class="fas fa-bolt"></i> Reparo <i
								class="fa fa-angle-down"></i>
							</a>
						</p>
					</div>

					<div id="collapseTwo" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Reparo")){
								%>

								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
						
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="panel panel-default" id="pedreiro">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" id="collapse"
					data-parent="#accordion" href="#collapseB"> <i
					class="fas fa-th-large"></i> Pedreiro <i
					class="fa fa-angle-down"></i>
				</a>
			</p>

		</div>
		<div id="collapseB" class="panel-collapse collapse">
			<div class="panel-body">

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseThree"> <i
								class="fas fa-th-large"></i> Azulegista / piso <i
								class="fa fa-angle-down"></i>
							</a>
						</p>
					</div>

					<div id="collapseThree" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Azulegista / Piso")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseFour"> <i
								class="fas fa-th-large"></i> Rebocar Parede <i
								class="fa fa-angle-down"></i>
							</a>
						</p>
					</div>
					<div id="collapseFour" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Rebocar parede")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseFive"> <i
								class="fas fa-th-large"></i> Construir Escadas <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapseFive" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Construir escadas")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseSeven"> <i
								class="fas fa-th-large"></i> Fazer Contrapiso <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapseSeven" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Fazer contrapiso")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="panel panel-default" id="pintura">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseC"> <i class="fas fa-paint-roller"></i>
					Pintor <i class="fa fa-angle-down"></i>
				</a>
			</p>

		</div>
		<div id="collapseC" class="panel-collapse collapse">
			<div class="panel-body">


				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseEight"> <i
								class="fas fa-paint-roller"></i> Pintura Clássica <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapseEight" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Pintura classica")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseNine"> <i
								class="fas fa-paint-roller"></i> Grafite <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapseNine" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Grafite")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseTeen"> <i
								class="fas fa-paint-roller"></i> Textura <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapseTeen" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Textura")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null){
								%>
			
								<div class="buttons">
									<button class="primary" onclick="openModal()">Fazer pedido </button>
								</div>

								<%
									}else if(session.getAttribute("prestador") != null){
									
								%>

								<%
									}else if(session.getAttribute("administrador") != null){
								%>
								<div class="buttons">
									<button class="primary"> <a href="deletarAnuncio?id_anuncio=<%=as.getId()%>"> Fazer Pedido </a> </button>
								</div>

								<%
								} else{
								%>
									<div class="buttons">
										<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
									</div>
								<%
									}
								%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapse0"> <i
								class="fas fa-paint-roller"></i> Papel de parede <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapse0" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Papel de parede")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
									%>
				
									<div class="buttons">
										<button class="primary" onclick="openModal()">Fazer pedido </button>
									</div>

									<%
									} else{
									%>
										<div class="buttons">
											<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
										</div>
									<%
										}
									%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="panel panel-default" id="marceneiro">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseD"> <i class="fas fa-tools"></i>
					Marceneiro <i class="fa fa-angle-down"></i>
				</a>
			</p>

		</div>
		<div id="collapseD" class="panel-collapse collapse in">
			<div class="panel-body">

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapsefourteen"> <i
								class="fas fa-tools"></i> Montagem <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapsefourteen" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Montagem")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
									%>
				
									<div class="buttons">
										<button class="primary" onclick="openModal()">Fazer pedido </button>
									</div>

									<%
									} else{
									%>
										<div class="buttons">
											<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
										</div>
									<%
										}
									%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseFifteen"> <i
								class="fas fa-tools"></i> Reformar <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>

					<div id="collapseFifteen" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Reforma")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
											if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
										%>
					
										<div class="buttons">
											<button class="primary" onclick="openModal()">Fazer pedido </button>
										</div>

										<%
										} else{
										%>
											<div class="buttons">
												<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
											</div>
										<%
											}
										%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseSixteen"> <i
								class="fas fa-tools"></i> Porta de Madeira <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>

					<div id="collapseSixteen" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Porta de madeira")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
									%>
				
									<div class="buttons">
										<button class="primary" onclick="openModal()">Fazer pedido </button>
									</div>

									<%
									} else{
									%>
										<div class="buttons">
											<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
										</div>
									<%
										}
									%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<p class="panel-title">
							<a data-toggle="collapse" id="collapse"
								data-parent="#accordion" href="#collapseSeventeen"> <i
								class="fas fa-tools"></i> Fazer Móveis sob medida <i
								class="fa fa-angle-down"></i>
							</a>
						</p>

					</div>
					<div id="collapseSeventeen" class="panel-collapse collapse">
						<div class="panel-body">

							<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Moveis sobmedida")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
									if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
									%>
				
									<div class="buttons">
										<button class="primary" onclick="openModal()">Fazer pedido </button>
									</div>

									<%
									} else{
									%>
										<div class="buttons">
											<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
										</div>
									<%
										}
									%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
						</div>
					</div>
				</div>

			</div>

		</div>


	</div>

	<div class="panel panel-default" id="encanamento">
		<div class="panel-heading">
			<p class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion"
					href="#collapseE"> <i class="far fa-hand-paper"></i>
					Encanador <i class="fa fa-angle-down"></i>
				</a>
			</p>
		</div>

		<div id="collapseE" class="panel-collapse collapse in">
			<!-- Corpo da categoria  -->
			<div class="panel-body">

				<section class="cards-wrapper">
								<%
								try {
									for (AnuncioServico as : listaAnuncioPedidos) {
										if(as.getSubcategoria().equals("Encanador")){
								%>
								<div class="card-grid-space">
									<div class="card-container">
											<img class="round"
						src="../../upload/<%=as.getFoto()%>" alt="user" />
					
										<h3 style="color: #231E39;"> <%=as.getTitulo()%></h3>
										<h6 class="nameUser"><i class="fas fa-user" ></i> <%=as.getPrestadorServico().getUser().getNome()%></h6>
										<h6 class="nameLocal">
											<i class="fas fa-map-marker-alt"></i>
											<%=as.getPrestadorServico().getUser().getBairro()%>,
											<%=as.getPrestadorServico().getUser().getRua()%></h6>
										<p> <%=as.getDescricao()%> </p>
					
										<%
											if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
										%>
					
										<div class="buttons">
											<button class="primary" onclick="openModal()">Fazer pedido </button>
										</div>

										<%
										} else{
										%>
											<div class="buttons">
												<button class="primary"> <a href="../login/login.jsp"> Fazer Pedido </a> </button>
											</div>
										<%
											}
										%>
					
										<div class="skills">
											<h6><%=as.getCategoria()%></h6>
											<ul>
												<li><%=as.getSubcategoria()%></li>
											</ul>
										</div>
									</div>
								</div>
								<%
										}
								}
								} catch (Exception e) {
								out.print("Erro");
								}
								%>
							</section>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>

</div>
</div>

</div>

			<!-- Começo Modal -->
			<div class="modal hide">
				<div>
					<a href="#fechar" title="Fechar" class="fechar"
						onclick="closeModal()">x</a>

						<main class="contactModal">
							<div class="contactForm contactFormModal">
								<form action="cadastrarPedido" method="post">
									<h2>Envie o seu pedido aqui!</h2>
										<%
											if(session.getAttribute("cliente") != null){
												Cliente cliente = (Cliente) session.getAttribute("cliente");
												Telefone telefone = (Telefone) session.getAttribute("telefone");
										%>
										<div class="formModal">
											
											<div>
												<div class="inputBox">
													<input type="hidden" name="id_cliente" id="id_cliente" required value="<%= cliente.getId() %>" />
												</div>
												
												<div class="inputBox">
													<input type="text" name="nome" id="nome" required value="<%= cliente.getUser().getNome() %>" />
													 <span>Nome</span>
												</div>
												
																		
												<div class="inputBox">
													<input type="number" name="telefone" id="telefone" required value="<%= telefone.getNumero() %>" /> 
													<span>Telefone</span>
												</div>
											</div>
						
											<div class="formDireita">
												<div class="inputBox">
													<input type="hidden" name="id_prestador" id="id_prestador" required/>
												</div>
												
												<div class="inputBox">
													<input type="email" name="email" id="email" required value="<%= cliente.getUser().getEmail() %>" />
													<span>Email</span>
												</div>
												
																		
												<div class="inputBox">
													<input type="text" name="bairro" id="bairro" required value="<%= cliente.getUser().getBairro() %>" />
													<span>Bairro</span>
												</div>
						
											</div>
											
										</div>
										<div class="inputBox inputModal">
											<textarea name="pedido" required></textarea>
											<span>Detalhes do seu pedido</span>
										</div>
										<h3>Adicione a Sua Imagem</h3>
										<input type="file" name="img" id="img" accept="image/png, image/gif, image/jpeg" />
										
										<div class="inputBox buttonModal">
											<input type="submit" name="" value="Cadastrar" />
										</div>
										<%	
											} else{	
										%>
										<div class="formModal">
											
											<div>
												
												<div class="inputBox">
													<input type="text" name="nome" id="nome" required/>
													 <span>Nome</span>
												</div>
												
																		
												<div class="inputBox">
													<input type="number" name="telefone" id="telefone" required /> 
													<span>Telefone</span>
												</div>
											</div>
						
											<div class="formDireita">
												<div class="inputBox">
													<input type="email" name="email" id="email" required />
													<span>Email</span>
												</div>
												
																		
												<div class="inputBox">
													<input type="text" name="bairro" id="bairro" required />
													<span>Bairro</span>
												</div>
						
											</div>
											
										</div>
										<div class="inputBox inputModal">
											<textarea name="pedido" required></textarea>
											<span>Detalhes do seu pedido</span>
										</div>
										
										<h3>Adicione a Sua Imagem</h3>
										
										<input type="file" name="img" id="img" accept="image/png, image/gif, image/jpeg" />

										<div class="inputBox buttonModal">
											<input type="submit" name="" value="Cadastrar" />
										</div>
										<%
											}
										%>
								</form>
							</div>
						</main>
	
				</div>
			</div>
			<!-- Fim Modal -->

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
						arial-label="Facebook"> <i class="fab fa-facebook"></i>
					</a> <a href="#" class="social-icon-link instagram" target="_blank"
						arial-label="Instagram"> <i class="fab fa-instagram"></i>
					</a> <a href="#" class="social-icon-link youtube" target="_blank"
						arial-label="Youtube"> <i class="fab fa-youtube"></i>
					</a> <a href="#" class="social-icon-link twitter" target="_blank"
						arial-label="Twitter"> <i class="fab fa-twitter"></i>
					</a> <a href="#" class="social-icon-link linkedin" target="_blank"
						arial-label="Linkedin"> <i class="fab fa-linkedin"></i>
					</a>
				</div>
			</div>
		</section>
	</div>
	<!-- Fim do Footer -->
	<script src="https://kit.fontawesome.com/6a495ab8b4.js"
		crossorigin="anonymous"></script>
	<script src="../../js/jquery.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<script src="../../js/scriptModal.js"></script>
</body>
</html>