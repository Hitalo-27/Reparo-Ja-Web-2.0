package com.quazar.tcc.service;

import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.dao.ServicoDao;
import com.quazar.tcc.model.Servico;

public class ServicoService {

	private ServicoDao servicoDao = new ServicoDao();
	private List<Servico> servicos = servicoDao.listarServicos();
	
	public Servico selectServicoById(Long id) {
		for(Servico servico : servicos) {
			if(servico.getId() == id) {
				return servico;
			}
		}
		return null;
	}
	
	public List<Servico> selectServicosByName(List<String> listaServicos){
		List<Servico> tdsServicos = new ArrayList<Servico>();
		for(String servicoStr : listaServicos) {
			for(Servico servico : servicos) {
				if(servico.getNome().equals(servicoStr)){
					tdsServicos.add(servico);
					break;
				}
			}
		}
		return tdsServicos;
	}
}
