package com.bcp.controller;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.ConfiguracionNotificacion;

import com.bcp.servicio.ConfiguracionNotificacionesService;




@Controller
public class ConfiguracionNotificacionesController {
	
	@Autowired
	ConfiguracionNotificacionesService repositorioService;
	
	@RequestMapping("/verConsultaNotificaciones")
	public String listaTipoNotificaciones(HttpSession session ) { 
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		List<ConfiguracionNotificacion> data= repositorioService.filtradoPorCliente(objCliente.getIdCliente());
		session.setAttribute("configuracionNotificaciones", data);
		return "configuracionNotificaciones";
    }
	
	@RequestMapping("/actualizaConfiguracionNotificacion")
	public String actConfiguracionNotificacion(ConfiguracionNotificacion obj, HttpSession session) {
		try {
			
			Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
			ConfiguracionNotificacion instanciacn = new ConfiguracionNotificacion();
			instanciacn.setIdConfiguracionNotificacion(obj.getIdConfiguracionNotificacion());
			instanciacn.setEstado(obj.getEstado());
			instanciacn.setCliente(objCliente);
			instanciacn.setTipoMovimiento(obj.getTipoMovimiento());
	
			ConfiguracionNotificacion objSalida = repositorioService.registrarActualiza(instanciacn);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se actualizo correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al actualizar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al actualizar");
			e.printStackTrace();
		}
		return "redirect:misEstados";
		
		
	}
	
	@RequestMapping("/misEstados")
	public String misEstados(HttpSession session ) { 
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		List<ConfiguracionNotificacion> data= repositorioService.filtradoPorCliente(objCliente.getIdCliente());
		session.setAttribute("configuracionNotificaciones", data);
		return "configuracionNotificaciones";
    }
	
	
	
	
	

}
