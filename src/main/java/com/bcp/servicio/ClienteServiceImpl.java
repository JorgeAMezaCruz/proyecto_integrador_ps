package com.bcp.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.Opcion;
import com.bcp.entidad.Rol;
import com.bcp.repositorio.ClienteRepository;

@Service
public class ClienteServiceImpl implements ClienteService {

	@Autowired
	private ClienteRepository repository;

	@Override
	public Cliente login(Cliente bean) {
		return repository.login(bean);
	}

	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		return repository.traerEnlacesDeUsuario(idUsuario);
	}

	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		// TODO Auto-generated method stub
		return repository.traerRolesDeUsuario(idUsuario);
	}

	

	
	@Override
	public Cliente actualizarCliente(Cliente bean) {
		return repository.save(bean);
	}

	@Override
	public List<Cliente> listacliente(String dni, Pageable pageable) {
		// TODO Auto-generated method stub
		return repository.listaCliente(dni, pageable);
	}


	
	


	
	
	

	
	
	
	
	
}
