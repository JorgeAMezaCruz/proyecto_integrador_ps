package com.bcp.entidad;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "cliente_has_publicidad")

public class ClienteHasPublicidad {
	
	@EmbeddedId
	private ClienteHasPublicidadPK clienteHasPublicidadPK;


	@ManyToOne(optional = false)
	@JoinColumn(name = "idHistorialPublicidad", nullable = false, insertable = false, updatable = false)
	private HistorialPublicidad historialpublicidad;

	@ManyToOne(optional = false)
	@JoinColumn(name = "idCliente", nullable = false, insertable = false, updatable = false)
	private Cliente cliente;

}
