package com.bcp.entidad;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Embeddable
public class RolHasOpcionPK implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int idRol;
	private int idOpcion;
	
	
}
