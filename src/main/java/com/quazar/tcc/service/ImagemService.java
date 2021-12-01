package com.quazar.tcc.service;

import java.io.FileInputStream;
import java.io.InputStream;

public class ImagemService {
	
	public void salvarImagem(String foto, String nomeArquivo) {
		ArquivoService arquivo = new ArquivoService();
		String localArquivo = "C:\\Users\\kogam\\Desktop\\imagens tcc\\" + foto;
		String pasta = "C:\\Users\\kogam\\Documents\\Programação\\Repara Ja 2.0\\reparoJa\\src\\main\\webapp\\upload\\";
		InputStream inputStream;
		
		try {
			inputStream = new FileInputStream(localArquivo);
			arquivo.upload(pasta, nomeArquivo, inputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	public List<Imagem> listarImagens() {
		ImagemDao imagemDao = new ImagemDao();
		List<Imagem> imagens = imagemDao.listarImagens();
		return imagens;
	}
	*/
}
