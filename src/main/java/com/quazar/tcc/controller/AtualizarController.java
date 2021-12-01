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

import com.quazar.tcc.dao.PrestadorServicoDao;
import com.quazar.tcc.dao.ServicosPrestadorDao;
import com.quazar.tcc.dao.TelefoneDao;
import com.quazar.tcc.dao.UserDao;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.Servico;
import com.quazar.tcc.model.ServicosPrestador;
import com.quazar.tcc.model.Telefone;
import com.quazar.tcc.model.User;
import com.quazar.tcc.service.ClienteService;
import com.quazar.tcc.service.PrestadorServicoService;
import com.quazar.tcc.service.ServicoService;
import com.quazar.tcc.service.ServicosPrestadorService;
import com.quazar.tcc.service.TelefoneService;
import com.quazar.tcc.service.UserService;

@WebServlet(urlPatterns = {"/atualizarCliente", "/atualizarPrestador", "/attCliente", "/attPrestador"})
public class AtualizarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ClienteService clienteService = new ClienteService();
	PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
	UserService userService = new UserService();
	TelefoneService telefoneService = new TelefoneService();
	ServicoService servicoService = new ServicoService();
	ServicosPrestadorService servicosPrestadorService = new ServicosPrestadorService();
	
	UserDao userDao = new UserDao();
	TelefoneDao telefoneDao = new TelefoneDao();
	PrestadorServicoDao prestadorServicoDao = new PrestadorServicoDao();
	ServicosPrestadorDao servicosPrestadorDao = new ServicosPrestadorDao();
       
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
			Telefone telefone = telefoneService.selectTelefoneByIdUser(user);
			if(telefone != null) {
				request.setAttribute("telefone", telefone);
			}
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
			Telefone telefone = telefoneService.selectTelefoneByIdUser(user);
			if(telefone != null) {
				request.setAttribute("telefone", telefone);
			}
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
		HttpSession session = null;
		User user = new User(Long.parseLong(request.getParameter("id")), request.getParameter("nome"), request.getParameter("email"), 
				request.getParameter("senha"), request.getParameter("cpf"), Integer.parseInt(request.getParameter("idade")), request.getParameter("cep"), 
				request.getParameter("rua"), Integer.parseInt(request.getParameter("numeroCasa")), request.getParameter("bairro"), request.getParameter("cidade"));
		userDao.alterarUser(user);
		Telefone telefone = new Telefone(Long.parseLong(request.getParameter("id_telefone")), Integer.parseInt(request.getParameter("telefone")));
		telefoneDao.alterarTelefone(telefone);
		Telefone newFone = telefoneService.selectTelefoneByIdUser(user);
		if(newFone != null) {
			session = request.getSession();
			session.setAttribute("telefone", newFone);
		}
		Cliente cliente = clienteService.selectClienteByIdUser(user);
		if(cliente != null) {
			session = request.getSession();
			session.setAttribute("cliente", cliente);
			response.sendRedirect("/ReparoJa/pages/perfil/perfil.jsp");
		} else {
			response.sendRedirect("ReparoJa/pages/login/login.jsp");
		}
	}
	
	protected void atualizarPrestador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		User user = new User(Long.parseLong(request.getParameter("id")), request.getParameter("nome"), request.getParameter("email"), 
				request.getParameter("senha"), request.getParameter("cpf"), Integer.parseInt(request.getParameter("idade")), request.getParameter("cep"), 
				request.getParameter("rua"), Integer.parseInt(request.getParameter("numeroCasa")), request.getParameter("bairro"), request.getParameter("cidade"));
		userDao.alterarUser(user);
		Telefone telefone = new Telefone(Long.parseLong(request.getParameter("id_telefone")), Integer.parseInt(request.getParameter("telefone")));
		telefoneDao.alterarTelefone(telefone);
		Telefone newFone = telefoneService.selectTelefoneByIdUser(user);
		if(newFone != null) {
			session = request.getSession();
			session.setAttribute("telefone", newFone);
		}
		PrestadorServico prestadorServico = new PrestadorServico(Long.parseLong(request.getParameter("id_prestador")));
		//prestadorServicoDao.alterarPrestador(prestadorServico);
		PrestadorServico prestador = prestadorServicoService.selectPrestadorByIdUser(user);
		if(prestador != null) {
			session = request.getSession();
			session.setAttribute("prestador", prestador);
			String profissao = request.getParameter("profissoes");
			if(!profissao.equals("nenhum")) {
				Servico servico = servicoService.selectServicoByName(profissao);
				servicosPrestadorDao.cadastrarServicoPrestador(servico, prestadorServico);
				List<ServicosPrestador> listaServicosPrestador = servicosPrestadorService
						.selectServicosPrestadorByIdPrestador(prestadorServico.getId());
				session.setAttribute("servicosPrestador", listaServicosPrestador);
			}	
			response.sendRedirect("/ReparoJa/pages/perfil/perfil.jsp");
		} else {
			response.sendRedirect("ReparoJa/pages/login/login.jsp");
		}
	}

}
