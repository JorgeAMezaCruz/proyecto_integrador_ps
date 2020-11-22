package com.bcp.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bcp.entidad.Mensaje;
import com.bcp.repositorio.MensajeRepository;

@Service
public class MensajeServiceImpl implements MensajeService {
	
	@Autowired
	private MensajeRepository repository;

	@Override
	public Mensaje registraMensaje(Mensaje obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public List<Mensaje> listaPorCliente(int idCliente) {
		// TODO Auto-generated method stub
		return repository.listaPorCliente(idCliente);
	}

}
