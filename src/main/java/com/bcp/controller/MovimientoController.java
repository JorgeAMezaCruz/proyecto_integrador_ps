package com.bcp.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.Cuenta;
import com.bcp.entidad.HistorialCuenta;
import com.bcp.entidad.HistorialNotificaciones;
import com.bcp.entidad.Mensaje;
import com.bcp.entidad.TipoMovimiento;
import com.bcp.entidad.Tranferencia;
import com.bcp.servicio.CuentaService;
import com.bcp.servicio.HistorialCuentaService;
import com.bcp.servicio.HistorialNotificacionesService;
import com.bcp.servicio.MensajeService;
import com.bcp.util.Constantes;

@Controller
public class MovimientoController {
	@Autowired
	private HistorialCuentaService historialCuentaService;

	@Autowired
	private CuentaService cuentaService;
	
	@Autowired
	private HistorialNotificacionesService historialNotificacionesService;
	
	@Autowired
	private MensajeService mensajeService;
	
	@RequestMapping("/verMovimiento")
	public String ver() {
		return "movimiento";
	}
	
	@RequestMapping("/cargaCuenta")
	@ResponseBody
	public List<Cuenta> listaCuenta(HttpSession session) {
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		return cuentaService.listaCuentaPorCliente(objCliente.getIdCliente());
	}
	
	@RequestMapping("/cargaNotificaciones")
	@ResponseBody
	public List<Mensaje> listaNotificaciones(HttpSession session) {
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		return mensajeService.listaPorCliente(objCliente.getIdCliente());
	}
	
	
	@RequestMapping("/tranferencia")
	public String regTranferencia(Tranferencia x,HttpSession session) {
	
		//------------------------------
		//Cuenta de Origen
		//------------------------------
		Cuenta objCuentaOrigen = cuentaService.listaCuentaPorNumero(x.getCuentaOrigen());
		
		TipoMovimiento objTipoMov01 = new TipoMovimiento();
		objTipoMov01.setIdTipoMovimiento(Constantes.RETIRO);	
		
		HistorialCuenta obj1 = new HistorialCuenta();
		obj1.setTipoMovimiento(objTipoMov01);
		obj1.setMonto(x.getMonto());
		obj1.setFechaRegistro(new Date());
		obj1.setCuenta(objCuentaOrigen);
		historialCuentaService.registraHistorial(obj1);
		
		HistorialNotificaciones obj3 = new HistorialNotificaciones();
		obj3.setMensaje("Se ha retirado de la cuenta " + objCuentaOrigen.getNumero());
		obj3.setEstado("NO VISTO");
		obj3.setCliente(objCuentaOrigen.getCliente());
		
		
		
        HistorialNotificaciones objHnotificacionEmisor = historialNotificacionesService.registraHistorial(obj3);
		session.setAttribute("objHnotificacionEmisor", objHnotificacionEmisor);
		
		//------------------------------
		//Cuenta de Destino
		//------------------------------
		Cuenta objCuentaDestino = cuentaService.listaCuentaPorNumero(x.getCuentaDestino());
		
		TipoMovimiento objTipoMov02 = new TipoMovimiento();
		objTipoMov02.setIdTipoMovimiento(Constantes.DEPOSITO);	
		
		HistorialCuenta obj2 = new HistorialCuenta();
		obj2.setTipoMovimiento(objTipoMov02);
		obj2.setFechaRegistro(new Date());
		obj2.setMonto(x.getMonto());
		obj2.setCuenta(objCuentaDestino);
		historialCuentaService.registraHistorial(obj2);
		
		//se instancio el cliente emisor
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		
		HistorialNotificaciones obj4 = new HistorialNotificaciones();
		obj4.setMensaje(objCliente.getNombre()+": Te ha depositado a la cuenta " + objCuentaDestino.getNumero());
		obj4.setEstado("NO VISTO");
		obj4.setCliente(objCuentaDestino.getCliente());
		
		HistorialNotificaciones objHnotificacion = historialNotificacionesService.registraHistorial(obj4);
		session.setAttribute("objHNotificacion", objHnotificacion);
		
		
		
		
		
		return "mensaje";
	}
	
	
	
}
