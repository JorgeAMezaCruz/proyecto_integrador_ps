<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>
<title>Ejemplos de CIBERTEC - Freddy Fernandez </title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="width: 80%; margin-top: 4%">
<h2>Registrate </h2>
	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="insertaCliente" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">
			
			<div class="form-group">
	      		<label class="control-label" for="id_num_mujeres">Dni</label>
			<input class="form-control" id="id_dni" name="dni" placeholder="Ingrese el número de dni" type="text" maxlength="8"/>
			</div>
			
			<div class="panel panel-default">
				
						<div class="panel-body">
							
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label" for="id_nombre">Nombres</label>
								<div class="col-lg-8">
								    <input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
								</div>
							</div>
							
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Apellido Paterno</label>
								<div class="col-lg-8">
					   				<input class="form-control" id="id_apellido" name="apellido" placeholder="Ingrese los apellidos" type="text" />
								  
								</div>
							</div>
							<div class="form-group  col-md-4">
			
								<label class="col-lg-3 control-label" for="id_num_hombres">Apellido Materno </label>
								<div class="col-lg-8">
									<input class="form-control" id="id_apellidom" name="apellidoM" placeholder="Ingrese los apellidos" type="text" />
								
								</div>
							</div>
							
									
						
						</div>
				</div>
				
			<div class="form-group">
				<label class="control-label" for="id_num_hombres">Fecha Nacimiento </label>
				<input class="form-control" id="id_fnacimiento" name="fechaNacimiento" placeholder="Ingrese los apellidos"  type="date" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_hombres">Correo</label>
				<input class="form-control" id="id_correo" name="email" placeholder="Ingrese los apellidos" type="text" />
			</div>
		
			<div class="form-group">
				<label class="control-label" for="id_num_hombres">Direccion</label>
				<input class="form-control" id="id_direccion" name="direccion" placeholder="Ingrese los apellidos" type="text" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_maxima">Numero Celular</label>
				<input class="form-control" id="id_nrocelular" name="celular" placeholder="Ingrese su numero de celular" type="text" />
			</div>
			<div class="form-group">
				<label class="control-label" for="id_minima">Nombre de Usuario</label>
				<input class="form-control" id="id_login" name="login" placeholder="Ingrese su nombre usuario" type="text" />
			</div>
			
			<div class="form-group">
				<label class="control-label" for="id_minima">Contraseña</label>
				<input class="form-control" id="id_password" name="password" placeholder="Ingrese la contraseña" type="text" />
			</div>
				
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Aceptar</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'Maximo 50 caracteres',
                	max : 100
                }
            }
        },
        apellido: {
    		selector : '#id_apellido',
            validators: {
                notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'Maximo 50 caracteres',
                	max : 50
                }
            }
        },
        apellidoM: {
    		selector : '#id_apellidom',
            validators: {
                notEmpty: {
                    message: 'El apellido es un campo obligatorio'
                },
                stringLength :{
                	message:'Maximo 50 caracteres',
                	max : 50
                }
            }
        },
        direccion: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'La direccion es un campo obligatorio'
                },
                stringLength :{
                	message:'Maximo 100 caracteres',
                	max : 100
                }
            }
        },
        
        dni: {
    		selector : '#id_dni',
            validators: {
            	notEmpty: {
                    message: 'El dni es un campo obligatorio'
                },
				regexp :{
					regexp: /^[0-9]{8}$/ ,
                    message: 'El dni tiene 8 digitos'
				}
        
            }
        },
        celular: {
    		selector : '#id_nrocelular',
            validators: {
            	notEmpty: {
                    message: 'La nro celular un campo obligatorio'
                },
				regexp :{
					regexp: /^(([0-9]*)|([0-9]))$/ ,
                    message: 'Solo Numeros'
				}
            }
        },

        fechaNacimiento : {
			selector : '#id_fnacimiento',
			validators : {
				notEmpty : {
					message : 'La fecha de nacimiento es un campo obligatorio'
				}
			}
		},
        login: {
    		selector : '#id_login',
            validators: {
            	notEmpty: {
                    message: 'El usuario es campo obligatorio'
                }
            }
        },
        password: {
    		selector : '#id_password',
            validators: {
            	notEmpty: {
                    message: 'La constraseña es un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




