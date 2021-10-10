package com.quazar.tcc.model;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nome;
	private String email;
	private String senha;
	private String cpf;
	private String cep;
	private String rua;
	private Integer numeroCasa;
	private String bairro;
	
	private TipoUser tipoUser;
	private Long id_tipoUser;

	public User() {
	}
	
	public User(Long id, String nome, String email, String senha, String cpf, String cep, String rua, Integer numeroCasa, String bairro, TipoUser tipoUser) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cpf = cpf;
		this.cep = cep;
		this.rua = rua;
		this.numeroCasa = numeroCasa;
		this.bairro = bairro;
		this.tipoUser = tipoUser;
	}
	
	//create dao
	public User(String nome, String email, String senha, String cpf, String cep, String rua, Integer numeroCasa, String bairro, TipoUser tipoUser) {
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cpf = cpf;
		this.cep = cep;
		this.rua = rua;
		this.numeroCasa = numeroCasa;
		this.bairro = bairro;
		this.tipoUser = tipoUser;
	}
	
	//update dao
	public User(Long id, String nome, String email, String senha, String cpf, String cep, String rua, Integer numeroCasa, String bairro) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cpf = cpf;
		this.cep = cep;
		this.rua = rua;
		this.numeroCasa = numeroCasa;
		this.bairro = bairro;
	}
	
	//read dao
	public User(Long id, String nome, String email, String senha, String cpf, String cep, String rua, Integer numeroCasa, String bairro, Long id_tipoUser) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cpf = cpf;
		this.cep = cep;
		this.rua = rua;
		this.numeroCasa = numeroCasa;
		this.bairro = bairro;
		this.id_tipoUser = id_tipoUser;
	}
	
	//delete dao
	public User(Long id) {
		this.id = id;
	}
	
	//login
	public User(String email, String senha) {
		this.email = email;
		this.senha = senha;
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
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public Integer getNumeroCasa() {
		return numeroCasa;
	}
	public void setNumeroCasa(Integer numeroCasa) {
		this.numeroCasa = numeroCasa;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public TipoUser getTipoUser() {
		return tipoUser;
	}
	public void setTipoUser(TipoUser tipoUser) {
		this.tipoUser = tipoUser;
	}

	public Long getId_tipoUser() {
		return id_tipoUser;
	}

	public void setId_tipoUser(Long id_tipoUser) {
		this.id_tipoUser = id_tipoUser;
	}
	
}
