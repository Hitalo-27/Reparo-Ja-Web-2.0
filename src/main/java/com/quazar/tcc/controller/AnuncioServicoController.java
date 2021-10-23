package com.quazar.tcc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quazar.tcc.dao.AnuncioServicoDao;
import com.quazar.tcc.model.AnuncioServico;
import com.quazar.tcc.model.PrestadorServico;

@WebServlet(urlPatterns = {"/pages/anuncioServicos/anuncioServico", "/pages/anuncioServicos/fazerAnuncio", "/pages/anuncioServicos/deletarAnuncio"})
public class AnuncioServicoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AnuncioServicoDao anuncioServicoDao = new AnuncioServicoDao();
       
    public AnuncioServicoController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/pages/anuncioServicos/anuncioServico"))
			listarAnuncios(request, response);
		else if(url.equals("/pages/anuncioServicos/deletarAnuncio"))
			deletarAnuncio(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cadastrarAnuncio(request, response);
	}
	
	protected void listarAnuncios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AnuncioServico> anuncioServicos = anuncioServicoDao.listarAnuncioServicos();
		request.setAttribute("anuncioServicos", anuncioServicos);
		RequestDispatcher rd = request.getRequestDispatcher("anuncioServico.jsp");
		rd.forward(request, response);
	}
	
	protected void cadastrarAnuncio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titulo = request.getParameter("titulo");
		String categoria = request.getParameter("categoria");
		String descricao = request.getParameter("descricao");
		PrestadorServico prestadorServico = (PrestadorServico) request.getSession().getAttribute("prestador");
		AnuncioServico anuncioServico = new AnuncioServico(titulo, categoria, descricao, prestadorServico);
		anuncioServicoDao.cadastrarAnuncioServico(anuncioServico);
		response.sendRedirect("anuncioServico");
	}
	
	protected void deletarAnuncio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnuncioServico anuncioServico = new AnuncioServico(Long.parseLong(request.getParameter("id_anuncio")));
		anuncioServicoDao.deletarAnuncioServico(anuncioServico);
		response.sendRedirect("anuncioServico");
	}

}
