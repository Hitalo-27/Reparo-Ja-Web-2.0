package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.Cliente;

public class ClienteDao extends ConexaoBd{
	
	//CREATE
	public void cadastrarCliente(Cliente cliente) {
		String create = "INSERT INTO tb_clientes(id_userCliente) VALUES(?)";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(create);
			stmt.setLong(1, cliente.getUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//READ
	public List<Cliente> listarClientes(){
		List<Cliente> clientes = new ArrayList<>();
        String read = "select * from tb_clientes order by id";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  Cliente cliente = new Cliente(rs.getLong(1), rs.getLong(2));
            	  clientes.add(cliente);
              }
              con.close();
              return clientes;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
	
	//UPDATE
	public void alterarCliente(Cliente cliente) {
		String update = "update tb_clientes set id_user = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(update);
			stmt.setLong(1, cliente.getUser().getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//DELETE
	public void deletarCliente(Cliente cliente) {
		String delete = "delete from tb_clientes where id = ?";
		try {
			Connection con = conectar();
			PreparedStatement stmt = con.prepareStatement(delete);
			stmt.setLong(1, cliente.getId());
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
