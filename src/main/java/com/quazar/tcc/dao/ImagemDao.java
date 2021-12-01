package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.Imagem;

public class ImagemDao extends ConexaoBd{
	
		//CREATE
		public void salvarImagemServico(Imagem imagem) {
			String create = "INSERT INTO tb_anuncioservicos(imagem)"
					+ "VALUES(?)";
			try {
				Connection con = conectar();
				PreparedStatement stmt = con.prepareStatement(create);
				stmt.setString(1, imagem.getFoto());
				stmt.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void salvarImagemUser(Imagem imagem) {
			String create = "INSERT INTO tb_users(imagem)"
					+ "VALUES(?)";
			try {
				Connection con = conectar();
				PreparedStatement stmt = con.prepareStatement(create);
				stmt.setString(1, imagem.getFoto());
				stmt.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void salvarImagemPedido(Imagem imagem) {
			String create = "INSERT INTO tb_pedidos(imagem)"
					+ "VALUES(?)";
			try {
				Connection con = conectar();
				PreparedStatement stmt = con.prepareStatement(create);
				stmt.setString(1, imagem.getFoto());
				stmt.executeUpdate();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//READ
		/*
		public List<Imagem> listarImagens(){
			List<Imagem> imagens = new ArrayList<Imagem>();
	        String read = "SELECT * FROM tb_imagens ORDER BY ID";
	        try{
	              Connection con = conectar();
	              PreparedStatement stmt = con.prepareStatement(read);
	              ResultSet rs = stmt.executeQuery();
	              while(rs.next()){
	            	  Imagem imagem = new Imagem(rs.getLong(1), rs.getString(2));
	            	  imagens.add(imagem);
	              }
	              con.close();
	              return imagens;
	        }
	        catch(Exception e){
	              e.printStackTrace();
	              return null;
	        }
		}
		*/
}
