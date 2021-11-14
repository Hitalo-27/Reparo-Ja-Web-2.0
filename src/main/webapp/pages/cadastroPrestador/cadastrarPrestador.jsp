<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String cadastro = (String) request.getAttribute("cadastro");
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
    <link rel="stylesheet" href="./prestador.css" />
    <link rel="stylesheet" href="../../styles/footer.css" />

    <!-- Adicionando Javascript -->
    <script>
    
      function limpa_formulário_cep() {
              //Limpa valores do formulário de cep.
              document.getElementById('rua').value=("");
              document.getElementById('bairro').value=("");
              // document.getElementById('cidade').value=("");
              // document.getElementById('uf').value=("");
              // document.getElementById('ibge').value=("");
      }
  
      function meu_callback(conteudo) {
          if (!("erro" in conteudo)) {
              //Atualiza os campos com os valores.
              document.getElementById('rua').value=(conteudo.logradouro);
              document.getElementById('bairro').value=(conteudo.bairro);
              // document.getElementById('cidade').value=(conteudo.localidade);
              // document.getElementById('uf').value=(conteudo.uf);
              // document.getElementById('ibge').value=(conteudo.ibge);
          } //end if.
          else {
              //CEP não Encontrado.
              limpa_formulário_cep();
              alert("CEP não encontrado.");
          }
      }
          
      function pesquisacep(valor) {
  
          //Nova variável "cep" somente com dígitos.
          var cep = valor.replace(/\D/g, '');
  
          //Verifica se campo cep possui valor informado.
          if (cep != "") {
  
              //Expressão regular para validar o CEP.
              var validacep = /^[0-9]{8}$/;
  
              //Valida o formato do CEP.
              if(validacep.test(cep)) {
  
                  //Preenche os campos com "..." enquanto consulta webservice.
                  document.getElementById('rua').value="...";
                  document.getElementById('bairro').value="...";
                  // document.getElementById('cidade').value="...";
                  // document.getElementById('uf').value="...";
                  // document.getElementById('ibge').value="...";
  
                  //Cria um elemento javascript.
                  var script = document.createElement('script');
  
                  //Sincroniza com o callback.
                  script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';
  
                  //Insere script no documento e carrega o conteúdo.
                  document.body.appendChild(script);
  
              } //end if.
              else {
                  //cep é inválido.
                  limpa_formulário_cep();
                  alert("Formato de CEP inválido.");
              }
          } //end if.
          else {
              //cep sem valor, limpa formulário.
              limpa_formulário_cep();
          }
      };
  
      </script>

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
          <li class="items"><a href="../perfil/perfil.jsp">Perfil</a></li>
          <%
          	}
          %>
          <li class="items">
            <a href="../quemSomos/quemsomos.jsp">Quem Somos</a>
          </li>
          <li class="items"><a href="../contato/contato.jsp">Contato</a></li>
          <li class="login"><a href="../login/login.jsp">Login</a></li>
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
        <form action="cadastrarPrestador" method="POST">
          <h2>Cadastre-me como prestador de seviços</h2>
          <div class="form">
            <div>
              <div class="inputBox">
                <input type="text" name="nome" id="nome" required />
                <span>Nome completo</span>
              </div>

              <div class="inputBox">
                <input type="number" name="telefone" id="telefone" required />
                <span>Telefone</span>
              </div>

              <div class="inputBox">
                <input type="text" name="cep" id="cep" size="10" maxlength="9" onblur="pesquisacep(this.value);" required />
                <span>CEP</span>
              </div>

              <div class="inputBox">
                <input type="text" name="rua" id="rua" required />
                <span>Rua</span>
              </div>

              <div class="inputBox">
                <input type="number" name="idade" id="idade" required />
                <span>Idade</span>
              </div>

              <div class="inputBox">
                <input type="text" name="tipoPrestador" id="tipoPrestador" required />
                <span>Tipo Prestador</span>
              </div>

            </div>

            <div class="formDireita">
              <div class="inputBox">
                <input type="email" name="email" id="email" required />
                <span>Email</span>
              </div>

              <div class="inputBox">
                <input type="text" name="cpf" id="cpf" maxlength="11" required  />
                <span>CPF</span>
              </div>

              <div class="inputBox">
                <input type="text" name="bairro" id="bairro" required />
                <span>Bairro</span>
              </div>

              <div class="inputBox">
                <input type="number" name="numeroCasa" id="numeroCasa" required />
                <span>Numero da Casa</span>
              </div>

              <div class="inputBox">
                <input type="password" name="senha" id="senha" required />
                <span>Senha</span>
              </div>

              <div class="inputBox">
                <input
                  type="number"
                  name="qtdeFuncionarios"
                  id="qtdeFuncionarios"
                  required
                />
                <span>Qtde Funcionarios</span>
              </div>
            </div>
          </div>

         <h3>Serviços Prestados</h3>

        <div class="tipoPres">
          <input type="checkbox" name="eletrodomesticos" id="eletrodomesticos"/>
          <label for="eletrodomesticos">Eletrodomesticos</label>
          <i class="fas fa-car-battery eletro"></i>

          <input type="checkbox" name="pintor" id="pintor"/>
          <label for="pintor">Pintor</label>
          <i class="fas fa-paint-roller pintor"></i>

        </div>
         
        <div class="tipoPres">
          <input type="checkbox" name="marceneiro" id="marceneiro" />
          <label for="marceneiro">Marceneiro</label>
          <i class="fas fa-tools marceneiro"></i>

          <input class="eletricista" type="checkbox" name="eletricista" id="eletricista" />
          <label for="eletricista">Eletricista</label>
          <i class="fas fa-bolt"></i>

        </div>

        <div class="tipoPres">
         <input type="checkbox" name="pedreiro" id="pedreiro" />
         <label for="pedreiro">Pedreiro</label>
         <i class="fas fa-th-large pedreiro"></i>

         <input class="encanador" type="checkbox" name="encanador" id="encanador" />
          <label for="encanador">Encanador</label>
          <i class="far fa-hand-paper"></i>
        </div>
         

          <%
          	if(cadastro != null){
          %>
          <p><%= cadastro %></p>
          <%
          	}
          %>
          <div class="inputBox">
            <input type="submit" name="" value="Cadastrar" required />
          </div>
        </form>
      </div>
    </main>

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
