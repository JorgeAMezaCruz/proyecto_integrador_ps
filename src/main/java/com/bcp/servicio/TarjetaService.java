package com.bcp.servicio;

import com.bcp.entidad.Tarjeta;

public interface TarjetaService {
	
	public abstract Tarjeta BuscarTarjetaPorCliente(int idCliente);

}
