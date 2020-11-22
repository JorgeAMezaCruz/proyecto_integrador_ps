package com.bcp.controller;

import javax.servlet.http.HttpServletRequest;
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

	@RequestMapping("/verConsultaTarjeta")
	public String verConfiguracionTarjeta() {
		return "tarjetaConfiguracion";
	}

	@RequestMapping("/verConsultaCuenta")
	public String verConfiguracionCuenta() {
		return "cuentaConfiguracion";
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

	/*
	 * @RequestMapping("/salidaUsuario") public String listarTodos(Cliente bean,
	 * HttpSession session) { Cliente objUsu = (Cliente)
	 * session.getAttribute("objCliente"); session.removeAttribute("objCliente");
	 * session.setAttribute("objCliente", objUsu); return "cuentaConfiguracion"; }
		Cliente cliente, HttpSession session, HttpServletRequest request
	 */
	
	@RequestMapping("/consultaCliente")
	public String consulta(Cliente bean, HttpSession session) {
		Cliente objUsu = (Cliente) session.getAttribute("objCliente");
		session.setAttribute("objCliente", objUsu);
		return "perfilConfiguracion";
	}
}
