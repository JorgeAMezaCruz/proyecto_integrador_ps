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

<title>Mensaje</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
       
<div class="container" style="width: 80%; margin-top: 8%">
<h4>Transferencia BCP</h4>
              

	<form action="tranferencia" id="id_form" method="post"> 
		
		    
		    <div class="form-group">
				<label class="control-label" for="id_monto">Monto</label>
				<input class="form-control" type="text" id="id_monto" name="monto" placeholder="Ingrese el monto">
			</div>
			<div class="form-group">
			<label class="control-label" id="id_validar_monto" for="id_monto"> Puedes configurar tu limite actual de transferencia de: ${sessionScope.CuentaOrigen.limite_transferencia}</label>
		    </div>
			<div class="form-group">
				<label class="control-label" for="id_texto">Mensaje</label>
				<input class="form-control" type="text" id="id_texto" name="texto" placeholder="Ingrese el mensaje opcional">
			</div>
			
		
		    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Enviar</button>
			</div>
	

	</form>




</div>
  
<script type="text/javascript">
$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {

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
            	 	message: 'Excede al limite de transferencia'
             }
				
				
				
			}	
        }

       
    	
    }

       
});
</script>
	
</body>
</html>