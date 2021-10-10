<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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

    <title>Contato</title>
    <link rel="stylesheet" href="../../global/global.css" />
    <link rel="stylesheet" href="../../styles/menu.css" />
    <link rel="stylesheet" href="./contato.css" />
    <link rel="stylesheet" href="../../styles/footer.css" />
  </head>
  <body>
    <div class="menuFixed">
      <nav class="menu">
        <ul>
          <li class="logo">Reparo Já</li>
          <li class="items"><a href="../../index.jsp">Home</a></li>
          <li class="items"><a href="../servicos/servicos.jsp">Serviços</a></li>
          <%
          	if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
          %>
          <li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
          <%
          	}
          %>
          <li class="items"><a href="../quemSomos/quemsomos.jsp">Quem Somos</a></li>
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
    <br /><br /><br />

    <section class="contact">
      <div class="contact-below">
        <h2>Contate-nos</h2>
        <p>
          Entre em contato conosco para qualquer duvida, reclamação ou elogios,
          o seu feedback é muito importante para nos.
        </p>
      </div>
      <div class="container-contact">
        <div class="contactInfo">
          <div class="box">
            <div class="icon">
              <i class="fa fa-street-view" aria-hidden="true"></i>
            </div>
            <div class="text">
              <h3>Endereço</h3>
              <p>
                R. Felíciano de Mendonça,
                <br />
                290 - Guaianases, São Paulo
              </p>
            </div>
          </div>

          <div class="box">
            <div class="icon">
              <i class="fa fa-phone" aria-hidden="true"></i>
            </div>
            <div class="text">
              <h3>Telefone</h3>
              <p>(11)2554-0978</p>
            </div>
          </div>

          <div class="box">
            <div class="icon">
              <i class="fa fa-envelope" aria-hidden="true"></i>
            </div>
            <div class="text">
              <h3>Email</h3>
              <p>reparojaoficial@gmail.com</p>
            </div>
          </div>
        </div>
        <div class="contactForm">
          <form>
            <h2>Envie sua menssagem</h2>
            <div class="inputBox">
              <input type="text" name="" required />
              <span>Nome completo</span>
            </div>

            <div class="inputBox">
              <input type="text" name="" required />
              <span>Email</span>
            </div>

            <div class="inputBox">
              <input type="text" name="" required />
              <span>Assunto</span>
            </div>

            <div class="inputBox">
              <textarea type="text" name="" required></textarea>
              <span>Menssagem...</span>
            </div>

            <div class="inputBox">
              <input type="submit" name="" value="Enviar" required />
            </div>
          </form>
        </div>
      </div>
    </section>

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
