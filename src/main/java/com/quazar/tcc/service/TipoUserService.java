package com.quazar.tcc.service;

import java.util.List;

import com.quazar.tcc.dao.TipoUserDao;
import com.quazar.tcc.model.TipoUser;

public class TipoUserService {

	private TipoUserDao tipoUserDao = new TipoUserDao();
	
	public TipoUser selectTipoUser(String tipoUser) {
		List<TipoUser> listaTipoUsers = tipoUserDao.listarTiposUser();
		for(TipoUser u : listaTipoUsers) {
			if(u.getTipoUser().equals(tipoUser)) {
				return u;
			}
		}
		return null;
	}
}
