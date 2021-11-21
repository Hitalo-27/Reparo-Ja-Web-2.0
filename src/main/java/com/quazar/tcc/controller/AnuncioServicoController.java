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
import com.quazar.tcc.service.AnuncioServicoService;

@WebServlet(urlPatterns = {"/pages/anuncioServicos/anuncioServico", "/pages/anuncioServicos/fazerAnuncio", "/pages/anuncioServicos/deletarAnuncio",
		"/pages/anuncioServicos/attAnuncio", "/pages/anuncioServicos/atualizarAnuncio"})
public class AnuncioServicoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AnuncioServicoDao anuncioServicoDao = new AnuncioServicoDao();
	AnuncioServicoService anuncioServicoService = new AnuncioServicoService();
       
    public AnuncioServicoController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/pages/anuncioServicos/anuncioServico"))
			listarAnuncios(request, response);
		else if(url.equals("/pages/anuncioServicos/deletarAnuncio"))
			deletarAnuncio(request, response);
		else if(url.equals("/pages/anuncioServicos/attAnuncio")){
			selecionarAnuncio(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath();
		if(url.equals("/pages/anuncioServicos/fazerAnuncio"))
			cadastrarAnuncio(request, response);
		else if(url.equals("/pages/anuncioServicos/atualizarAnuncio"))
			atualizarAnuncio(request, response);
		
	}
	
	protected void listarAnuncios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AnuncioServico> anuncioServicos = anuncioServicoDao.listarAnuncioServicos();
		request.setAttribute("anuncioServicos", anuncioServicos);
		RequestDispatcher rd = request.getRequestDispatcher("anuncioServico.jsp");
		rd.forward(request, response);
	}
	
	protected void selecionarAnuncio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnuncioServico anuncioServicoId = new AnuncioServico(Long.parseLong(request.getParameter("id_anuncio")));
		AnuncioServico anuncioServico = anuncioServicoService.selectAnuncioServicoById(anuncioServicoId);
		request.setAttribute("anuncioServico", anuncioServico);
		RequestDispatcher rd = request.getRequestDispatcher("/pages/atualizar/atualizarAnuncio.jsp");
		rd.forward(request, response);
	}
	
	protected void cadastrarAnuncio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titulo = request.getParameter("titulo");
		String categoria = request.getParameter("categoria");
		String subcategoria = request.getParameter("subcategoria");
		String descricao = request.getParameter("descricao");
		PrestadorServico prestadorServico = (PrestadorServico) request.getSession().getAttribute("prestador");
		AnuncioServico anuncioServico = new AnuncioServico(titulo, categoria, subcategoria, descricao, prestadorServico);
		anuncioServicoDao.cadastrarAnuncioServico(anuncioServico);
		response.sendRedirect("anuncioServico");
	}
	
	protected void atualizarAnuncio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnuncioServico anuncioServico = new AnuncioServico(Long.parseLong(request.getParameter("id")), request.getParameter("titulo"),
				request.getParameter("categoria"), request.getParameter("subcategoria"), request.getParameter("descricao"), 
				Long.parseLong(request.getParameter("id_prestador")));
		anuncioServicoDao.atualizarAnuncioServico(anuncioServico);
		List<AnuncioServico> anuncioServicos = anuncioServicoDao.listarAnuncioServicos();
		request.setAttribute("anuncioServicos", anuncioServicos);
		RequestDispatcher rd = request.getRequestDispatcher("anuncioServico.jsp");
		rd.forward(request, response);
	}
	
	protected void deletarAnuncio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnuncioServico anuncioServico = new AnuncioServico(Long.parseLong(request.getParameter("id_anuncio")));
		anuncioServicoDao.deletarAnuncioServico(anuncioServico);
		response.sendRedirect("anuncioServico");
	}

}
