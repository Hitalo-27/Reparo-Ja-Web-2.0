package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.AnuncioServico;

public class AnuncioServicoDao extends ConexaoBd{
	
	//CREATE
	public void cadastrarAnuncioServico(AnuncioServico anuncioServico) {
		String create = "INSERT INTO tb_anuncioservicos(titulo, categoria, subcategoria, descricao, id_prestador) "
				+ "VALUES(?,?,?,?,?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setString(1, anuncioServico.getTitulo());
			stmt.setString(2, anuncioServico.getCategoria());
			stmt.setString(3, anuncioServico.getSubcategoria());
			stmt.setString(4, anuncioServico.getDescricao());
			stmt.setLong(5, anuncioServico.getPrestadorServico().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<AnuncioServico> listarAnuncioServicos(){
		List<AnuncioServico> anuncioServicos = new ArrayList<>();
        String read = "select * from tb_anuncioservicos";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  AnuncioServico anuncioServico = new AnuncioServico(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), 
            			  rs.getString(5), rs.getLong(6));
            	  anuncioServicos.add(anuncioServico);
              }
              con.close();
              return anuncioServicos;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	public void atualizarAnuncioServico(AnuncioServico anuncioServico) {
		String update = "update tb_anuncioservicos set titulo = ?, categoria = ?, subcategoria = ?, descricao = ? where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setString(1, anuncioServico.getTitulo());
			stmt.setString(2, anuncioServico.getCategoria());
			stmt.setString(3, anuncioServico.getSubcategoria());
			stmt.setString(4, anuncioServico.getDescricao());
			stmt.setLong(5, anuncioServico.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//DELETE
	public void deletarAnuncioServico(AnuncioServico anuncioServico) {
		String delete = "delete from tb_anuncioservicos where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, anuncioServico.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
