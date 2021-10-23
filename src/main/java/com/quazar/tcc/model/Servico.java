package com.quazar.tcc.model;

import java.io.Serializable;

public class Servico implements Serializable{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private String descricao;
	
	public Servico() {
	}

	public Servico(Long id, String nome, String descricao) {
		this.id = id;
		this.nome = nome;
		this.descricao = descricao;
	}
	
	public Servico(String nome, String descricao) {
		this.nome = nome;
		this.descricao = descricao;
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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
