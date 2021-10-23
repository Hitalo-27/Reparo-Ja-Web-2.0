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
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.Pedido;

@WebServlet(urlPatterns = {"/pages/pedidos/pedido", "/pages/pedidos/fazerPedido", "/pages/pedidos/deletarPedido"})
public class PedidoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PedidoDao pedidoDao = new PedidoDao();
       
    public PedidoController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/pages/pedidos/pedido"))
			listarPedidos(request, response);
		else if(url.equals("/pages/pedidos/deletarPedido"))
			deletarPedido(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cadastrarPedido(request, response);
	}
	
	protected void listarPedidos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Pedido> pedidos = pedidoDao.listarPedidos();
		request.setAttribute("pedidos", pedidos);
		RequestDispatcher rd = request.getRequestDispatcher("pedido.jsp");
		rd.forward(request, response);
	}
	
	protected void cadastrarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titulo = request.getParameter("titulo");
		String categoria = request.getParameter("categoria");
		String descricao = request.getParameter("pedido");
		Cliente cliente = (Cliente) request.getSession().getAttribute("cliente");
		Pedido pedido = new Pedido(titulo, categoria, descricao, cliente);
		pedidoDao.cadastrarPedido(pedido);
		response.sendRedirect("pedido");
	}
	
	protected void deletarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pedido pedido = new Pedido(Long.parseLong(request.getParameter("id_pedido")));
		pedidoDao.deletarPedido(pedido);
		response.sendRedirect("pedido");
	}

}
