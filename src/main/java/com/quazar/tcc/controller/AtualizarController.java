package com.quazar.tcc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quazar.tcc.dao.UserDao;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.User;
import com.quazar.tcc.service.ClienteService;
import com.quazar.tcc.service.PrestadorServicoService;
import com.quazar.tcc.service.UserService;

@WebServlet(urlPatterns = {"/atualizarCliente", "/atualizarPrestador", "/attCliente", "/attPrestador"})
public class AtualizarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ClienteService clienteService = new ClienteService();
	PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
	UserService userService = new UserService();
	
	UserDao userDao = new UserDao();
       
    public AtualizarController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = request.getServletPath();
		if(url.equals("/attCliente")) {
			selecionarCliente(request, response);
		}
		else if(url.equals("/attPrestador")) {
			selecionarPrestador(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/atualizarCliente")) {
			atualizarCliente(request, response);
		} 
		else if(url.equals("/atualizarPrestador")) {
			atualizarPrestador(request, response);
		}
	}
	
	protected void selecionarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userId = new User(Long.parseLong(request.getParameter("id")));
		User user = userService.selectUserById(userId);
		if(user != null) {
			Cliente cliente = clienteService.selectClienteByIdUser(user);
			if(cliente != null) {
				request.setAttribute("cliente", cliente);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/atualizar/atualizarCliente.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("/pages/login/login.jsp");
			}
		}
	}
	
	protected void selecionarPrestador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userId = new User(Long.parseLong(request.getParameter("id")));
		User user = userService.selectUserById(userId);
		if(user != null) {
			PrestadorServico prestador = prestadorServicoService.selectPrestadorByIdUser(userId);
			if(prestador != null) {
				request.setAttribute("prestador", prestador);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/atualizar/atualizarPrestador.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("/pages/login/login.jsp");
			}
		}

	}
	
	protected void atualizarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User(Long.parseLong(request.getParameter("id")), request.getParameter("nome"), request.getParameter("email"), 
				request.getParameter("senha"),  request.getParameter("cpf"), request.getParameter("cep"), request.getParameter("rua"),
				Integer.parseInt(request.getParameter("numeroCasa")), request.getParameter("bairro"));
		userDao.alterarUser(user);
		Cliente cliente = clienteService.selectClienteByIdUser(user);
		if(cliente != null) {
			HttpSession session = request.getSession();
			session.setAttribute("cliente", cliente);
			response.sendRedirect("/ReparoJa/pages/perfil/perfil.jsp");
		} else {
			response.sendRedirect("ReparoJa/pages/login/login.jsp");
		}
	}
	
	protected void atualizarPrestador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User(Long.parseLong(request.getParameter("id")), request.getParameter("nome"), request.getParameter("email"), request.getParameter("senha"), 
				request.getParameter("cpf"), request.getParameter("cep"), request.getParameter("rua"),
				Integer.parseInt(request.getParameter("numeroCasa")), request.getParameter("bairro"));
		userDao.alterarUser(user);
		PrestadorServico prestador = prestadorServicoService.selectPrestadorByIdUser(user);
		if(prestador != null) {
			HttpSession session = request.getSession();
			session.setAttribute("prestador", prestador);
			response.sendRedirect("/ReparoJa/pages/perfil/perfil.jsp");
		} else {
			response.sendRedirect("ReparoJa/pages/login/login.jsp");
		}
	}

}
