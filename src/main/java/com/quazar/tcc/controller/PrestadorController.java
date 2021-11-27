package com.quazar.tcc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quazar.tcc.dao.PrestadorServicoDao;
import com.quazar.tcc.model.PrestadorServico;

@WebServlet(urlPatterns = {"/pages/prestadores/prestadores"})
public class PrestadorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PrestadorServicoDao prestadorServicoDao = new PrestadorServicoDao();
       
    public PrestadorController() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listarPrestadores(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void listarPrestadores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<PrestadorServico> prestadorServicos = prestadorServicoDao.listarPrestadores();
		request.setAttribute("prestadoresServico", prestadorServicos);
		RequestDispatcher rd = request.getRequestDispatcher("prestadores.jsp");
		rd.forward(request, response);
	}

}
