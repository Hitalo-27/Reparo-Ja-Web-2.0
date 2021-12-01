package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.PrestadorServico;

public class PrestadorServicoDao extends ConexaoBd {

	//CREATE
	public void cadastrarPrestador(PrestadorServico prestadorServico) {
		String create = "INSERT INTO tb_prestadoresServico(id_userPrestador)"
				+ "VALUES(?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setLong(1, prestadorServico.getUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<PrestadorServico> listarPrestadores(){
		List<PrestadorServico> prestadores = new ArrayList<>();
        String read = "select * from tb_prestadoresServico order by id";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  PrestadorServico prestadorServico = new PrestadorServico(rs.getLong(1), rs.getLong(2));
            	  prestadores.add(prestadorServico);
              }
              con.close();
              return prestadores;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	/*
	public void alterarPrestador(PrestadorServico prestadorServico) {
		String update = "UPDATE tb_prestadoresServico SET tipoPrestador = ?, qtdeFuncionarios = ? WHERE id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setString(1, prestadorServico.getTipoPrestador());
			stmt.setLong(2, prestadorServico.getQtdeFuncionarios());
			stmt.setLong(3, prestadorServico.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	//DELETE
	public void deletarPrestador(PrestadorServico prestadorServico) {
		String delete = "delete from tb_prestadoresServico where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, prestadorServico.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
