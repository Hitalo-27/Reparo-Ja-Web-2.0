<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
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

    <title>Contato</title>
    <link rel="stylesheet" href="../../global/global.css" />
    <link rel="stylesheet" href="../../styles/menu.css" />
    <link rel="stylesheet" href="./quemsomos.css" />
    <link rel="stylesheet" href="../../styles/cardProfile.css" />
    <link rel="stylesheet" href="../../styles/card.css" />
    <link rel="stylesheet" href="../../styles/footer.css" />
  </head>
  <body>
    <div class="menuFixed">
      <nav class="menu">
        <ul>
          <li class="logo">Reparo Já</li>
          <li class="items"><a href="../../index.jsp">Home</a></li>
          <%
          	if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
          %>
          <li class="items"><a href="../anuncioServicos/anuncioServico">Serviços</a></li>
          <%
          	}
          %>
          <%
          	if(session.getAttribute("cliente") != null || session.getAttribute("prestador") != null || session.getAttribute("administrador") != null){
          %>
          <li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
          <%
          	}
          %>
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
    <br /><br /><br />

    <div class="boxImg">
      <div class="title">
        <h1>Conheça mais sobre a Reparo Já</h1>
      </div>

      <table>
        <tr>
          <td>
            <div class="boxSizeImg">
              <img src="../../img/logo.png" alt="Logo" />
            </div>
          </td>

          <td>
            <div class="bodyQuemSomos">
              Reparo já é um novo projeto da empresa Quazar. A empresa Quazar
              visa o desenvolvimento de software para solucionar os problemas do
              seu cotidiano. Empresa fundada em fevereiro de 2021 em parceria
              com a ETEC de Guaianazes.Trabalhamos para tornar a sua
              conectividade acessível ao maior número possível de brasileiro, o
              número de brasileiros desempregado tem crescido e com a
              responsabilidade de ajudarmos nessa área criamos algo para
              facilitar a prestação de serviços de profissionais autônomos,
              segundo avaliação técnica, geolocalização entre outros. <br />
              <br />
              Reparo já foi desenvolvido depois da percepção dos fundadores da
              empresa Quazar na debilidade entre segurança e serviço de
              qualidade. Estamos trabalhando com tecnologia de ponta para
              facilitar seu cotidiano, tornando mais rápido aquilo que
              demandaria um tempo de busca e análise da partes dos usuários, nós
              nos diferenciamos pela agilidade no processo de interação e
              comunicação com o profissional autônomo e o cliente, deixando
              assim o sistema mais dinâmico para o público, fazendo ter econômia
              de tempo, por uma pesquisa da empresa Quazar, observamos que 78%
              das pessoas procuram concertar os eletrodomésticos, pelo cotidiano
              corrido do dia a dia, não procuram um técnico de confiança e de
              qualidade.
            </div>
          </td>
        </tr>
      </table>
    </div>

    <div class="boxImgMobile">
      <div class="title">
        <h1>Conheça mais sobre a Reparo Já</h1>
      </div>

      <div class="boxSizeImg">
        <img src="../../img/logo.png" alt="Logo" />
      </div>

      <div class="bodyQuemSomos">
        Reparo já é um novo projeto da empresa Quazar. A empresa Quazar visa o
        desenvolvimento de software para solucionar os problemas do seu
        cotidiano. Empresa fundada em fevereiro de 2021 em parceria com a ETEC
        de Guaianazes.Trabalhamos para tornar a sua conectividade acessível ao
        maior número possível de brasileiro, o número de brasileiros
        desempregado tem crescido e com a responsabilidade de ajudarmos nessa
        área criamos algo para facilitar a prestação de serviços de
        profissionais autônomos, segundo avaliação técnica, geolocalização entre
        outros. <br />
        <br />
        Reparo já foi desenvolvido depois da percepção dos fundadores da empresa
        Quazar na debilidade entre segurança e serviço de qualidade. Estamos
        trabalhando com tecnologia de ponta para facilitar seu cotidiano,
        tornando mais rápido aquilo que demandaria um tempo de busca e análise
        da partes dos usuários, nós nos diferenciamos pela agilidade no processo
        de interação e comunicação com o profissional autônomo e o cliente,
        deixando assim o sistema mais dinâmico para o público, fazendo ter
        econômia de tempo, por uma pesquisa da empresa Quazar, observamos que
        78% das pessoas procuram concertar os eletrodomésticos, pelo cotidiano
        corrido do dia a dia, não procuram um técnico de confiança e de
        qualidade.
      </div>
    </div>

    <div class="titleAvaliacao">
      <h1>Profissionais mais avaliados</h1>
    </div>

    <section class="cards-wrapper">
      <div class="card-grid-space">
        <div class="card-container">
          <img class="round" src="../../img/icone-missao.png" alt="user" />

          <h3>Missao</h3>

          <p>
            Reparo já tem por objetivo contribuir para empregabilidade de
            sujeitos autônomos e segurança aos cidadãos no momento de solicitar
            um profissional em reparos domésticos.
          </p>

          <div class="skills"></div>
        </div>
      </div>

      <div class="card-grid-space">
        <div class="card-container">
          <img class="round" src="../../img/icone-valores.png" alt="user" />

          <h3>Valores</h3>
          <p>
            <li>Segurança e Acessibilidade a todos;</li>
            <li>Satisfação ao público em geral;</li>
            <li>Alto desempenho e qualidade;</li>
            <li>Parcerias, sinergias e inovação.</li>
          </p>

          <div class="skills"></div>
        </div>
      </div>

      <div class="card-grid-space">
        <div class="card-container">
          <img class="round" src="../../img/icone-vision.png" alt="user" />

          <h3>Visão</h3>
          <p>
            Melhorar seu cotidiano com a facilidade em encontrar um profissional
            em reparos domésticos qualificado com segurança, eficiência,
            rapidez, e sem sair de casa. Procurar contribuir com a solução para
            seus problemas em busca de técnicos perto da sua localização. Nossa
            visão é sempre contribuir para melhorar seu cotidiano para melhor
            através da tecnologia.
          </p>

          <div class="skills"></div>
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
