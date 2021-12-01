package com.quazar.tcc.model;

import java.io.Serializable;

import com.quazar.tcc.service.PrestadorServicoService;

public class AnuncioServico implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String titulo;
	private String categoria;
	private String subcategoria;
	private String descricao;
	private String foto;
	private PrestadorServico prestadorServico;
	private Long id_prestador;
	
	public AnuncioServico() {
	}

	public AnuncioServico(Long id, String titulo, String categoria, String subcategoria, String descricao, String foto, PrestadorServico prestadorServico) {
		this.id = id;
		this.titulo = titulo;
		this.categoria = categoria;
		this.subcategoria = subcategoria;
		this.descricao = descricao;
		this.foto = foto;
		this.prestadorServico = prestadorServico;
	}
	
	public AnuncioServico(String titulo, String categoria, String subcategoria, String descricao, String foto, PrestadorServico prestadorServico) {
		this.titulo = titulo;
		this.categoria = categoria;
		this.subcategoria = subcategoria;
		this.descricao = descricao;
		this.foto = foto;
		this.prestadorServico = prestadorServico;
	}
	
	public AnuncioServico(Long id, String titulo, String categoria, String subcategoria, String descricao, String foto, Long id_prestador) {
		this.id = id;
		this.titulo = titulo;
		this.categoria = categoria;
		this.subcategoria = subcategoria;
		this.descricao = descricao;
		this.foto = foto;
		this.id_prestador = id_prestador;
		PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
		this.prestadorServico = prestadorServicoService.selectPrestadorById(id_prestador);
	}
	
	public AnuncioServico(Long id, String titulo, String categoria, String subcategoria, String descricao, Long id_prestador) {
		this.id = id;
		this.titulo = titulo;
		this.categoria = categoria;
		this.subcategoria = subcategoria;
		this.descricao = descricao;
		this.id_prestador = id_prestador;
		PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
		this.prestadorServico = prestadorServicoService.selectPrestadorById(id_prestador);
	}
	
	public AnuncioServico(Long id) {
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
	
	public String getSubcategoria() {
		return subcategoria;
	}

	public void setSubcategoria(String subcategoria) {
		this.subcategoria = subcategoria;
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
