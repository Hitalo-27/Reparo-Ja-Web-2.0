package com.quazar.tcc.service;

import java.util.List;

import com.quazar.tcc.dao.TelefoneDao;
import com.quazar.tcc.model.Telefone;
import com.quazar.tcc.model.User;

public class TelefoneService {
	
	private TelefoneDao telefoneDao = new TelefoneDao();
	
	public Telefone selectTelefoneByIdUser(User user) {
		List<Telefone> listaTelefones = telefoneDao.listarTelefones();
		for(Telefone telefone : listaTelefones) {
			if(telefone.getId_user() == user.getId()) {
				return telefone;
			}
		}
		return null;
	}

}
