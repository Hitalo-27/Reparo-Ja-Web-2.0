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

import com.quazar.tcc.dao.ClienteDao;
import com.quazar.tcc.dao.PrestadorServicoDao;
import com.quazar.tcc.dao.TelefoneDao;
import com.quazar.tcc.dao.TipoUserDao;
import com.quazar.tcc.dao.UserDao;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.Telefone;
import com.quazar.tcc.model.TipoUser;
import com.quazar.tcc.model.User;
import com.quazar.tcc.service.ClienteService;
import com.quazar.tcc.service.PrestadorServicoService;
import com.quazar.tcc.service.TelefoneService;
import com.quazar.tcc.service.TipoUserService;
import com.quazar.tcc.service.UserService;

@WebServlet(urlPatterns = {"/pages/cadastroCliente/cadastrarCliente", "/pages/cadastroPrestador/cadastrarPrestador"})
public class CadastrarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserDao userDao = new UserDao();
	ClienteDao clienteDao = new ClienteDao();
	PrestadorServicoDao prestadorServicoDao = new PrestadorServicoDao();
	TipoUserDao tipoUserDao = new TipoUserDao();
	TelefoneDao telefoneDao = new TelefoneDao();
	
	TipoUserService tipoUserService = new TipoUserService();
	UserService userService = new UserService();
	TelefoneService telefoneService = new TelefoneService();
	ClienteService clienteService = new ClienteService();
	PrestadorServicoService prestadorServicoService = new PrestadorServicoService();

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
			String pass = "acesso";
			List<User> usuarios = userDao.listarUsers();
			for(User usuario : usuarios) {
				if(usuario.getEmail().equals(request.getParameter("email"))) {
					pass = "negado";
					request.setAttribute("cadastro", "E-mail já cadastrado no sistema");
					RequestDispatcher rd = request.getRequestDispatcher("cadastrarCliente.jsp");
					rd.forward(request, response);
				}
				else if(usuario.getCpf().equals(request.getParameter("cpf"))) {
					pass = "negado";
					request.setAttribute("cadastro", "CPF já cadastrado no sistema");
					RequestDispatcher rd = request.getRequestDispatcher("cadastrarCliente.jsp");
					rd.forward(request, response);
				}
			}
			try {
				if(pass.equals("acesso")) {
					TipoUser tipoUser = tipoUserService.selectTipoUser(tUser);
					User user = new User(request.getParameter("nome"), request.getParameter("email"), request.getParameter("senha"), 
							request.getParameter("cpf"), Integer.parseInt(request.getParameter("idade")), request.getParameter("cep"), request.getParameter("rua"), 
							Integer.parseInt(request.getParameter("numeroCasa")), request.getParameter("bairro"), tipoUser);
					userDao.cadastrarUser(user);
					Telefone telefone = new Telefone(Integer.parseInt(request.getParameter("telefone")), userService.selectUserByEmail(user));
					telefoneDao.cadastrarTelefone(telefone);
					Cliente cliente = new Cliente(userService.selectUserByEmail(user));
					clienteDao.cadastrarCliente(cliente);
					
					HttpSession session = null;
					user = userService.selectUserByEmail(new User(request.getParameter("email"), request.getParameter("senha")));
					if(user != null) {
						telefone = telefoneService.selectTelefoneByIdUser(user);
						if(telefone != null) {
							session = request.getSession();
							session.setAttribute("telefone", telefone);
						}
						cliente = clienteService.selectClienteByIdUser(user);
						if(cliente != null) {
							session = request.getSession();
							session.setAttribute("cliente", cliente);
							RequestDispatcher rd = request.getRequestDispatcher("../perfil/perfil.jsp");
							rd.forward(request, response);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("cadastrarCliente.jsp");
			}
		} catch (Exception e) {}
		
	}
	
	protected void cadastrarPrestadorServico(HttpServletRequest request, HttpServletResponse response, String tUser) throws ServletException, IOException {
		try {
			String pass = "acesso";
			List<User> usuarios = userDao.listarUsers();
			for(User usuario : usuarios) {
				if(usuario.getEmail().equals(request.getParameter("email"))) {
					pass = "negado";
					request.setAttribute("cadastro", "E-mail já cadastrado no sistema");
					RequestDispatcher rd = request.getRequestDispatcher("cadastrarPrestador.jsp");
					rd.forward(request, response);
				}
				else if(usuario.getCpf().equals(request.getParameter("cpf"))) {
					pass = "negado";
					request.setAttribute("cadastro", "CPF já cadastrado no sistema");
					RequestDispatcher rd = request.getRequestDispatcher("cadastrarPrestador.jsp");
					rd.forward(request, response);
				}
			}
			try {
				if(pass.equals("acesso")) {
					TipoUser tipoUser = tipoUserService.selectTipoUser(tUser);
					User user = new User(request.getParameter("nome"), request.getParameter("email"), request.getParameter("senha"), 
							request.getParameter("cpf"), Integer.parseInt(request.getParameter("idade")), request.getParameter("cep"), request.getParameter("rua"), 
							Integer.parseInt(request.getParameter("numeroCasa")), request.getParameter("bairro"), tipoUser);
					userDao.cadastrarUser(user);
					Telefone telefone = new Telefone(Integer.parseInt(request.getParameter("telefone")), userService.selectUserByEmail(user));
					telefoneDao.cadastrarTelefone(telefone);
					PrestadorServico prestadorServico = new PrestadorServico(request.getParameter("tipoPrestador"), 
							Long.parseLong(request.getParameter("qtdeFuncionarios")), userService.selectUserByEmail(user));
					prestadorServicoDao.cadastrarPrestador(prestadorServico);
					
					HttpSession session = null;
					user = userService.selectUserByEmail(new User(request.getParameter("email"), request.getParameter("senha")));
					if(user != null) {
						telefone = telefoneService.selectTelefoneByIdUser(user);
						if(telefone != null) {
							session = request.getSession();
							session.setAttribute("telefone", telefone);
						}
						prestadorServico = prestadorServicoService.selectPrestadorByIdUser(user);
						if(prestadorServico != null) {
							session = request.getSession();
							session.setAttribute("prestador", prestadorServico);
							RequestDispatcher rd = request.getRequestDispatcher("../perfil/perfil.jsp");
							rd.forward(request, response);
						}
					}				
				}		
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("cadastrarPrestador.jsp");
			}
		} catch (Exception e) {}
	
	}
}
