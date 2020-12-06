<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>

<title>Movimientos</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
 
<div class="container" style="width: 80%; margin-top: 8%">
              
	<form action="transaccion" id="id_form" method="post"> 
	<h4>Tranferencia BCP</h4>
    <h4>Bienvenido Sr(a): ${sessionScope.objCliente.nombre}  ${sessionScope.objCliente.apellido}</h4>  
		
			<div class="form-group">
				<label class="control-label" for="id_cuenta_ori">Cuenta Origen</label>
				<select id="id_cuenta_ori" name="cuentaOrigen" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
		    
			
			<div class="form-group">
				<label class="control-label" for="id_cuenta_des">Cuenta Destino</label>
				<input class="form-control" type="text" id="id_cuenta_des" name="cuentaDestino" placeholder="Ingrese el nombre">
			</div>
						
			 
			<div class="form-group">
			   
				<label class="control-label" id="id_nombre_destino" ></label>
		
			</div>
			<div class="form-group">
			   
				<label class="control-label" id="id_dni_destino" ></label>
		
			</div>
			
			<div class="form-group">
			   
				<label class="control-label" id="id_numero_destino" ></label>
		
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Continuar</button>
			</div>
	

	</form>




</div>
  
<script type="text/javascript">
$.getJSON("cargaCuenta", {}, function(data){
	$.each(data, function(index,item){
		$("#id_cuenta_ori").append("<option value="+item.numero +">"+ item.numero +"</option>");
	});
});
</script>

<script type="text/javascript">
	
$("#id_cuenta_des").keyup(function(){
	var var_cuenta= $("#id_cuenta_des").val();
    console.log(var_cuenta);
	
	if(var_cuenta.length == 15){
		$.getJSON("buscaNombreCliente", {"cuentaDestino":var_cuenta},function(data){

			console.log(data);

			
			$("#id_nombre_destino").text(data.respuesta);
		
		});

		$.getJSON("buscaCelularCliente", {"cuentaDestino":var_cuenta},function(data){

			console.log(data);

			
			$("#id_numero_destino").text(data.respuesta);
		
		});

		$.getJSON("buscaDniCliente", {"cuentaDestino":var_cuenta},function(data){

			console.log(data);

			$("#id_dni_destino").text(data.respuesta);
		});


		

		
    }
});

$("#id_monto").keyup(function(){
	var var_monto= $("#id_monto").val();
	var var_corigen= $("#id_cuenta_ori").val();


	$.getJSON("buscaLimite", {"monto":var_monto,"cuentaOrigen":var_corigen},function(data){

   
        console.log(data);
        $("#id_validar_monto").text(data);

	
	});

	
    
	
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

    	cuentaOrigen:{
			selector : "#id_cuenta_ori",
			validators : {
				notEmpty : {
					message : "la cuenta origen es obligatoria"
				}
			}	
        },

        monto:{
			selector : "#id_monto",
			validators : {
				notEmpty : {
					message : "el monto  es obligatorio"
				},
				regexp :{
					regexp: /^(([0-9]*)|([0-9]*[\.][0-9]))$/ ,
                    message: 'El monto es entero o decimal con un dígito'
				},
				remote :{
            	    delay: 1000,
            	 	url: 'buscaLimite',
            	 	message: 'Excede'
             }
				
				
				
			}	
        },


        /*metodo buscaCuentaDestino(String cuentaDestino)*/
        cuentaDestino:{
			selector : "#id_cuenta_des",
			validators : {
				notEmpty : {
					message : "la cuenta destino es obligatoria"
				},
				regexp :{
					regexp: /^[0-9]{15}$/ ,
                    message: 'La cuenta de destino tiene 15 digitos'
				},
				remote :{
            	    delay: 1000,
            	 	url: 'buscaCuenta',
            	 	message: 'La cuenta destino no existe'
                }
		
			}	
        }

       
    	
    }

       
});
</script>

    		
</body>
</html>