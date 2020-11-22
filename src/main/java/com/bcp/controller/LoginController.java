package com.bcp.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bcp.entidad.Cliente;
import com.bcp.servicio.ClienteService;
import com.bcp.entidad.Opcion;
import com.bcp.entidad.Rol;

@Controller
public class LoginController {

	@Autowired
	private ClienteService servicio;

	@RequestMapping("/")
	public String ver() {
		return "login";
	}
	

	
	@RequestMapping("/verIntranetHome")
	public String verHome() { return "intranetHome"; }
	
	@RequestMapping("/verMovimientoMismoBanco")
	public String regCurso() { return "movimiento"; }

	@RequestMapping("/login")
	public String login(Cliente cliente, HttpSession session, HttpServletRequest request) {

		Cliente objUsu = servicio.login(cliente);
		if (objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		} else {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdCliente());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdCliente());
			
			session.setAttribute("objCliente", objUsu);
			session.setAttribute("objRoles", roles);
			session.setAttribute("objMenus", menus);
			return "redirect:home";
		}
	}
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
