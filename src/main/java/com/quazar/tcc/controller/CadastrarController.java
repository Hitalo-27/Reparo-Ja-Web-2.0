package com.quazar.tcc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quazar.tcc.dao.ClienteDao;
import com.quazar.tcc.dao.PrestadorServicoDao;
import com.quazar.tcc.dao.TipoUserDao;
import com.quazar.tcc.dao.UserDao;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.TipoUser;
import com.quazar.tcc.model.User;
import com.quazar.tcc.service.TipoUserService;
import com.quazar.tcc.service.UserService;

@WebServlet(urlPatterns = {"/pages/cadastroCliente/cadastrarCliente", "/pages/cadastroPrestador/cadastrarPrestador"})
public class CadastrarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDao userDao = new UserDao();
	ClienteDao clienteDao = new ClienteDao();
	PrestadorServicoDao prestadorServicoDao = new PrestadorServicoDao();
	TipoUserDao tipoUserDao = new TipoUserDao();
	
	TipoUserService tipoUserService = new TipoUserService();
	UserService userService = new UserService();

    public CadastrarController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/pages/cadastroCliente/cadastrarCliente")) {
			final String TIPO_USER = "cliente";
			cadastrarCliente(request, response, TIPO_USER);
		}	
		else if(url.equals("/pages/cadastroPrestador/cadastrarPrestador")) {
			final String TIPO_USER = "prestador";
			cadastrarPrestadorServico(request, response, TIPO_USER);
		}
	}
	
	protected void cadastrarCliente(HttpServletRequest request, HttpServletResponse response, String tUser) throws ServletException, IOException {
		try {
			TipoUser tipoUser = tipoUserService.selectTipoUser(tUser);
			User user = new User(request.getParameter("nome"), request.getParameter("email"), request.getParameter("senha"), 
					request.getParameter("cpf"), request.getParameter("cep"), request.getParameter("rua"), Integer.parseInt(request.getParameter("numeroCasa")), 
					request.getParameter("bairro"), tipoUser);
			userDao.cadastrarUser(user);
			Cliente cliente = new Cliente(userService.selectUserByEmail(user));
			clienteDao.cadastrarCliente(cliente);
			response.sendRedirect("../login/login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("cadastrarCliente.jsp");
		}	
	}
	
	protected void cadastrarPrestadorServico(HttpServletRequest request, HttpServletResponse response, String tUser) throws ServletException, IOException {
		try {
			TipoUser tipoUser = tipoUserService.selectTipoUser(tUser);
			User user = new User(request.getParameter("nome"), request.getParameter("email"), request.getParameter("senha"), 
					request.getParameter("cpf"), request.getParameter("cep"), request.getParameter("rua"), Integer.parseInt(request.getParameter("numeroCasa")), 
					request.getParameter("bairro"), tipoUser);
			userDao.cadastrarUser(user);
			PrestadorServico prestadorServico = new PrestadorServico(request.getParameter("tipoPrestador"), 
					Long.parseLong(request.getParameter("qtdeFuncionarios")), userService.selectUserByEmail(user));
			prestadorServicoDao.cadastrarPrestador(prestadorServico);
			response.sendRedirect("../login/login.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("cadastrarPrestador.jsp");
		}
	}
}
