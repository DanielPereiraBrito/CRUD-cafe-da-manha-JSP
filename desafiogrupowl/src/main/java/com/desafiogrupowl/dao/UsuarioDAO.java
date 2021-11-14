package com.desafiogrupowl.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.desafiogrupowl.bean.Usuario;
import com.mysql.jdbc.PreparedStatement;

public class UsuarioDAO {
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grupowl", "root", "");
		}catch(Exception e){
			System.out.println(e);
		}
		
		return conn;
	}
	
	
	public static List<Usuario> getAllUsuarios(){
		String sql = "SELECT * FROM usuario";

        List<Usuario> list = new ArrayList<>();
        
        try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setComida(rs.getString("comida"));
				
				list.add(usuario);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
        
        return list;
      
	}
	
	public static int salvarUsuario(Usuario usuario) {
		int status = 0;
		String sql = "INSERT INTO usuario(nome, cpf, comida) VALUES(?, ?, ?)";
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getCpf());
			ps.setString(3, usuario.getComida());
			status = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int deletarUsuario(Usuario usuario) {
		int status = 0;
		String sql = "DELETE FROM usuario WHERE id=?";
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement)conn.prepareStatement(sql);
			ps.setInt(1, usuario.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static int updateUsuario(Usuario usuario) {
		int status = 0;
		String sql = "UPDATE usuario SET nome=?, "
				+ "cpf=?, comida=? WHERE id=?";
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareCall(sql);
			ps.setString(1, usuario.getNome());
			ps.setString(2, usuario.getCpf());
			ps.setString(3, usuario.getComida());
			ps.setInt(4, usuario.getId());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	public static Usuario getUsuarioById(int id) {
		Usuario usuario = null;
		String sql = "SELECT * FROM usuario WHERE id=?";
		try {
			Connection conn = getConnection();
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setComida(rs.getString("comida"));
			}
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return usuario;
	}
	
	
}
