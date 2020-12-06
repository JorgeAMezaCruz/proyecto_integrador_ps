package com.bcp.entidad;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name="historialpublicidad")

public class HistorialPublicidad {
	 
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false, length = 10)
	private int idHistorialPublicidad;
	
	private String mensaje;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date fechaRegistro = new Date();


	@ManyToOne(optional = false)
	@JoinColumn(name = "idUsuario", nullable = false)
	private Cliente usuario;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoMovimiento")
	private TipoMovimiento tipoMovimiento;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "historialpublicidad")
	private List<ClienteHasPublicidad> detallehistorialpublicidad;

}
