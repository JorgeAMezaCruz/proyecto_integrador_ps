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

import com.bcp.entidad.Tarjeta;
import com.bcp.entidad.TipoMovimiento;
import com.bcp.entidad.Tranferencia;
import com.bcp.servicio.CuentaService;
import com.bcp.servicio.HistorialCuentaService;
import com.bcp.servicio.HistorialNotificacionesService;

import com.bcp.util.Constantes;

import lombok.extern.apachecommons.CommonsLog;

@Controller
@CommonsLog
public class MovimientoController {
	@Autowired
	private HistorialCuentaService historialCuentaService;

	@Autowired
	private CuentaService cuentaService;
	
	@Autowired
	private HistorialNotificacionesService historialNotificacionesService;
	

	@RequestMapping("/verMovimientoMismoBanco")
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
	public List<HistorialNotificaciones> listaNotificaciones(HttpSession session) {
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		return historialNotificacionesService.listaPorCliente(objCliente.getIdCliente());
		
		
	}
	
	@RequestMapping("/transaccion")
	public String regTransaccion(Tranferencia x,HttpSession session) {
	    //------------------------------
		//Cuenta de Origen
		//------------------------------
		Cuenta objCuentaOrigen = cuentaService.listaCuentaPorNumero(x.getCuentaOrigen());
		session.setAttribute("CuentaOrigen", objCuentaOrigen);
		
		//------------------------------
		//Cuenta de Origen
		//--
		Cuenta objCuentaDestino = cuentaService.listaCuentaPorNumero(x.getCuentaDestino());
		session.setAttribute("CuentaDestino", objCuentaDestino);
		
		return "mensaje";
		
		
	}
	
	
	@RequestMapping("/tranferencia")
	public String regTranferencia(Tranferencia x,HttpSession session) {
	
		//------------------------------
		//Cuenta de Origen
		//------------------------------
		Cuenta objCuentaOrigen = (Cuenta) session.getAttribute("CuentaOrigen");
		
		//--Cliente Emisor----
		Cliente objCliente = (Cliente)	session.getAttribute("objCliente");
		//-------------
		
		//---Tarjeta
		Tarjeta objTarjeta = (Tarjeta)	session.getAttribute("objTarjeta");
		//---
		
		//Realiza la transaccion si el monto es menor al limite de transferencia
		if(objCuentaOrigen.getLimite_transferencia() >= x.getMonto())
		{
		
		TipoMovimiento objTipoMov01 = new TipoMovimiento();
		objTipoMov01.setIdTipoMovimiento(Constantes.RETIRO);	
		
		HistorialCuenta obj1 = new HistorialCuenta();
		obj1.setTipoMovimiento(objTipoMov01);
		obj1.setMonto(x.getMonto());
		obj1.setFechaRegistro(new Date());
		obj1.setCuenta(objCuentaOrigen);
		historialCuentaService.registraHistorial(obj1);
		
		
		//Actualizacion de Saldo Cuenta origen
	
		Cuenta instanciacuenta = new Cuenta();
		instanciacuenta.setIdCuenta(objCuentaOrigen.getIdCuenta());
		instanciacuenta.setNumero(objCuentaOrigen.getNumero());
		
		double monto = x.getMonto();
		double saldoActual = objCuentaOrigen.getSaldo()-monto; 
		
		instanciacuenta.setSaldo(saldoActual);
		instanciacuenta.setLimite_transferencia(objCuentaOrigen.getLimite_transferencia());
		instanciacuenta.setTipoMoneda(objCuentaOrigen.getTipoMoneda());
		instanciacuenta.setTarjeta(objTarjeta);
		instanciacuenta.setCliente(objCliente);

		cuentaService.registraActualizaCliente(instanciacuenta);
		
		//-------------------
		
		HistorialNotificaciones obj3 = new HistorialNotificaciones();
		
		obj3.setMensaje("Se ha retirado de la cuenta " + objCuentaOrigen.getNumero()+": "+obj1.getFechaRegistro());
		obj3.setEstado("NO VISTO");
		obj3.setCliente(objCuentaOrigen.getCliente());
		obj3.setTipoMovimiento(objTipoMov01);
		
		
		
        HistorialNotificaciones objHnotificacionEmisor = historialNotificacionesService.registraHistorial(obj3);
		session.setAttribute("objHnotificacionEmisor", objHnotificacionEmisor);
		
		//------------------------------
		//Cuenta de Destino
		//------------------------------
		Cuenta objCuentaDestino = (Cuenta) session.getAttribute("CuentaDestino");
		
		TipoMovimiento objTipoMov02 = new TipoMovimiento();
		objTipoMov02.setIdTipoMovimiento(Constantes.DEPOSITO);	
		
		HistorialCuenta obj2 = new HistorialCuenta();
		obj2.setTipoMovimiento(objTipoMov02);
		obj2.setFechaRegistro(new Date());
		obj2.setMonto(x.getMonto());
		obj2.setCuenta(objCuentaDestino);
		historialCuentaService.registraHistorial(obj2);
		
		
		//Actualizacion de Saldo Cuenta Destino
		
		Cuenta instanciacuentadestino = new Cuenta();
		instanciacuentadestino.setIdCuenta(objCuentaDestino.getIdCuenta());
		instanciacuentadestino.setNumero(objCuentaDestino.getNumero());	
		double saldoActualDestino = objCuentaDestino.getSaldo()+monto; 	
		instanciacuentadestino.setSaldo(saldoActualDestino);
		instanciacuentadestino.setLimite_transferencia(objCuentaDestino.getLimite_transferencia());
		instanciacuentadestino.setTipoMoneda(objCuentaDestino.getTipoMoneda());
		instanciacuentadestino.setTarjeta(objCuentaDestino.getTarjeta());
		instanciacuentadestino.setCliente(objCuentaDestino.getCliente());

		cuentaService.registraActualizaCliente(instanciacuentadestino);
			
	    //-------------------
		
		
		
		HistorialNotificaciones obj4 = new HistorialNotificaciones();
		obj4.setMensaje(objCliente.getNombre()+": Te ha depositado a la cuenta " + objCuentaDestino.getNumero()
		+": "+obj2.getFechaRegistro());
		obj4.setEstado("NO VISTO");
		obj4.setCliente(objCuentaDestino.getCliente());
		obj4.setTipoMovimiento(objTipoMov02);
		
		HistorialNotificaciones objHnotificacion = historialNotificacionesService.registraHistorial(obj4);
		session.setAttribute("objHNotificacion", objHnotificacion);
		
		
		
		}
		
		return "redirect:verMovimientoMismoBanco";
	}
	
	
	//Validacion de Monto
	@RequestMapping("/buscaLimite")
	@ResponseBody
	public String buscaLimite(double monto,HttpSession session) {
		
		    Cuenta objCuentaOrigen = (Cuenta) session.getAttribute("CuentaOrigen");
			
			if(monto <= objCuentaOrigen.getLimite_transferencia()) {
				return "{\"valid\":true}";
			}else {
				return "{\"valid\":false}";
			}
			
			

	}
	
	//Validacion de Cuenta
	@RequestMapping("/buscaCuenta")
	@ResponseBody
	public String buscar(String cuentaDestino) {
		Cuenta cuenta = cuentaService.listaCuentaPorNumero(cuentaDestino);
		
		if(cuenta == null) {
			return "{\"valid\":false}";
		}else {
			return "{\"valid\":true}";
		}
	}
	
	
	@RequestMapping("/buscaNombreCliente")
	@ResponseBody
	public String buscarCliente(String cuentaDestino) {
		
		log.info("buscarCliente -> " + cuentaDestino);
		Cuenta cuenta = cuentaService.listaCuentaPorNumero(cuentaDestino);
		if(cuenta == null) {
			return "{\"respuesta\":\"Cuenta Destino}";
		}else {
			String msg = cuenta.getCliente().getNombre() + " "+
					 cuenta.getCliente().getApellido();
			return "{\"respuesta\":\"Nombre:" + msg + "\" }";
		}
	}
	
	@RequestMapping("/buscaCelularCliente")
	@ResponseBody
	public String buscarCliente2(String cuentaDestino) {
		
		log.info("buscarCliente -> " + cuentaDestino);
		Cuenta cuenta = cuentaService.listaCuentaPorNumero(cuentaDestino);
		if(cuenta == null) {
			return "{\"respuesta\":\"Cuenta Destino}";
		}else {
			String msg = cuenta.getCliente().getCelular();
			return "{\"respuesta\":\"Nro Celular: " + msg + "\" }";
		}
	}
	@RequestMapping("/buscaDniCliente")
	@ResponseBody
	public String buscarCliente3(String cuentaDestino) {
		
		log.info("buscarCliente -> " + cuentaDestino);
		Cuenta cuenta = cuentaService.listaCuentaPorNumero(cuentaDestino);
		if(cuenta == null) {
			return "{\"respuesta\":\"Cuenta Destino}";
		}else {
			String msg = cuenta.getCliente().getDni();
			return "{\"respuesta\":\"DNI: " + msg + "\" }";
		}
	}
	
	
	
}
