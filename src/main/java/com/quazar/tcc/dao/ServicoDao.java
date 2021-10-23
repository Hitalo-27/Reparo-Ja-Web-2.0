package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.Servico;

public class ServicoDao extends ConexaoBd{

	//READ
	public List<Servico> listarServicos(){
		List<Servico> servicos = new ArrayList<>();
        String read = "select * from tb_servicos";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  Servico servico = new Servico(rs.getLong(1), rs.getString(2), rs.getString(3));
            	  servicos.add(servico);
              }
              con.close();
              return servicos;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
}
