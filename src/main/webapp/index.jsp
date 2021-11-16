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
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
    <link rel="shortcut icon" href="./img/logoFundo.png" type="image/x-icon" />    
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Reparo Já</title>
    <link rel="stylesheet" href="./pages/anuncioServicos/bootstrap.min.css">
    <link rel="stylesheet" href="./global/global.css" />
    <link rel="stylesheet" type="text/css" href="./styles/cardProfile.css" /> 
    <link rel="stylesheet" href="./pages/anuncioServicos/style.css" /> 
    <link rel="stylesheet" type="text/css" href="./styles/menu.css" />
    <link rel="stylesheet" type="text/css" href="./styles.css" />
    <link rel="stylesheet" type="text/css" href="./styles/footer.css" /> 
    <link rel="stylesheet" href="./pages/anuncioServicos/responsive.css" /> 
    <link rel="stylesheet" type="text/css" href="./styles/card.css" />

  </head>
  <body>
    <div class="menuFixed">
      <nav class="menu">
        <ul>
          <li class="logo">Reparo Já</li>
          <li class="items"><a href="./index.jsp">Home</a></li>
          <%
          	if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
          %>
          <li class="items"><a href="./pages/anuncioServicos/anuncioServico">Serviços</a></li>
          <%
          	}
          %>
          <%
          	if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
          %>
          <li class="items"><a href="./pages/perfil/perfil.jsp">Perfil</a></li>
          <%
          	}
          %>
          <li class="items">
            <a href="./pages/quemSomos/quemsomos.jsp">Quem Somos</a>
          </li>
          <li class="items">
            <a href="./pages/contato/contato.jsp">Contato</a>
          </li>
          <%
          	if(session.getAttribute("cliente") == null && session.getAttribute("prestador") == null && session.getAttribute("administrador") == null){
          %>
          <li class="login"><a href="./pages/login/login.jsp">Login</a></li>
          <%
          	}
          	else{
          %>
          <li class="login"><a href="logout">Logout</a></li>
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
    <div class="Menuvideo">
      <video src="./video/reparoja.mp4" autoPlay loop muted></video>
      <h1>Reparo Já</h1>
      <p>Encontre profissionais de confiança!</p>
    </div>

    <div id="bodyColor">
      <div class="bodyTitle"><h1>Categorias mais procuradas</h1></div>

      <section class="cards-wrapper">
        <div class="card-grid-space">
          <a
            class="card"
            href="#abrirModal"
            style="background-image: url('./img/eletro.jpg')"
            onclick="openModalEletrodomestico()"
          >
            <div class="bodyCard">
              <h1>Eletrodomesticos</h1>
              <p>
                Conserto de Eletrodomesticos com 
                os melhores profissionais daregião
              </p>
              <div class="tags">
                <div class="tag">Eletrodomesticos</div>
              </div>
            </div>
          </a>
        </div>

        <div class="card-grid-space">
          <!-- <div class="num">01</div> -->
          <a
            class="card"
            href="#"
            style="background-image: url('./img/marceneiro.jpg')"
            onclick="openModalMarceneiro()"
          >
            <div class="bodyCard">
              <h1>Marceneiro</h1>
              <p>
                Moveis planejados com os melhores profissionais você encontra aqui!
              </p>
              <div class="tags">
                <div class="tag">Marcenaria</div>
              </div>
            </div>
          </a>
        </div>

        <div class="card-grid-space">
          <!-- <div class="num">01</div> -->
          <a
            class="card"
            href="#"
            style="background-image: url('./img/pintura.jpg')"
          >
            <div class="bodyCard">
              <h1>Pintura</h1>
              <p>
                Os Melhores pintores da sua 
                região você encontra aqui!
              </p>
              <div class="tags">
                <div class="tag">Pintura</div>
              </div>
            </div>
          </a>
        </div>

        <div class="card-grid-space">
          <!-- <div class="num">01</div> -->
          <a
            class="card"
            href="#"
            style="background-image: url('./img/encanamento.jpg')"
          >
            <div class="bodyCard">
              <h1>Encanamento</h1>
              <p>
                Os Melhores encanadores da sua 
                região você encontra aqui!
              </p>
              <div class="tags">
                <div class="tag">Encanamento</div>
              </div>
            </div>
          </a>
        </div>

        <div class="card-grid-space">
          <!-- <div class="num">01</div> -->
          <a
            class="card"
            href="#"
            style="background-image: url('./img/eletricista.jpg')"

          >
            <div class="bodyCard">
              <h1>Eletricista</h1>
              <p>
                Os Melhores eltricistas da sua 
                região você encontra aqui!
              </p>
              <div class="tags">
                <div class="tag">Eletricista</div>
              </div>
            </div>
          </a>
        </div>

        <div class="card-grid-space">
          <!-- <div class="num">01</div> -->
          <a
            class="card"
            href="#"
            style="background-image: url('./img/pedreiro.jpg')"
          >
            <div class="bodyCard">
              <h1>Pedreiro</h1>
              <p>
                Os melhores pedreiros para conserto e construção de casas.
              </p>
              <div class="tags">
                <div class="tag">Pedreiro</div>
              </div>
            </div>
          </a>
        </div>
      </section>

      <!-- Começo Modal -->
    <div class="modal eletrodomestico hide">
      <div>
      <a href="#fechar" title="Fechar" class="fechar" onclick="closeModal()">x</a>
      <div class="categorias">
        <h1>Nossas Categorias</h1>
        <!-- Grid dos campos de categoria  -->
        <div class="col-md-12">
      <div class="full margin_bottom_30">
        <div class="accordion border_circle">
          <div class="bs-example"> 
            <div class="panel-group" id="accordion">
    
              <!-- Categorias -->
    
                      <!-- Corpo da categoria  -->

              
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
          </div>
        </div>
      </div>
      
        </div>
        </div>
    
      </div>
     
      </div>
    </div>
    <!-- Fim Modal -->

    <!-- Começo Modal -->
    <div class="modal marceneiro hide">
      <div>
      <a href="#fechar" title="Fechar" class="fechar" onclick="closeModalMarceneiro()">x</a>
      <div class="categorias">
        <h1>Nossas Categorias</h1>
        <!-- Grid dos campos de categoria  -->
        <div class="col-md-12">
      <div class="full margin_bottom_30">
        <div class="accordion border_circle">
          <div class="bs-example"> 
            <div class="panel-group" id="accordion">
    
              <!-- Categorias -->
    
                      <!-- Corpo da categoria  -->

              
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
          </div>
        </div>
      </div>
      
        </div>
        </div>
    
      </div>
     
      </div>
    </div>
    <!-- Fim Modal -->

      <div class="bodyTitle"><h1>Profissionais mais avaliados</h1></div>

      <section class="cards-wrapper">
        <div class="card-grid-space">
          <div class="card-container">
            <span class="pro">⭐8/10</span>
            <img class="round" src="./img/tecnico.jpg" alt="user" />

            <h3>Bruno</h3>
            <h6>São Paulo</h6>
            <p>
             Tecnico focado em consertos de Eletrodomesticos
            </p>

            <div class="buttons">
              <button class="primary">Mensagem</button>
            </div>

            <div class="skills">
              <h6>Habilidades</h6>
              <ul>
                <li>Trabalho feito de forma rapida</li>
                <li>Atencioso</li>
                <li>Otimo Preço</li>
                <li>Otima Disponibilidade</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="card-grid-space">
          <div class="card-container">
            <span class="pro">⭐8/10</span>
            <img class="round" src="./img/tecnico.jpg" alt="user" />

            <h3>Bruno</h3>
            <h6>São Paulo</h6>
            <p>
             Tecnico focado em consertos de Eletrodomesticos
            </p>

            <div class="buttons">
              <button class="primary">Mensagem</button>
            </div>

            <div class="skills">
              <h6>Habilidades</h6>
              <ul>
                <li>Trabalho feito de forma rapida</li>
                <li>Atencioso</li>
                <li>Otimo Preço</li>
                <li>Otima Disponibilidade</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="card-grid-space">
          <div class="card-container">
            <span class="pro">⭐8/10</span>
            <img class="round" src="./img/tecnico.jpg" alt="user" />

            <h3>Bruno</h3>
            <h6>São Paulo</h6>
            <p>
              Tecnico focado em consertos de Eletrodomesticos
            </p>

            <div class="buttons">
              <button class="primary">Mensagem</button>
            </div>

            <div class="skills">
              <h6>Habilidades</h6>
              <ul>
                <li>Trabalho feito de forma rapida</li>
                <li>Atencioso</li>
                <li>Otimo Preço</li>
                <li>Otima Disponibilidade</li>
              </ul>
            </div>
          </div>
        </div>
      </section>


    </div>

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
    <script src="https://kit.fontawesome.com/6a495ab8b4.js" crossorigin="anonymous"></script>
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/scriptModal.js"></script>
  </body>
</html>
