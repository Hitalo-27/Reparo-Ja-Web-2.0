package com.quazar.tcc.service;

import java.util.List;

import com.quazar.tcc.dao.ClienteDao;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.User;

public class ClienteService {
	
	private ClienteDao clienteDao = new ClienteDao();
	
	public Cliente selectClienteById(Cliente cliente) {
		List<Cliente> listaClientes = clienteDao.listarClientes();
		for(Cliente c : listaClientes) {
			if(c.getId() == cliente.getId()) {
				return c;
			}
		}
		return null;
	}
	
	public Cliente selectClienteByIdUser(User user) {
		List<Cliente> listaClientes = clienteDao.listarClientes();
		for(Cliente cliente : listaClientes) {
			if(cliente.getId_user() == user.getId()) {
				return cliente;
			}
		}
		return null;
	}

}
