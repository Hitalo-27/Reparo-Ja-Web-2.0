package com.quazar.tcc.model;

import java.io.Serializable;

import com.quazar.tcc.service.ClienteService;

public class Pedido implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String titulo;
	private String categoria;
	private String pedido;
	private Cliente cliente;
	private Long id_cliente;
	
	public Pedido() {
	}

	public Pedido(Long id, String titulo, String categoria, String pedido, Cliente cliente) {
		this.id = id;
		this.titulo = titulo;
		this.categoria = categoria;
		this.pedido = pedido;
		this.cliente = cliente;
	}
	
	public Pedido(Long id, String titulo, String categoria, String pedido, Long id_cliente) {
		this.id = id;
		this.titulo = titulo;
		this.categoria = categoria;
		this.pedido = pedido;
		this.id_cliente = id_cliente;
		ClienteService clienteService = new ClienteService();
		this.cliente = clienteService.selectClienteById(new Cliente(id_cliente));
	}
	
	public Pedido(String titulo, String categoria, String pedido, Cliente cliente) {
		this.titulo = titulo;
		this.categoria = categoria;
		this.pedido = pedido;
		this.cliente = cliente;
	}
	
	public Pedido(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getPedido() {
		return pedido;
	}

	public void setPedido(String pedido) {
		this.pedido = pedido;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Long getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(Long id_cliente) {
		this.id_cliente = id_cliente;
	}
}
