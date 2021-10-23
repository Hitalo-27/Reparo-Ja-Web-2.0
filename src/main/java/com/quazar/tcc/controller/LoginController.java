package com.quazar.tcc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quazar.tcc.model.Administrador;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.ServicosPrestador;
import com.quazar.tcc.model.Telefone;
import com.quazar.tcc.model.User;
import com.quazar.tcc.service.AdministradorService;
import com.quazar.tcc.service.ClienteService;
import com.quazar.tcc.service.PrestadorServicoService;
import com.quazar.tcc.service.ServicosPrestadorService;
import com.quazar.tcc.service.TelefoneService;
import com.quazar.tcc.service.UserService;

@WebServlet(urlPatterns = {"/pages/login/login"})
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService = new UserService();
	ClienteService clienteService = new ClienteService();
	PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
	AdministradorService administradorService = new AdministradorService();
	TelefoneService telefoneService = new TelefoneService();
	ServicosPrestadorService servicosPrestadorService = new ServicosPrestadorService();
       
    public LoginController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		login(request, response);
	}
	
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		User loginUser = new User(request.getParameter("email"), request.getParameter("senha"));
		User user = userService.selectUserByEmail(loginUser);
		if(user != null && user.getSenha().equals(loginUser.getSenha())) {
			Telefone telefone = telefoneService.selectTelefoneByIdUser(user);
			if(telefone != null) {
				session = request.getSession();
				session.setAttribute("telefone", telefone);
			}
			if(user.getId_tipoUser() == 1) {
				Cliente cliente = clienteService.selectClienteByIdUser(user);
				if(cliente != null) {
					session = request.getSession();
					session.setAttribute("cliente", cliente);
					RequestDispatcher rd = request.getRequestDispatcher("../perfil/perfil.jsp");
					rd.forward(request, response);
				} else {
					response.sendRedirect("../login/login.jsp");
				}
			}
			else if(user.getId_tipoUser() == 2) {
				PrestadorServico prestador = prestadorServicoService.selectPrestadorByIdUser(user);
				if(prestador != null) {
					List<ServicosPrestador> servicosPrestador = servicosPrestadorService
							.selectServicosPrestadorByIdPrestador(prestador.getId());
					session = request.getSession();
					session.setAttribute("prestador", prestador);
					session.setAttribute("servicosPrestador", servicosPrestador);
					RequestDispatcher rd = request.getRequestDispatcher("../perfil/perfil.jsp");
					rd.forward(request, response);

				} else {
					response.sendRedirect("../login/login.jsp");
				}
			}
			else if(user.getId_tipoUser() == 3) {
				Administrador administrador = administradorService.selectAdministradorByIdUser(user);
				if(administrador != null) {
					session = request.getSession();
					session.setAttribute("administrador", administrador);
					RequestDispatcher rd = request.getRequestDispatcher("../perfil/perfil.jsp");
					rd.forward(request, response);

				} else {
					response.sendRedirect("../login/login.jsp");
				}
			}
			else {
				response.sendRedirect("../login/login.jsp");
			}
		}
		else {
			request.setAttribute("log", "E-mail ou senha incorretos");
			RequestDispatcher rd = request.getRequestDispatcher("../login/login.jsp");
			rd.forward(request, response);
		}
	}
}
