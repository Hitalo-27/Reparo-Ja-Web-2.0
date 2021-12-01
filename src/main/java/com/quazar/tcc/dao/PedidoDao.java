package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.Pedido;

public class PedidoDao extends ConexaoBd{
	
	//CREATE
	public void cadastrarPedido(Pedido pedido) {
		String create = "INSERT INTO tb_pedidos(nome, email, telefone, bairro, descricao, imagem, id_cliente, id_prestador) "
				+ "VALUES(?,?,?,?,?,?,?,?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setString(1, pedido.getNome());
			stmt.setString(2, pedido.getEmail());
			stmt.setInt(3, pedido.getTelefone());
			stmt.setString(4, pedido.getBairro());
			stmt.setString(5, pedido.getDescricao());
			stmt.setString(6, pedido.getFoto());
			stmt.setLong(7, pedido.getId_cliente());
			stmt.setLong(8, pedido.getId_prestador());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<Pedido> listarPedidos(){
		List<Pedido> pedidos = new ArrayList<>();
        String read = "select * from tb_pedidos order by id";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  Pedido pedido = new Pedido(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
            			  rs.getString(7), rs.getLong(8), rs.getLong(9));
            	  pedidos.add(pedido);
              }
              con.close();
              return pedidos;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	/*
	public void alterarPedido(Pedido pedido) {
		String update = "update tb_pedidos set descricao = ? where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setString(1, pedido.getPedido());
			stmt.setLong(2, pedido.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/

	//DELETE
	public void deletarPedido(Pedido pedido) {
		String delete = "delete from tb_pedidos where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, pedido.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
