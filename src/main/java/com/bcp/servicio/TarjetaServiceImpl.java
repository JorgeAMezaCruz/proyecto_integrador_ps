package com.bcp.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcp.entidad.Tarjeta;
import com.bcp.repositorio.TarjetaRepository;

@Service
public class TarjetaServiceImpl implements TarjetaService {

	@Autowired
	TarjetaRepository repositorio;
	@Override
	public Tarjeta BuscarTarjetaPorCliente(int idCliente) {
		// TODO Auto-generated method stub
		return repositorio.buscarTarjetaPorCliente(idCliente);
	}

}
