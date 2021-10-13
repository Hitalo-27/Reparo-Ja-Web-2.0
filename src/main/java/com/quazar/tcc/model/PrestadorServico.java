package com.quazar.tcc.model;

import java.io.Serializable;

import com.quazar.tcc.service.UserService;

public class PrestadorServico implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String tipoPrestador;
	private Long qtdeFuncionarios;
	private User user;
	private Long id_user;

	public PrestadorServico() {
	}

	public PrestadorServico(Long id, String tipoPrestador, Long qtdeFuncionarios, User user) {
		this.id = id;
		this.tipoPrestador = tipoPrestador;
		this.qtdeFuncionarios = qtdeFuncionarios;
		this.user = user;
	}
	
	public PrestadorServico(Long id, String tipoPrestador, Long qtdeFuncionarios) {
		this.id = id;
		this.tipoPrestador = tipoPrestador;
		this.qtdeFuncionarios = qtdeFuncionarios;
	}
	
	public PrestadorServico(String tipoPrestador, Long qtdeFuncionarios, User user) {
		this.tipoPrestador = tipoPrestador;
		this.qtdeFuncionarios = qtdeFuncionarios;
		this.user = user;
	}
	
	public PrestadorServico(Long id, String tipoPrestador, Long qtdeFuncionarios, Long id_user) {
		this.id = id;
		this.tipoPrestador = tipoPrestador;
		this.qtdeFuncionarios = qtdeFuncionarios;
		this.id_user = id_user;
		UserService userService = new UserService();	
		this.user = userService.selectUserById(new User(id_user));
	}
	
	public PrestadorServico(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTipoPrestador() {
		return tipoPrestador;
	}
	public void setTipoPrestador(String tipoPrestador) {
		this.tipoPrestador = tipoPrestador;
	}
	public Long getQtdeFuncionarios() {
		return qtdeFuncionarios;
	}
	public void setQtdeFuncionarios(Long qtdeFuncionarios) {
		this.qtdeFuncionarios = qtdeFuncionarios;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Long getId_user() {
		return id_user;
	}

	public void setId_user(Long id_user) {
		this.id_user = id_user;
	}
	
}
