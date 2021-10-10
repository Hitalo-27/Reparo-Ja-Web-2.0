package com.quazar.tcc.service;

import java.util.List;

import com.quazar.tcc.dao.AdministradorDao;
import com.quazar.tcc.model.Administrador;
import com.quazar.tcc.model.User;

public class AdministradorService {

	private AdministradorDao administradorDao = new AdministradorDao();
	
	public Administrador selectAdministradorByIdUser(User user) {
		List<Administrador> listaAdministradores = administradorDao.listarAdministradores();
		for(Administrador administrador : listaAdministradores) {
			if(administrador.getId_user() == user.getId()) {
				return administrador;
			}
		}
		return null;
	}
}
