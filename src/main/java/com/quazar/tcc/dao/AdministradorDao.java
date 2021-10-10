package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.Administrador;

public class AdministradorDao extends ConexaoBd{

	//CREATE
	public void cadastrarAdministrador(Administrador administrador) {
		String create = "INSERT INTO tb_administradores(id_user) VALUES(?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setLong(1, administrador.getUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<Administrador> listarAdministradores(){
		List<Administrador> administradores = new ArrayList<>();
        String read = "select * from tb_administradores order by id";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  Administrador administrador = new Administrador(rs.getLong(1), rs.getLong(2));
            	  administradores.add(administrador);
              }
              con.close();
              return administradores;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	public void alterarAdministrador(Administrador administrador) {
		String update = "update tb_administradores set id_user = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setLong(1, administrador.getUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//DELETE
	public void deletarAdministrador(Administrador administrador) {
		String delete = "delete from tb_administradores where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, administrador.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
