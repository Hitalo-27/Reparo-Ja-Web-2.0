<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="com.quazar.tcc.model.PrestadorServico"
%> <% PrestadorServico prestador = (PrestadorServico)
request.getAttribute("prestador"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="./global/global.css" />
    <link rel="stylesheet" href="./styles/menu.css" />
    <link rel="stylesheet" href="./pages/atualizar/atualizar.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <title>Atualizar Prestador de Serviço</title>
  </head>
  <body>
    <div class="menuFixed">
      <nav class="menu">
        <ul>
          <li class="logo">Reparo Já</li>
          <li class="items"><a href="./index.jsp">Home</a></li>
          <li class="items"><a href="./pages/servicos/servicos.jsp">Serviços</a></li>
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
          <li class="items"><a href="./pages/contato/contato.jsp">Contato</a></li>
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
    <main class="contact">
      <div class="contactForm">
        <form name="frmContato" action="atualizarPrestador" method="POST">
          <h2>Alterar os Dados</h2>
          <div class="form">
            <div>
              <div class="inputBox">
                <input
                  type="text"
                  name="id"
                  readonly
                  value="<%= prestador.getId_user()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="nome"
                  value="<%= prestador.getUser().getNome()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="email"
                  value="<%= prestador.getUser().getEmail()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="senha"
                  value="<%= prestador.getUser().getSenha()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="cpf"
                  value="<%= prestador.getUser().getCpf()%>"
                />
              </div>
            </div>
            <div class="formDireita">
              <div class="inputBox">
                <input
                  type="text"
                  name="cep"
                  value="<%= prestador.getUser().getCep()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="rua"
                  value="<%= prestador.getUser().getRua()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="numeroCasa"
                  value="<%= prestador.getUser().getNumeroCasa()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="bairro"
                  value="<%= prestador.getUser().getBairro()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="tipoPrestador"
                  value="<%= prestador.getTipoPrestador()%>"
                />
              </div>
              <div class="inputBox">
                <input
                  type="text"
                  name="qtdeFuncionario"
                  value="<%= prestador.getQtdeFuncionarios()%>"
                />
              </div>
            </div>
          </div>

          <div class="inputBox">
            <input type="submit" value="Salvar" />
          </div>
        </form>
      </div>
    </main>

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
  </body>
</html>
