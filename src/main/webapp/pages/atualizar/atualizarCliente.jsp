<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.quazar.tcc.model.Cliente" %>
<%@ page import="com.quazar.tcc.model.Telefone" %> 

<%
	Cliente cliente = (Cliente) request.getAttribute("cliente");
	Telefone telefone = (Telefone) request.getAttribute("telefone");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="shortcut icon" href="./img/logoFundo.png" type="image/x-icon" />
    <link rel="stylesheet" href="./global/global.css" />
    <link rel="stylesheet" href="./styles/menu.css" />
    <link rel="stylesheet" href="./pages/atualizar/atualizar.css" />
    <link rel="stylesheet" href="./styles/footer.css" />
    <title>Atualizar Cliente</title>
  </head>
  <body>
    <div class="menuFixed">
      <nav class="menu">
        <ul>
          <li class="logo">Reparo Já</li>
          <li class="items"><a href="./index.jsp">Home</a></li>
          <li class="items"><a href="./pages/anuncioServicos/anuncioServico">Serviços</a></li>
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
        <form name="frmContato" action="atualizarCliente" method="POST">
          <h2>Alterar os Dados</h2>
          <div class="form">
            <div>
              <div class="inputBox">
                <input
                  type="hidden"
                  name="id"
                  readonly
                  value="<%= cliente.getId_user()%>"
                />
              </div>

              <div class="inputBox">
                <input
                  type="text"
                  name="nome"
                  value="<%= cliente.getUser().getNome()%>"
                />
                <span>Nome completo</span>
              </div>

              <div class="inputBox">
                <input
                  type="number"
                  name="telefone"
                  value="<%= telefone.getNumero()%>"
                />
                <span>Telefone</span>
              </div>

              <div class="inputBox">
                <input
                  type="number"
                  name="cep"
                  value="<%= cliente.getUser().getCep()%>"
                />
                <span>CEP</span>
              </div>

              <div class="inputBox">
                <input
                  type="text"
                  name="rua"
                  value="<%= cliente.getUser().getRua()%>"
                />
                <span>Rua</span>
              </div>

              <div class="inputBox">
                <input
                  type="number"
                  name="idade"
                  value="<%= cliente.getUser().getIdade()%>"
                />
                <span>Idade</span>
              </div>
            
              <div class="inputBox">
                <input
                  type="hidden"
                  name="id_telefone"
                  value="<%= telefone.getId()%>"
                />
              </div>
              
            </div>
            
            <div class="formDireita">
            
              <div class="inputBox">
                <input
                  type="email"
                  name="email"
                  value="<%= cliente.getUser().getEmail()%>"
                />
                <span>Email</span>
              </div>

              <div class="inputBox">
                <input
                  type="number"
                  name="cpf"
                  value="<%= cliente.getUser().getCpf()%>"
                />
                <span>CPF</span>
              </div>

              <div class="inputBox">
                <input
                  type="text"
                  name="bairro"
                  value="<%= cliente.getUser().getBairro()%>"
                />
                <span>Bairro</span>
              </div>

              <div class="inputBox">
                <input
                  type="number"
                  name="numeroCasa"
                  value="<%= cliente.getUser().getNumeroCasa()%>"
                />
                <span>Numero da casa</span>
              </div>

              <div class="inputBox">
                <input
                  type="password"
                  name="senha"
                  value="<%= cliente.getUser().getSenha()%>"
                />
                <span>Senha</span>
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
