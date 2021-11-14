package com.quazar.tcc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.quazar.tcc.dao.AnuncioServicoDao;
import com.quazar.tcc.dao.ClienteDao;
import com.quazar.tcc.dao.PedidoDao;
import com.quazar.tcc.dao.PrestadorServicoDao;
import com.quazar.tcc.dao.ServicosPrestadorDao;
import com.quazar.tcc.dao.TelefoneDao;
import com.quazar.tcc.dao.UserDao;
import com.quazar.tcc.model.AnuncioServico;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.Pedido;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.ServicosPrestador;
import com.quazar.tcc.model.Telefone;
import com.quazar.tcc.model.User;
import com.quazar.tcc.service.AnuncioServicoService;
import com.quazar.tcc.service.PedidoService;
import com.quazar.tcc.service.ServicosPrestadorService;

@WebServlet(urlPatterns = {"/deletarCliente", "/deletarPrestador", "/deletarServico"})
public class DeletarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ClienteDao clienteDao = new ClienteDao();
	PrestadorServicoDao prestadorServicoDao = new PrestadorServicoDao();
	UserDao userDao = new UserDao();
	TelefoneDao telefoneDao = new TelefoneDao();
	PedidoDao pedidoDao = new PedidoDao();
	ServicosPrestadorDao servicosPrestadorDao = new ServicosPrestadorDao();
	AnuncioServicoDao anuncioServicoDao = new AnuncioServicoDao();
	
	PedidoService pedidoService = new PedidoService();
	ServicosPrestadorService servicosPrestadorService = new ServicosPrestadorService();
	AnuncioServicoService anuncioServicoService = new AnuncioServicoService();
       
    public DeletarController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/deletarCliente")) {
			deletarCliente(request, response);
		}
		else if(url.equals("/deletarPrestador")) {
			deletarPrestador(request, response);
		}
		else if(url.equals("/deletarServico")) {
			deletarServico(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void deletarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cliente cliente = new Cliente(Long.parseLong(request.getParameter("id")));
		Telefone telefone = new Telefone(Long.parseLong(request.getParameter("id_fone")));
		User user = new User(Long.parseLong(request.getParameter("id_user")));
		List<Pedido> pedidosCliente = pedidoService.selectPedidosByIdCliente(cliente);
		for(Pedido pedido : pedidosCliente) {
			pedidoDao.deletarPedido(pedido);
		}
		clienteDao.deletarCliente(cliente);
		telefoneDao.deletarTelefone(telefone);
		userDao.deletarUser(user);
		response.sendRedirect("logout");
	}
	
	protected void deletarPrestador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrestadorServico prestador = new PrestadorServico(Long.parseLong(request.getParameter("id")));
		Telefone telefone = new Telefone(Long.parseLong(request.getParameter("id_fone")));
		User user = new User(Long.parseLong(request.getParameter("id_user")));
		List<ServicosPrestador> servicosPrestadors = servicosPrestadorService
				.selectServicosPrestadorByIdPrestador(Long.parseLong(request.getParameter("id")));
		for(ServicosPrestador sp : servicosPrestadors) {
			servicosPrestadorDao.deletarServicoPrestador(sp);
		}
		List<AnuncioServico> anuncioServicos = anuncioServicoService.selectAnunciosServicoByIdPrestador(prestador);
		for(AnuncioServico as : anuncioServicos) {
			anuncioServicoDao.deletarAnuncioServico(as);
		}
		prestadorServicoDao.deletarPrestador(prestador);
		telefoneDao.deletarTelefone(telefone);
		userDao.deletarUser(user);
		response.sendRedirect("logout");
	}
	
	protected void deletarServico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServicosPrestador servicosPrestador = new ServicosPrestador(Long.parseLong(request.getParameter("id_servico")));
		servicosPrestadorDao.deletarServicoPrestadorEspecifico(servicosPrestador);
		HttpSession session = request.getSession();
		PrestadorServico prestadorServico = (PrestadorServico) session.getAttribute("prestador");
		List<ServicosPrestador> listaServicosPrestador = servicosPrestadorService
				.selectServicosPrestadorByIdPrestador(prestadorServico.getId());
		session.setAttribute("servicosPrestador", listaServicosPrestador);
		response.sendRedirect("pages/perfil/perfil.jsp");
	}

}
