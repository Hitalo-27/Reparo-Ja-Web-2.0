package com.quazar.tcc.model;

import java.io.Serializable;

public class TipoUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String tipoUser;

	public TipoUser() {
	}
	
	public TipoUser(Long id, String tipoUser) {
		this.id = id;
		this.tipoUser = tipoUser;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTipoUser() {
		return tipoUser;
	}
	public void setTipoUser(String tipoUser) {
		this.tipoUser = tipoUser;
	}
}
