package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.User;

public class UserDao extends ConexaoBd{
	
	//CREATE
	public void cadastrarUser(User user) {
		String create = "INSERT INTO tb_users(nome, email, senha, cpf, idade, cep, rua, numeroCasa, bairro, cidade, imagem, id_tipoUser)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setString(1, user.getNome());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getSenha());
			stmt.setString(4, user.getCpf());
			stmt.setInt(5, user.getIdade());
			stmt.setString(6, user.getCep());
			stmt.setString(7, user.getRua());
			stmt.setInt(8, user.getNumeroCasa());
			stmt.setString(9, user.getBairro());
			stmt.setString(10, user.getCidade());
			stmt.setString(11, user.getFoto());
			stmt.setLong(12, user.getTipoUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<User> listarUsers(){
		List<User> users = new ArrayList<>();
        String read = "SELECT * FROM tb_users ORDER BY ID";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  User user = new User(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), 
            			  rs.getInt(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11),
            			  rs.getString(12), rs.getLong(13));
            	  users.add(user);
              }
              con.close();
              return users;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	public void alterarUser(User user) {
		String update = "UPDATE tb_users SET nome = ?, email = ?, senha = ?, cpf = ?, idade = ?, cep = ?, rua = ?, numeroCasa = ?, "
				+ "bairro = ?, cidade = ? WHERE id = ?";
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
			stmt.setString(10, user.getCidade());
			stmt.setLong(11, user.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//DELETE
	public void deletarUser(User user) {
		String delete = "DELETE FROM tb_users WHERE id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, user.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
