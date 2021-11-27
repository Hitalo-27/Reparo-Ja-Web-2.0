package com.quazar.tcc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.quazar.tcc.connection.ConexaoBd;
import com.quazar.tcc.model.AnuncioServico;
import com.quazar.tcc.model.PrestadorServico;
import com.quazar.tcc.service.PrestadorServicoService;

public class Pesquisa extends ConexaoBd{
	
	private PrestadorServicoService prestadorServicoService = new PrestadorServicoService();
	
	public List<AnuncioServico> buscarServico(String servico) {
		List<AnuncioServico> anuncioServicos = new ArrayList<>();
        String read = "select * from tb_anuncioservicos where titulo like '%" + servico + "%'";
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
	
	public List<PrestadorServico> buscarPrestador(String servico) {
		List<PrestadorServico> prestadoresServicos = new ArrayList<>();
        String read = "select * from tb_users where nome like '%" + servico + "%' and id_tipoUser = 2";
        try{
              Connection con = conectar();
              PreparedStatement stmt = con.prepareStatement(read);
              ResultSet rs = stmt.executeQuery();
              while(rs.next()){
            	  PrestadorServico prestadorServico = prestadorServicoService.selectPrestadorByIdUser(rs.getLong(1));
            	  prestadoresServicos.add(prestadorServico);
              }
              con.close();
              return prestadoresServicos;
        }
        catch(Exception e){
              e.printStackTrace();
              return null;
        }
	}
}
