package com.quazar.tcc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quazar.tcc.dao.PedidoDao;
import com.quazar.tcc.model.Pedido;
import com.quazar.tcc.service.ImagemService;

@WebServlet(urlPatterns = {"/pages/homePrestador/homePrestador", "/pages/prestadores/cadastrarPedido", "/pages/anuncioServicos/cadastrarPedido"})
public class PedidoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PedidoDao pedidoDao = new PedidoDao();
	
	ImagemService imagemService = new ImagemService();
       
    public PedidoController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listarPedidos(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/pages/prestadores/cadastrarPedido"))
			cadastrarPedido(request, response);
		else if(url.equals("/pages/anuncioServicos/cadastrarPedido"))
			cadastrarPedido(request, response);
	}
	
	protected void listarPedidos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Pedido> pedidos = pedidoDao.listarPedidos();
		request.setAttribute("listaPedidos", pedidos);
		RequestDispatcher rd = request.getRequestDispatcher("homePrestador.jsp");
		rd.forward(request, response);
	}
	
	protected void cadastrarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pedido pedido = new Pedido(request.getParameter("nome"), request.getParameter("email"), Integer.parseInt(request.getParameter("telefone")),
				request.getParameter("bairro"), request.getParameter("pedido"), request.getParameter("img"),
				Long.parseLong(request.getParameter("id_cliente")), Long.parseLong(request.getParameter("id_prestador")));
		pedidoDao.cadastrarPedido(pedido);
		String foto = request.getParameter("img");
		//String nomeImagem = request.getParameter("nomeImagem");
		imagemService.salvarImagem(foto, foto);
		response.sendRedirect("/ReparoJa");
	}
	
	protected void deletarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Pedido pedido = new Pedido(Long.parseLong(request.getParameter("id_pedido")));
		//pedidoDao.deletarPedido(pedido);
		//response.sendRedirect("pedido");
	}

}
