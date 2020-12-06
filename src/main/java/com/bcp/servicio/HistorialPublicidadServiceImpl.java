package com.bcp.servicio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bcp.entidad.HistorialPublicidad;
import com.bcp.repositorio.ClienteHasPublicidadRepository;
import com.bcp.repositorio.PublicidadRepository;
import com.bcp.entidad.ClienteHasPublicidad;

@Service

public class HistorialPublicidadServiceImpl implements HistorialPublicidadService{
	
    @Autowired
    PublicidadRepository publicidadRepositorio;
    
    @Autowired
	private ClienteHasPublicidadRepository detalleRepository;
    
	@Override
	@Transactional
	public HistorialPublicidad insertaHistorialPublicidad(HistorialPublicidad obj) {
		// TODO Auto-generated method stub
		HistorialPublicidad cabecera = publicidadRepositorio.save(obj);
		for (ClienteHasPublicidad d : cabecera.getDetallehistorialpublicidad()) {
			d.getClienteHasPublicidadPK().setIdhistorialpublicidad(cabecera.getIdHistorialPublicidad());
			detalleRepository.save(d);
		}
		return cabecera;
	}

}
