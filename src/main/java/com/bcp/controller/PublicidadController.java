package com.bcp.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.ClienteHasPublicidad;
import com.bcp.entidad.ClienteHasPublicidadPK;
import com.bcp.entidad.HistorialNotificaciones;
import com.bcp.entidad.HistorialPublicidad;
import com.bcp.entidad.MensajePublicidad;
import com.bcp.entidad.Seleccion;
import com.bcp.entidad.TipoMovimiento;
import com.bcp.servicio.ClienteService;
import com.bcp.servicio.HistorialNotificacionesService;
import com.bcp.servicio.HistorialPublicidadService;
import com.bcp.util.Constantes;





@Controller
public class PublicidadController {
	
	@Autowired
	private ClienteService clienteService;
	
	@Autowired
	private HistorialPublicidadService historialPublicidadService;
	@Autowired
	private HistorialNotificacionesService historialNotificacionesService;
	
	//Se almacenan los clientes seleccionados
	private List<Seleccion> seleccionados = new ArrayList<Seleccion>();
    
	//jsp registro publicidad
	@RequestMapping("/verRegistroPublicidad")
	public String verHistorialPublicidad() {
		return "registroPublicidad";
	}
	
	//jsp registro cliente
	@RequestMapping("/verRegistroCliente")
	public String verHistorialCliente() {
		return "registraCliente";
	}
	
	@RequestMapping("/agregarSeleccion")
	@ResponseBody
	public List<Seleccion> agregar(Seleccion obj) {
		seleccionados.add(obj);
		return seleccionados;
	}
	
	@RequestMapping("/listaSeleccion")
	@ResponseBody
	public List<Seleccion> lista(){
		return seleccionados;
	}
	
	@RequestMapping("/eliminaSeleccion")
	@ResponseBody
	public List<Seleccion> eliminar(int idCliente) {
		for (Seleccion x : seleccionados) {
			if (x.getIdCliente() == idCliente) {
				seleccionados.remove(x);
				break;
			}
		}
		return seleccionados;
	}
	
	@RequestMapping("/registraHistorialPublicidad")
	@ResponseBody
	public MensajePublicidad registra(HistorialPublicidad hp) {
		Cliente objUsuario = new Cliente();
		objUsuario.setIdCliente(3);
		TipoMovimiento objTipoMov01 = new TipoMovimiento();
		objTipoMov01.setIdTipoMovimiento(Constantes.PUBLICIDAD);
		

		List<ClienteHasPublicidad> detalles = new ArrayList<ClienteHasPublicidad>();
		
		for (Seleccion x : seleccionados) {
			
			ClienteHasPublicidadPK pk = new ClienteHasPublicidadPK();
			pk.setIdcliente(x.getIdCliente());
			ClienteHasPublicidad phb = new ClienteHasPublicidad();
			phb.setClienteHasPublicidadPK(pk);
			
			detalles.add(phb);
			
			objUsuario.setIdCliente(x.getIdCliente());
			//registro de Historial de notificaciones
			Date fecha = new Date();
			HistorialNotificaciones objHN = new HistorialNotificaciones();
			objHN.setMensaje(x.getNombre()+": Te han enviado una promocion " 
			+": "+fecha);
			objHN.setEstado("NO VISTO");
			objHN.setCliente(objUsuario);
			objHN.setTipoMovimiento(objTipoMov01);
			historialNotificacionesService.registraHistorial(objHN);
		
		}

		HistorialPublicidad objHPublicidad = new HistorialPublicidad();
		objHPublicidad.setMensaje(hp.getMensaje());
		objHPublicidad.setUsuario(objUsuario);
		objHPublicidad.setTipoMovimiento(objTipoMov01);
		objHPublicidad.setDetallehistorialpublicidad(detalles);
		HistorialPublicidad objIns = historialPublicidadService.insertaHistorialPublicidad(objHPublicidad);
		
	
		
		String salida = "-1";

		if (objIns != null) {
			salida = "Se genero la publicidad con codigo N° : " + objIns.getIdHistorialPublicidad() + "<br><br>";
			salida += "<table class=\"table\"><tr><td>Nombre</td><td>Apellido</td><td>Dni</td></tr>";

		
			for (Seleccion x : seleccionados) {
				salida += "<tr><td>" + x.getNombre() + "</td><td>" +
			    x.getApellido() + "</td><td>" + x.getDni() + "</td></tr>" ;
			
			}
			salida += "</table><br>";
			

			seleccionados.clear();
		}

		MensajePublicidad objMensaje = new MensajePublicidad();
		objMensaje.setTexto(salida);

		return objMensaje;
	}
	
	@RequestMapping("/cargaCliente")
	@ResponseBody
	public List<Cliente> listaCliente(String filtro){
		//Los parametros de la paginacion
		int page = 0;
		int size = 5;
		Pageable paginacion = PageRequest.of(page, size);
		return clienteService.listacliente(filtro+"%",paginacion);
	}
	
	
	
}
