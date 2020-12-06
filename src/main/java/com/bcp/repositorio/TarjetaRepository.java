package com.bcp.repositorio;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bcp.entidad.Cuenta;
import com.bcp.entidad.Tarjeta;

public interface TarjetaRepository  extends JpaRepository<Tarjeta, Integer>{
		
		
		@Query("select t from Tarjeta t where t.cliente.idCliente = :param")
		public abstract Tarjeta buscarTarjetaPorCliente(@Param("param")int idCliente);
	


}
