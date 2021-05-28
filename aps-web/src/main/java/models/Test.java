package models;

import models.dao.UsuarioDAO;

public class Test {
	public static void main(String[] args) {
		
		UsuarioDAO rep = new UsuarioDAO();
		
		Usuario u1 = new Usuario("usuario1", "1@user.com", "1234");
		Usuario u2 = new Usuario("usuario2", "2@user.com", "1234");
		Usuario u3 = new Usuario("usuario3", "3@user.com", "1234");
		Usuario u4 = new Usuario("usuario4", "4@user.com", "1234");
		rep.save(u1);
		rep.save(u2);
		rep.save(u3);
		rep.save(u4);
		
		rep.findAll().forEach(e -> System.out.println(e.getNome()));
		System.out.println("-----------------------------------------------------------");
		rep.deleteById(5);
		rep.findAll().forEach(e -> System.out.println(e.getNome()));
		
		
	}
}
