package com.quazar.tcc.model;

import java.io.Serializable;

import com.quazar.tcc.service.ClienteService;
import com.quazar.tcc.service.PrestadorServicoService;

public class Pedido implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nome;
	private String email;
	private Integer telefone;
	private String bairro;
	private String descricao;
	private String foto;
	
	private Cliente cliente;
	private Long id_cliente;
	
	private PrestadorServico prestadorServico;
	private Long id_prestador;
	
	public Pedido() {
	}

	// READ
	public Pedido(Long id, String nome, String email, Integer telefone, String bairro, String descricao, String foto,
			Long id_cliente, Long id_prestador) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.bairro = bairro;
		this.descricao = descricao;
		this.foto = foto;
		this.id_cliente = id_cliente;
		this.id_prestador = id_prestador;
		PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
		this.prestadorServico = prestadorServicoService.selectPrestadorById(id_prestador);
		ClienteService clienteService = new ClienteService();
		this.cliente = clienteService.selectClienteById(id_cliente);
	}
	
	// CREATE
	public Pedido(String nome, String email, Integer telefone, String bairro, String descricao, String foto,
			Long id_cliente, Long id_prestador) {
		this.nome = nome;
		this.email = email;
		this.telefone = telefone;
		this.bairro = bairro;
		this.descricao = descricao;
		this.foto = foto;
		this.id_cliente = id_cliente;
		this.id_prestador = id_prestador;
		PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
		this.prestadorServico = prestadorServicoService.selectPrestadorById(id_prestador);
		ClienteService clienteService = new ClienteService();
		this.cliente = clienteService.selectClienteById(id_cliente);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getTelefone() {
		return telefone;
	}

	public void setTelefone(Integer telefone) {
		this.telefone = telefone;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
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

	public PrestadorServico getPrestadorServico() {
		return prestadorServico;
	}

	public void setPrestadorServico(PrestadorServico prestadorServico) {
		this.prestadorServico = prestadorServico;
	}

	public Long getId_prestador() {
		return id_prestador;
	}

	public void setId_prestador(Long id_prestador) {
		this.id_prestador = id_prestador;
	}

}
