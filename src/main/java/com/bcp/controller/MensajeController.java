package com.bcp.controller;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bcp.entidad.HistorialNotificaciones;
import com.bcp.entidad.Mensaje;
import com.bcp.servicio.MensajeService;

@Controller
public class MensajeController {
	@Autowired
	private MensajeService servicio;
	
	

	@RequestMapping("/verMensaje")
	public String ver() {
			
		return "mensaje";
	}
	
	
	@RequestMapping("/Mensaje")
	public String regTranferencia(Mensaje x,HttpSession session) {
	    
        HistorialNotificaciones objHnotificacionEmisor = (HistorialNotificaciones)session.getAttribute("objHnotificacionEmisor");
		
		Mensaje objmensaje1 = new Mensaje();
		objmensaje1.setTexto("");
		objmensaje1.setHistorialnotificacion(objHnotificacionEmisor);
		
		
		servicio.registraMensaje(objmensaje1);
		
		HistorialNotificaciones objHNotificacion = (HistorialNotificaciones)session.getAttribute("objHNotificacion");
		
		Mensaje objmensaje2 = new Mensaje();
		objmensaje2.setTexto(x.getTexto());
		objmensaje2.setHistorialnotificacion(objHNotificacion);
		
		
		servicio.registraMensaje(objmensaje2);
		
		return "redirect:verMovimiento";
	}
	

}
