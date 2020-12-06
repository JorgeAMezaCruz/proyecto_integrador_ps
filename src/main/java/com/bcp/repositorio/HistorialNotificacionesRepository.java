package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bcp.entidad.HistorialNotificaciones;

public interface HistorialNotificacionesRepository  extends JpaRepository<HistorialNotificaciones, Integer>{

	
	@Query("Select hn from HistorialNotificaciones hn, ConfiguracionNotificacion cn where "
			+ "hn.cliente.idCliente=cn.cliente.idCliente and "
			+ "cn.tipoMovimiento.idTipoMovimiento=hn.tipoMovimiento.idTipoMovimiento and "
			+ "cn.estado = 'ACTIVO' "
			+ "and hn.cliente.idCliente = :var_cli "
			+ "order by hn.fechaRegistro DESC")
	public abstract List<HistorialNotificaciones> listaPorCliente(@Param(value = "var_cli") int idCliente);
	
}

