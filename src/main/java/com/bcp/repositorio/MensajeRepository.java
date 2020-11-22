package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.bcp.entidad.Mensaje;

public interface MensajeRepository extends JpaRepository<Mensaje, Integer>{
	
	@Query("Select m from Mensaje m, HistorialNotificaciones h where "
			+ " m.historialnotificacion.idHistorialNotificaciones = h.idHistorialNotificaciones and "
		       + " h.cliente.idCliente = :var_cli")
	public abstract List<Mensaje> listaPorCliente(@Param(value = "var_cli") int idCliente);
	
	//invertir  las sentencias  de p.atributo = m.tabla.atributo --> m.tabla.atributo = p.atributo 
	

}
