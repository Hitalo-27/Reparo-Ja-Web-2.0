package com.quazar.tcc.service;

import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.dao.AnuncioServicoDao;
import com.quazar.tcc.model.AnuncioServico;
import com.quazar.tcc.model.PrestadorServico;

public class AnuncioServicoService {

	private AnuncioServicoDao anuncioServicoDao = new AnuncioServicoDao();
	
	public List<AnuncioServico> selectAnunciosServicoByIdPrestador(PrestadorServico prestadorServico) {
		List<AnuncioServico> listaAnuncioServicos = anuncioServicoDao.listarAnuncioServicos();
		List<AnuncioServico> anunciosServicoPrestador = new ArrayList<AnuncioServico>();
		for(AnuncioServico anuncioServico : listaAnuncioServicos) {
			if(anuncioServico.getId_prestador() == prestadorServico.getId()) {
				anunciosServicoPrestador.add(anuncioServico);
			}
		}
		return anunciosServicoPrestador;
	}
	
	public AnuncioServico selectAnuncioServicoById(AnuncioServico anuncioServico) {
		List<AnuncioServico> listaAnuncioServicos = anuncioServicoDao.listarAnuncioServicos();
		for(AnuncioServico anunServico : listaAnuncioServicos) {
			if(anunServico.getId() == anuncioServico.getId()) {
				return anunServico;
			}
		}
		return null;
	}
}
