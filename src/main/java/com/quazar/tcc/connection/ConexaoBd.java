package com.quazar.tcc.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoBd {
	
	private String url = "jdbc:mysql://localhost:3306/bdquazar";
	private String user = "root";
	private String pass = "";
	
	protected Connection conectar() {
		Connection conexao = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexao = DriverManager.getConnection(url, user, pass);
			return conexao;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
