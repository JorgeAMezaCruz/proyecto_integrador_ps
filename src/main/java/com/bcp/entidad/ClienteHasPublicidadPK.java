package com.bcp.entidad;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
public class ClienteHasPublicidadPK implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	@Column(name = "idHistorialPublicidad", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int idhistorialpublicidad;

	@Column(name = "idCliente", unique = true, nullable = false, length = 10, insertable = true, updatable = false)
	private int idcliente;


}
