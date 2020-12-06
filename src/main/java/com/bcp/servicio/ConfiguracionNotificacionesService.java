package com.bcp.servicio;

import java.util.List;



import com.bcp.entidad.ConfiguracionNotificacion;

public interface ConfiguracionNotificacionesService {
	
	public abstract List<ConfiguracionNotificacion> filtradoPorCliente(int filtro);
	
	public abstract ConfiguracionNotificacion registrarActualiza(ConfiguracionNotificacion obj);

}
