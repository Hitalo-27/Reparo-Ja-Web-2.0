package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.Telefone;

public class TelefoneDao extends ConexaoBd{
	
	//CREATE
	public void cadastrarTelefone(Telefone telefone) {
		String create = "INSERT INTO tb_telefones(numero, id_user)"
				+ "VALUES(?, ?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setInt(1, telefone.getNumero());
			stmt.setLong(2, telefone.getUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<Telefone> listarTelefones(){
		List<Telefone> telefones = new ArrayList<>();
        String read = "SELECT * FROM tb_telefones";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  Telefone telefone = new Telefone(rs.getLong(1), rs.getInt(2), rs.getLong(3));
            	  telefones.add(telefone);
              }
              con.close();
              return telefones;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	public void alterarTelefone(Telefone telefone) {
		String update = "UPDATE tb_telefones SET numero = ? WHERE id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setInt(1, telefone.getNumero());
			stmt.setLong(2, telefone.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//DELETE
	public void deletarTelefone(Telefone telefone) {
		String delete = "DELETE FROM tb_telefones WHERE id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, telefone.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
