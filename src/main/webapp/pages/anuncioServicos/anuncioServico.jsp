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
    <link rel="stylesheet" type="text/css" href="./bootstrap.min.css"/>
		<link rel="stylesheet" href="../../global/global.css" />
		<link rel="stylesheet" href="../../styles/menu.css" />
    <link rel="stylesheet" href="./style.css" />
		<link rel="stylesheet" href="./anuncio.css" />
		<link rel="stylesheet" href="../../styles/cardProfile.css" />
		<link rel="stylesheet" href="../../styles/footer.css" />
    <link rel="stylesheet" href="./responsive.css" />
    <script defer src="../../js/scriptAnuncio.js"></script>
	  </head>
<body>
	
	<!-- Inicio do Menu -->
	<div class="menuFixed">
		<nav class="menu">
		  <ul>
			<li class="logo">Reparo Já</li>
			<li class="items"><a href="../../index.jsp">Home</a></li>
			<li class="items"><a href="../anuncioServicos/anuncioServico">Serviços</a></li>
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

	<main class="contact">
		<div class="contactForm">
		<form action="fazerAnuncio" method="POST">
			<div class="form">
				<h2>Faça o Seu Anuncio Aqui!</h2>
				<div class="inputBox">
			<input type="text" name="titulo" id="titulo" required>
			<span>Digite aqui o titulo do seu anuncio</span>
			</div>
	
			<div class="inputBox">
			<textarea name="descricao" required></textarea>
			<span>Digite aqui o seu anuncio</span>
			</div>
	
			<div class="inputBox">
			<label>Selecione uma categoria: </label>
			<select name="categoria" id="categoria">
        <option value="0">Selecionar Categoria</option>
        <option value="eletroeletronica">Eletrodomesticos</option>
				<option value="marcenaria">Marcenaria</option>
				<option value="eletronica">Eletronica</option>
				<option value="pedreiro">Pedreiro</option>
				<option value="pintor">Pintor</option>
        <option value="encanador">Encanador</option>
			</select>
			</div>
			
			<div class="inputBox">
			<label>Selecione uma sub-categoria: </label>
			<select name="subcategoria" id="subcategoria"></select>
			</div>
	
			<div class="inputBox">
			<input type="submit" value="Fazer Anuncio">
			</div>
		</div>
		</form>
		</div>
  </main>

  

	<h1>Seus anuncios</h1>
	<div class="ride_section_2 layout_padding">
			<%
				try{
					List<AnuncioServico> anuncioServicos = anuncioServicoService
							.selectAnunciosServicoByIdPrestador((PrestadorServico)request.getSession().getAttribute("prestador"));
					for(AnuncioServico as : anuncioServicos){
			%>

			<script>
				function Deletar(){
					var r=confirm("Deseja Mesmo Deletar o Seu Anuncio?");
					if (r==true)
					{
						window.location = "deletarAnuncio?id_anuncio=<%= as.getId() %>";
					}
					document.getElementById("demo").innerHTML=x;
				}
			</script>
        <div class="container">
          <div class="row">
            <div class="col-sm-4">
              <div class="image_3">
                <img src="./images/img-4.png" style="height: 280px" />
              </div>
            </div>
            <div class="col-sm-8">
              <h1 class="cabe_text"><%= as.getTitulo() %></h1>
              <h5 class="local_text"> <i class="fas fa-map-marker-alt"></i> <%= as.getPrestadorServico().getUser().getBairro() %>, <%= as.getPrestadorServico().getUser().getRua() %></h5>
              <h5 class="local_text"> <i class="fas fa-user"></i> <%= as.getPrestadorServico().getUser().getNome() %> </h5>
              <p class="long_text">
                <%= as.getDescricao() %>
              </p>
              <button class="buttonDelAtu"><a href="atualizarAnuncio">Atualizar</a></button>
              <button class="buttonDelAtu"><a href="deletarAnuncio?id_anuncio=<%= as.getId() %>">Deletar</a></button>
            </div>
          </div>
        </div>

			<%
					}
				}
				catch(Exception e){
					out.print("Erro");
				}
			%>
	<%
		}
	%>
	</div>

  <div class="categorias">
    <h1>Nossas Categorias</h1>
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
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseG">
                  <i class="far fa-hand-paper"></i> Destaques <i class="fa fa-angle-down"></i>
                </a> 
              </p>
            </div>

            <div id="collapseG" class="panel-collapse collapse in show">
              <!-- Corpo da categoria  -->
              <div class="panel-body">
               
                <div class="ride_section_2 layout_padding">
                  <%
                    try{
                      for(AnuncioServico as : listaAnuncioPedidos){
                  %>
                    <div class="container">
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="image_3">
                            <img src="./images/img-4.png" style="height: 280px" />
                          </div>
                        </div>
                        <div class="col-sm-8">
                          <h1 class="cabe_text"><%= as.getTitulo() %></h1>
                          <h5 class="local_text"> <i class="fas fa-map-marker-alt"></i> <%= as.getPrestadorServico().getUser().getBairro() %>, <%= as.getPrestadorServico().getUser().getRua() %></h5>
                          <h5 class="local_text"> <i class="fas fa-user"></i> <%= as.getPrestadorServico().getUser().getNome() %> </h5>
                          <p class="long_text">
                            <%= as.getDescricao() %>
                          </p>
                          <div class="book_bt"><a href="#">Ver mais</a></div>
                        </div>
                      </div>
                    </div>
                  <%
                      }
                    }
                    catch(Exception e){
                      out.print("Erro");
                    }
                  %>
                  </div>
                
              </div>
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <p class="panel-title"> 
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseF">
                  <i class="fas fa-car-battery"></i> Eletrodomestico <i class="fa fa-angle-down"></i>
                </a> 
              </p>
            </div>

            <div id="collapseF" class="panel-collapse collapse in">
              <!-- Corpo da categoria  -->
              <div class="panel-body">
               
                Conteúdo aqui 
                
              </div>
            </div>
          </div>
          

          <div class="panel panel-default">
            <div class="panel-heading">
              <p class="panel-title"> 
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseA">
                    <i class="fas fa-bolt"></i> Eletricista <i class="fa fa-angle-down"></i>
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
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseOne">
                        <i class="fas fa-bolt"></i> Instalação <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>
                  </div>
                  
                  <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                      <!-- Corpo da subtageoria -->
                      Conteúdo aqui

                    </div>
                  </div>

                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseTwo">
                        <i class="fas fa-bolt"></i> Reparo <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>
                  </div>

                  <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui2

                    </div>
                  </div>
                </div>

                <!-- Exemplo com o card na subcategoria  -->
                <div class="ride_section_2 layout_padding">
                  <div class="container">
                    <div class="row">
                      <div class="col-sm-4">
                        <div class="image_3">
                          <img src="images/img-4.png" style="height: 280px" />
                        </div>
                      </div>

                      <div class="col-sm-8">
                        <h1 class="cabe_text">Uloax for Every Pocket</h1>
                        <h5 class="local_text"> <i class="fas fa-map-marker-alt"></i> São Paulo, Guaianazes</h5>
                        <h5 class="local_text"> <i class="fas fa-user"></i> Arthur Leywin </h5>
                        <p class="long_text">

                          It is a long established fact that a reader will be distracted by
                          the readable content of a page when looking at its layout. The
                          point of using Lorem Ipsum is that it has a more-or-less normal
                          distribution of letters, as It is a long established fact that a
                          reader will be distracted by the readable c

                        </p>
                        <div class="book_bt"><a href="#">Ver mais</a></div>
                      </div>

                    </div>
                  </div>
                  </div>
                  <!-- Fim do card -->
              </div>
            </div>
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <p class="panel-title"> 
                <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseB">
                  <i class="fas fa-th-large"></i> Pedreiro <i class="fa fa-angle-down"></i>
                </a> 
              </p>

            </div>
            <div id="collapseB" class="panel-collapse collapse">
              <div class="panel-body">

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseThree">
                        <i class="fas fa-th-large"></i> Azulegista / piso <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>
                  </div>

                  <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui3

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseFour">
                        <i class="fas fa-th-large"></i> Rebocar Parede <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>
                  </div>
                  <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui4

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseFive">
                        <i class="fas fa-th-large"></i> Construir Escadas <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseFive" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui5

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseSeven">
                        <i class="fas fa-th-large"></i> Fazer Contrapiso <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseSeven" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui6

                    </div>
                  </div>
                </div>

                <div class="ride_section_2 layout_padding">
                  <%
                    try{
                      for(AnuncioServico as : listaAnuncioPedidos){
                  %>
                    <div class="container">
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="image_3">
                            <img src="./images/img-4.png" style="height: 280px" />
                          </div>
                        </div>
                        <div class="col-sm-8">
                          <h1 class="cabe_text"><%= as.getTitulo() %></h1>
                          <h5 class="local_text"> <i class="fas fa-map-marker-alt"></i> <%= as.getPrestadorServico().getUser().getBairro() %>, <%= as.getPrestadorServico().getUser().getRua() %></h5>
                          <h5 class="local_text"> <i class="fas fa-user"></i> <%= as.getPrestadorServico().getUser().getNome() %> </h5>
                          <p class="long_text">
                            <%= as.getDescricao() %>
                          </p>
                          <div class="book_bt"><a href="#">Ver mais</a></div>
                        </div>
                      </div>
                    </div>
                  <%
                      }
                    }
                    catch(Exception e){
                      out.print("Erro");
                    }
                  %>
                  </div>

              </div>
            </div>
          </div>
          

          <div class="panel panel-default">
            <div class="panel-heading">
              <p class="panel-title"> 
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseC">
                  <i class="fas fa-paint-roller"></i> Pintor<i class="fa fa-angle-down"></i>
                </a> 
              </p>

            </div>
            <div id="collapseC" class="panel-collapse collapse">
              <div class="panel-body">


                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseEight">
                        <i class="fas fa-paint-roller"></i> Pintura Clássica <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseEight" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui7

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseNine">
                        <i class="fas fa-paint-roller"></i> Grafite <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseNine" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui8

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseTeen">
                        <i class="fas fa-paint-roller"></i> Textura <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseTeen" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui9

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapse0">
                        <i class="fas fa-paint-roller"></i> Papel de parede <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapse0" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui10

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseTwelve">
                        <i class="fas fa-paint-roller"></i> Fazer Contrapiso <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseTwelve" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui11

                    </div>
                  </div>
                </div>

                <div class="ride_section_2 layout_padding">
                  <%
                    try{
                      for(AnuncioServico as : listaAnuncioPedidos){
                  %>
                    <div class="container">
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="image_3">
                            <img src="./images/img-4.png" style="height: 280px" />
                          </div>
                        </div>
                        <div class="col-sm-8">
                          <h1 class="cabe_text"><%= as.getTitulo() %></h1>
                          <h5 class="local_text"> <i class="fas fa-map-marker-alt"></i> <%= as.getPrestadorServico().getUser().getBairro() %>, <%= as.getPrestadorServico().getUser().getRua() %></h5>
                          <h5 class="local_text"> <i class="fas fa-user"></i> <%= as.getPrestadorServico().getUser().getNome() %> </h5>
                          <h5 class="local_text"><%= as.getCategoria() %></h5>
                          <p class="long_text">
                            <%= as.getDescricao() %>
                          </p>
                          <div class="book_bt"><a href="#">Ver mais</a></div>
                        </div>
                      </div>
                    </div>
                  <%
                      }
                    }
                    catch(Exception e){
                      out.print("Erro");
                    }
                  %>
                  </div>

              </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <p class="panel-title"> 
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseD">
                  <i class="fas fa-tools"></i> Marceneiro <i class="fa fa-angle-down"></i>
                </a> 
              </p>

            </div>
            <div id="collapseD" class="panel-collapse collapse in">
              <div class="panel-body">


                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseThirteen">
                        <i class="fas fa-tools"></i> Fazer Contrapiso <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseThirteen" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui12

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapsefourteen">
                        <i class="fas fa-tools"></i> Instalar <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapsefourteen" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui12.2

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseFifteen">
                        <i class="fas fa-tools"></i> Reformar <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>

                  <div id="collapseFifteen" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui13

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseSixteen">
                        <i class="fas fa-tools"></i> Porta de Madeira <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>

                  <div id="collapseSixteen" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui14

                    </div>
                  </div>
                </div>

                <div class="panel panel-default">
                  <div class="panel-heading">
                    <p class="panel-title"> 
                      <a data-toggle="collapse" id="collapse" data-parent="#accordion" href="#collapseSeventeen">
                        <i class="fas fa-tools"></i> Fazer Móveis sob medida <i class="fa fa-angle-down"></i>
                      </a> 
                    </p>

                  </div>
                  <div id="collapseSeventeen" class="panel-collapse collapse">
                    <div class="panel-body">

                      Conteúdo aqui15

                    </div>
                  </div>
                </div>

                <div class="ride_section_2 layout_padding">
                  <%
                    try{
                      for(AnuncioServico as : listaAnuncioPedidos){
                  %>
                    <div class="container">
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="image_3">
                            <img src="./images/img-4.png" style="height: 280px" />
                          </div>
                        </div>
                        <div class="col-sm-8">
                          <h1 class="cabe_text"><%= as.getTitulo() %></h1>
                          <h5 class="local_text"> <i class="fas fa-map-marker-alt"></i> <%= as.getPrestadorServico().getUser().getBairro() %>, <%= as.getPrestadorServico().getUser().getRua() %></h5>
                          <h5 class="local_text"> <i class="fas fa-user"></i> <%= as.getPrestadorServico().getUser().getNome() %> </h5>
                          <p class="long_text">
                            <%= as.getDescricao() %>
                          </p>
                          <div class="book_bt"><a href="#">Ver mais</a></div>
                        </div>
                      </div>
                    </div>
                  <%
                      }
                    }
                    catch(Exception e){
                      out.print("Erro");
                    }
                  %>
                  </div>
                
              </div>
            
            </div>

            
          </div>

          <div class="panel panel-default">
            <div class="panel-heading">
              <p class="panel-title"> 
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseE">
                  <i class="far fa-hand-paper"></i> Encanador <i class="fa fa-angle-down"></i>
                </a> 
              </p>
            </div>

            <div id="collapseE" class="panel-collapse collapse in">
              <!-- Corpo da categoria  -->
              <div class="panel-body">
               
                Conteúdo aqui
                
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
  <script src="https://kit.fontawesome.com/6a495ab8b4.js" crossorigin="anonymous"></script>
  <script src="../../js/jquery.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
</body>
</html>