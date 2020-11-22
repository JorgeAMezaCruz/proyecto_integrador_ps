package com.bcp.servicio;


import java.util.List;


import com.bcp.entidad.Mensaje;

public interface MensajeService {
	
	public abstract Mensaje  registraMensaje(Mensaje obj);
	
	public abstract List<Mensaje>  listaPorCliente(int idCliente);

}
