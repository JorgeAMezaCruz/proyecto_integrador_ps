package com.bcp.entidad;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
public class UsuarioHasRolPK implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int idUsuario; 
	private int idRol;
	
	
	
	
}
