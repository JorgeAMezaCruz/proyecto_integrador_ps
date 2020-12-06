package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.Opcion;
import com.bcp.entidad.Rol;


public interface ClienteRepository extends JpaRepository<Cliente, Integer>{

	@Query("Select x from Cliente x where x.login = :#{#cli.login} and x.password = :#{#cli.password}")
	public abstract Cliente login(@Param(value = "cli") Cliente bean);
	
	@Query("Select p from Opcion p, RolHasOpcion pr, Rol r, UsuarioHasRol u where "
			+ " p.idOpcion = pr.opcion.idOpcion and "
			+ " pr.rol.idRol = r.idRol and "
			+ " r.idRol = u.rol.idRol and "
			+ " u.usuario.idCliente = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);

	@Query("Select r from Rol r, UsuarioHasRol u where "
			+ " r.idRol = u.rol.idRol and "
			+ " u.usuario.idCliente = :var_idUsuario")
	public abstract List<Rol> traerRolesDeUsuario(@Param("var_idUsuario")int idUsuario);
	
	
	@Query("Select x from Cliente x where x.login = :#{#cli.login}")
	public abstract Cliente listaUsuario(@Param(value = "cli") Cliente bean);
	
	@Query("Select x from Cliente x where x.dni like :var_fil")
	public List<Cliente> listaCliente(@Param("var_fil") String filtro, Pageable pageable);
	

	 
	
	
}
