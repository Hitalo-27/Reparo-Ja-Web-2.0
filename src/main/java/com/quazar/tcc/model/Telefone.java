package com.quazar.tcc.model;

import java.io.Serializable;
import java.util.Objects;

public class Telefone implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Integer numero;
	private User user;
	private Long id_user;
	
	public Telefone() {
	}

	public Telefone(Long id, Integer numero, User user) {
		this.id = id;
		this.numero = numero;
		this.user = user;
	}
	
	public Telefone(Integer numero, User user) {
		this.numero = numero;
		this.user = user;
	}
	
	public Telefone(Long id, Integer numero, Long id_user) {
		this.id = id;
		this.numero = numero;
		this.id_user = id_user;
	}
	
	public Telefone(Long id, Integer numero) {
		this.id = id;
		this.numero = numero;
	}
	
	public Telefone(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, id_user, numero, user);
	}
	
	public Long getId_user() {
		return id_user;
	}

	public void setId_user(Long id_user) {
		this.id_user = id_user;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Telefone other = (Telefone) obj;
		return Objects.equals(id, other.id) && Objects.equals(id_user, other.id_user)
				&& Objects.equals(numero, other.numero) && Objects.equals(user, other.user);
	}

}
