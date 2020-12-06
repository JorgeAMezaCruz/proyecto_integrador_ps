package com.bcp.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bcp.entidad.Cliente;
import com.bcp.servicio.ClienteService;

@Controller
public class ClienteController {
	@Autowired
	private ClienteService servicio;

	@RequestMapping("/verConsultaPerfil")
	public String verConfiguracionPerfil() {
		return "perfilConfiguracion";
	}



	@RequestMapping("/actualizarCliente")
	public String registra(Cliente bean, HttpSession session) {
		try {
			Cliente sal = servicio.actualizarCliente(bean);
			if (sal == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			} else {
				session.setAttribute("MENSAJE",	"Se actualizaron sus datos correctamente. Para visualizar los cambios realizados vuelva a inicar sesión");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:consultaCliente";
	}

	
	@RequestMapping("/consultaCliente")
	public String consulta(Cliente bean, HttpSession session) {
		Cliente objUsu = (Cliente) session.getAttribute("objCliente");
		session.setAttribute("objCliente", objUsu);
		return "perfilConfiguracion";
	}
	
	@RequestMapping("/insertaCliente")
	public String regCliente(Cliente bean, HttpSession session) {
		
		try {
			Cliente sal = servicio.actualizarCliente(bean);
			if (sal == null) {
				session.setAttribute("MENSAJE", "Existe ERROR");
			} else {
				session.setAttribute("MENSAJE",	"Se agrego un nuevo cliente");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		
		return "redirect:verRegistroCliente";
	}
	
}
