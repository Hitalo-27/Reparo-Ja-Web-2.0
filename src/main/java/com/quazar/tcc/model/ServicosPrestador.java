package com.quazar.tcc.model;

import java.io.Serializable;

import com.quazar.tcc.service.ServicoService;

public class ServicosPrestador implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Servico servico;
	private PrestadorServico prestadorServico;
	private Long id_servico;
	private Long id_prestador;
	
	public ServicosPrestador() {
	}
	
	

	public ServicosPrestador(Long id, Servico servico, PrestadorServico prestadorServico) {
		this.id = id;
		this.servico = servico;
		this.prestadorServico = prestadorServico;
	}

	

	public ServicosPrestador(Long id, Long id_servico, Long id_prestador) {
		this.id = id;
		this.id_servico = id_servico;
		this.id_prestador = id_prestador;
		ServicoService servicoService = new ServicoService();
		this.servico = servicoService.selectServicoById(id_servico);
	}



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public PrestadorServico getPrestadorServico() {
		return prestadorServico;
	}

	public void setPrestadorServico(PrestadorServico prestadorServico) {
		this.prestadorServico = prestadorServico;
	}

	public Long getId_servico() {
		return id_servico;
	}

	public void setId_servico(Long id_servico) {
		this.id_servico = id_servico;
	}

	public Long getId_prestador() {
		return id_prestador;
	}

	public void setId_prestador(Long id_prestador) {
		this.id_prestador = id_prestador;
	}
}
