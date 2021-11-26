package com.quazar.tcc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quazar.tcc.dao.Pesquisa;
import com.quazar.tcc.model.AnuncioServico;

@WebServlet(urlPatterns = {"/pages/anuncioServicos/buscarServico"})
public class PesquisaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Pesquisa pesquisa = new Pesquisa();
       
    public PesquisaController() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/buscaServico"));
			buscarServico(request, response);
	}
	
	protected void buscarServico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pesquisaServico = request.getParameter("pesquisaServico");
		List<AnuncioServico> anuncioServicos = pesquisa.buscarServico(pesquisaServico);
		request.setAttribute("anuncioServicos", anuncioServicos);
		RequestDispatcher rd = request.getRequestDispatcher("anuncioServico.jsp");
		rd.forward(request, response);
	}

}
