package com.bcp.servicio;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcp.entidad.ConfiguracionNotificacion;
import com.bcp.repositorio.ConfiguracionNotificacionesRepository;

@Service
public class ConfiguracionNotificacionesServiceImpl implements ConfiguracionNotificacionesService{

	
	@Autowired
	ConfiguracionNotificacionesRepository repositorio;
	
	@Override
	public List<ConfiguracionNotificacion> filtradoPorCliente(int filtro) {
		// TODO Auto-generated method stub
		return repositorio.buscarPorCliente(filtro);
	}

	@Override
	public ConfiguracionNotificacion registrarActualiza(ConfiguracionNotificacion obj) {
		// TODO Auto-generated method stub
		return repositorio.save(obj);
	}

}
