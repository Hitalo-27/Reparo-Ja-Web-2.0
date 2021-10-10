package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.TipoUser;

public class TipoUserDao extends ConexaoBd{

	//READ
	public List<TipoUser> listarTiposUser(){
		List<TipoUser> tiposUser = new ArrayList<>();
        String read = "select * from tb_tipoUsers order by id";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  TipoUser tipoUser = new TipoUser(rs.getLong(1), rs.getString(2));
            	  tiposUser.add(tipoUser);
              }
              con.close();
              return tiposUser;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
}
