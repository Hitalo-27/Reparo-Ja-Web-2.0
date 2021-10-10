package com.quazar.tcc.service;

import java.util.List;

import com.quazar.tcc.dao.PrestadorServicoDao;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.User;

public class PrestadorServicoService {
	
	private PrestadorServicoDao prestadorServicoDao = new PrestadorServicoDao();
	
	public PrestadorServico selectPrestadorByIdUser(User user) {
		List<PrestadorServico> listaPrestadores = prestadorServicoDao.listarPrestadores();
		for(PrestadorServico prestador : listaPrestadores) {
			if(prestador.getId_user() == user.getId()) {
				return prestador;
			}
		}
		return null;
	}

}
