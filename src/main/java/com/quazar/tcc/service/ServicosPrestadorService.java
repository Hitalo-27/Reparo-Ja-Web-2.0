package com.quazar.tcc.service;

import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.dao.ServicosPrestadorDao;
import com.quazar.tcc.model.ServicosPrestador;

public class ServicosPrestadorService {
	
	private ServicosPrestadorDao servicosPrestadorDao = new ServicosPrestadorDao();
	
	public List<ServicosPrestador> selectServicosPrestadorByIdPrestador(Long id){
		List<ServicosPrestador> listaServicosPrestador = servicosPrestadorDao.listarServicosPrestador();
		List<ServicosPrestador> servicosPrestador = new ArrayList<>();
		for(ServicosPrestador sp : listaServicosPrestador) {
			if(sp.getId_prestador() == id) {
				servicosPrestador.add(sp);
			}
		}
		return servicosPrestador;
	}

}
