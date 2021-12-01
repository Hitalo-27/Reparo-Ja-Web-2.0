package com.quazar.tcc.service;

import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.dao.PedidoDao;
import com.quazar.tcc.model.Cliente;
import com.quazar.tcc.model.Pedido;

public class PedidoService {

	private PedidoDao pedidoDao = new PedidoDao();
	
	public List<Pedido> selectPedidosByIdCliente(Cliente cliente) {
		List<Pedido> listaPedidos = pedidoDao.listarPedidos();
		List<Pedido> pedidosCliente = new ArrayList<Pedido>();
		for(Pedido p : listaPedidos) {
			if(p.getId_cliente() == cliente.getId()) {
				pedidosCliente.add(p);
			}
		}
		return pedidosCliente;
	}
	
	public List<Pedido> selectPedidosByIdPrestador(Long id) {
		List<Pedido> listaPedidos = pedidoDao.listarPedidos();
		List<Pedido> pedidos = new ArrayList<Pedido>();
		for(Pedido p : listaPedidos) {
			if(p.getId_prestador() == id) {
				pedidos.add(p);
			}
		}
		return pedidos;
	}
}
