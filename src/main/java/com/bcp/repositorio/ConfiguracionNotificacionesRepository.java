package com.bcp.repositorio;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.bcp.entidad.ConfiguracionNotificacion;



public interface ConfiguracionNotificacionesRepository extends JpaRepository<ConfiguracionNotificacion, Integer> {
	
	@Query("Select cn from ConfiguracionNotificacion cn where cn.cliente.idCliente = :fil")
	public abstract List<ConfiguracionNotificacion> buscarPorCliente(@Param("fil") int idCliente);

}


