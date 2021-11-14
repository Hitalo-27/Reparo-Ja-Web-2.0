package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.model.Servico;
import com.quazar.tcc.model.ServicosPrestador;

public class ServicosPrestadorDao extends ConexaoBd{
	
	//CREATE
	public void cadastrarServicoPrestador(Servico servico, PrestadorServico prestadorServico) {
		String create = "INSERT INTO tb_servicosprestador(id_servico, id_prestador)"
				+ "VALUES(?, ?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setLong(1, servico.getId());
			stmt.setLong(2, prestadorServico.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<ServicosPrestador> listarServicosPrestador(){
		List<ServicosPrestador> listaServicosPrestador = new ArrayList<>();
        String read = "SELECT * FROM tb_servicosprestador";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  ServicosPrestador servicosPrestador = new ServicosPrestador(rs.getLong(1), rs.getLong(2), rs.getLong(3));
            	  listaServicosPrestador.add(servicosPrestador);
              }
              con.close();
              return listaServicosPrestador;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	/*
	public void alterarUser(User user) {
		String update = "UPDATE tb_users SET nome = ?, email = ?, senha = ?, cpf = ?, idade = ?, cep = ?, rua = ?, numeroCasa = ?, bairro = ? WHERE id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setString(1, user.getNome());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getSenha());
			stmt.setString(4, user.getCpf());
			stmt.setInt(5, user.getIdade());
			stmt.setString(6, user.getCep());
			stmt.setString(7, user.getRua());
			stmt.setInt(8, user.getNumeroCasa());
			stmt.setString(9, user.getBairro());
			stmt.setLong(10, user.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

	//DELETE
	public void deletarServicoPrestador(ServicosPrestador sp) {
		String delete = "DELETE FROM tb_servicosprestador WHERE id_prestador = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, sp.getId_prestador());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deletarServicoPrestadorEspecifico(ServicosPrestador sp) {
		String delete = "DELETE FROM tb_servicosprestador WHERE id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, sp.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
