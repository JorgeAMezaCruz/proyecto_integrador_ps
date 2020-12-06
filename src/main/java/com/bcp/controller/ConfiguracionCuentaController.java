package com.bcp.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.ConfiguracionNotificacion;
import com.bcp.entidad.Cuenta;
import com.bcp.entidad.HistorialCuenta;
import com.bcp.entidad.HistorialNotificaciones;
import com.bcp.entidad.Tarjeta;
import com.bcp.entidad.TipoMovimiento;
import com.bcp.servicio.CuentaService;
import com.bcp.servicio.HistorialCuentaService;
import com.bcp.servicio.HistorialNotificacionesService;
import com.bcp.util.Constantes;


@Controller
public class ConfiguracionCuentaController {
	
	@Autowired
	private HistorialCuentaService historialCuentaService;
	
	@Autowired
	private HistorialNotificacionesService historialNotificacionesService;
	
	@Autowired
	private CuentaService repositorioService;
	
	@RequestMapping("/verConsultaCuenta")
	public String listaMisCuentas(HttpSession session ) { 
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		List<Cuenta> data= repositorioService.listaCuentaPorCliente(objCliente.getIdCliente());
		session.setAttribute("configuracionCuentas", data);
		
		
		return "configuracionCuenta";
    }
	
	@RequestMapping("/actualizaCuenta")
	public String actualizaCuenta(Cuenta obj, HttpSession session) {
		try {
			
			Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
			Tarjeta objTarjeta = (Tarjeta)	session.getAttribute("objTarjeta");
			Cuenta instanciacn = new Cuenta();
			instanciacn.setIdCuenta(obj.getIdCuenta());
			instanciacn.setNumero(obj.getNumero());
			instanciacn.setSaldo(obj.getSaldo());
			instanciacn.setLimite_transferencia(obj.getLimite_transferencia());
			instanciacn.setTarjeta(objTarjeta);
			instanciacn.setCliente(objCliente);
			
			
			
	
			Cuenta objSalida = repositorioService.registraActualizaCliente(instanciacn);
			
			TipoMovimiento objTipoMov02 = new TipoMovimiento();
			objTipoMov02.setIdTipoMovimiento(Constantes.CUENTA);
			
			
			Cuenta objCuentaOrigen = repositorioService.listaCuentaPorNumero(obj.getNumero());
			HistorialCuenta obj1 = new HistorialCuenta();
			obj1.setTipoMovimiento(objTipoMov02);
			obj1.setMonto(0);
			obj1.setFechaRegistro(new Date());
			obj1.setCuenta(objCuentaOrigen);
			historialCuentaService.registraHistorial(obj1);
			
			
			HistorialNotificaciones obj4 = new HistorialNotificaciones();
			obj4.setMensaje(objCliente.getNombre()+": Has Actualizado el limite a: " + objSalida.getLimite_transferencia()
			+" de la cuenta "+objCuentaOrigen.getNumero() +": "+obj1.getFechaRegistro());
			obj4.setEstado("NO VISTO");
			obj4.setCliente(objCliente);
			obj4.setTipoMovimiento(objTipoMov02);
			
			historialNotificacionesService.registraHistorial(obj4);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se actualizo correctamente");
			}else
			{
				session.setAttribute("MENSAJE","Error al actualizar");
			}
			
		}
		catch (Exception e) {
			session.setAttribute("MENSAJE","Error al actualizar");
			e.printStackTrace();
		}
		return "redirect:misCuentas";
		
		
	}
	
	@RequestMapping("/misCuentas")
	public String misEstados(HttpSession session ) { 
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		List<Cuenta> data= repositorioService.listaCuentaPorCliente(objCliente.getIdCliente());
		session.setAttribute("configuracionCuentas", data);
		return "configuracionCuenta";
    }

}
