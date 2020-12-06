<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link rel="stylesheet" href="css/noti.css"/>
<title>CIBERTEC - registro publicidad</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="width: 80%; margin-top: 4%">
	<h3>REGISTRO DE PUBLICIDAD</h3>	
	
	<form id="id_form" accept-charset="UTF-8" action="boleta" class="form-horizontal" method="post">
			<div class="panel-group" id="steps">
				
				<div class="panel panel-default">
					<div class="panel-heading">Selección de Cliente</div>
						<div class="panel-body">
							<div class="form-group  col-md-4" >
								<div class="col-lg-3">
									<button type="button" id="id_btnCliente" data-toggle='modal' class='btn btn-primary' style="width: 170px">BUSCA CLIENTE</button>
									<input type="hidden" name="idCliente" id="id_cliente_id" class="form-control" value="-1"/>									
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Nombre</label>
								<div class="col-lg-8">
									<input type="text" name="nombreCliente" id="id_cliente_nombre" class="form-control" readonly="readonly"/>
								</div>
							</div>
							
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Apellido</label>
								<div class="col-lg-8">
									<input type="text" name="apellidoCliente" id="id_cliente_apellido" class="form-control" readonly="readonly"/>
								</div>
							</div>
							<div class="form-group  col-md-4">
								<label class="col-lg-3 control-label">Dni</label>
								<div class="col-lg-8">
									<input type="text" name="dniCliente" id="id_cliente_dni" class="form-control" readonly="readonly"/>
								</div>
							</div>		
						
						</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading">Mensaje</div>
						<div class="panel-body">
						 
							<div class="form-group  col-md-4" >
								<label class="col-lg-3 control-label">Ingresar Mensaje</label>
								<div class="col-lg-8" >
									
									<textarea  name="mensaje" id="id_cliente_msg" cols="120" rows="5" ></textarea>
								</div>
							</div>
						
					</div>
				</div>
			</div>
			
			
			<div class="panel panel-default">
					<div class="panel-heading">Detalle de Publicidad</div>
						<div class="panel-body">
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<button type="button" id="id_btnAgregar" class="btn btn-primary" style="width: 170px">AGREGA CLIENTE</button>
									<button type="button" id="id_btnRegistrar"  class="btn btn-primary" style="width: 170px">REGISTRA PUBLICIDAD</button>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<table id="id_table_publicidad" class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 5%">Código</th>
												<th style="width: 20%">Nombre</th>
												<th style="width: 20%">Apellido</th>
												<th style="width: 15%">Dni</th>
										
												<th style="width: 10%">Eliminar</th>
											</tr>
										</thead>
										<tbody id="id_table_publicidad_body">
												
										</tbody>
										
									</table>
								</div>
							</div>
					</div>
				</div>


<!-- El formulario de busqueda de Cliente (Modal) -->

  	 <div class="modal fade" id="idBuscaCliente" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Busqueda de Cliente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						    <div class="panel-group" id="steps">
		                        <div class="panel panel-default">
											<div class="form-group">
													<label class="col-lg-3 control-label">
														Cliente 
													</label>   
													<div class="col-lg-5">
														<input id="id_txtCliente" class="form-control" name="cliente" type="text" />
													</div>
											</div>
											<div class="form-group">
												<div class="col-lg-12">
												<table id="id_table_cliente" class="table table-striped table-bordered">
														<thead>
															<tr>
																<th style="width: 15%">Id</th>
																<th style="width: 20%">Nombre</th>
																<th style="width: 20%">Apellido</th>
																<th style="width: 35%">Dni</th>
																<th style="width: 10%"></th>
															</tr>
														</thead>
														<tbody>

														</tbody>				
												</table>
												</div>
											</div>
			                        </div>
		                    </div>
					</div>
			</div>
			</div>
		</div>


		
	<!-- Modal Mensaje -->	
		  <div class="modal fade" id="idMensaje" >
			<div class="modal-dialog" style="width: 60%">

				<div class="modal-content">
				<div class="modal-header" style="padding: 20px 20px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Mensaje</h4>
				</div>
				<div  id="idMensajeTexto" class="modal-body" style="padding: 30px 30px;align-content: center;">
					
			    </div>
			</div>
			</div>
		</div>
		
</form>
</div>




<script type="text/javascript">

	$(document).ready(function() {

		//Se añade los clientes a la tabla
		$.getJSON("listaSeleccion",{}, function (data){
			$.each(data, function(index, item){
				$('#id_table_publicidad_body').append("<tr><td>" +item.idCliente + "</td><td>" +item.nombre + "</td><td>" +item.apellido + "</td><td>" +item.dni + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idCliente +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");                     
			});
		});
		
	});

	//Al pulsar el botón cliente
	$("#id_btnCliente").click(function (){
		muestraCliente();
		$("#idBuscaCliente").modal("show");
	});

	
	
	//Al escribir en la caja de texto del cliente
	$("#id_txtCliente").keyup( function (e){
		muestraCliente();
	});
	
	
	//Se anula el enter
	$(document).on("keypress", "form", function(event) { 
	    return event.keyCode != 13;
	});

	
	//Al pulsar el botón agregar
	$("#id_btnAgregar").click(function (){
		var var_cli = $("#id_cliente_id").val();
		var var_nom = $("#id_cliente_nombre").val();
		var var_ape = $("#id_cliente_apellido").val();
		var var_dni = $("#id_cliente_dni").val();
		
		//Validar duplicados
		var yaExiste = false;
		$("#id_table_publicidad_body tr").each(function() {
			if($(this).find('td:eq(0)').html() == var_cli){
				yaExiste = true;
			}
		});
		
		if ( var_cli == '-1' ){
			$("#idMensajeTexto").text("Seleccione un Cliente");
			$("#idMensaje").modal("show");
		}else if ( var_nom == '' ){
			$("#idMensajeTexto").text("Agrege una cantidad");
			$("#idMensaje").modal("show");
		}else if (yaExiste){
			$("#idMensajeTexto").text("Existe el cliente elegido");
			$("#idMensaje").modal("show");
		}else{
			
			var var_nom = $("#id_cliente_nombre").val();
			var var_ape = $("#id_cliente_apellido").val();
			var var_dni = $("#id_cliente_dni").val();
					
			//limpiar la tabla
			$("#id_table_publicidad_body").empty();
				
			var jsonParam = {"idCliente":var_cli,"nombre":var_nom,"apellido":var_ape,"dni":var_dni};
			
			$.ajax({
				url:  'agregarSeleccion',
				type: 'POST',
				dataType:'json',
				data: jsonParam,
				success:function(data){
					console.log(data);
					if(data != null){
						$.each(data, function(index, item){
							$('#id_table_publicidad_body').append("<tr><td>" +item.idCliente + "</td><td>" +item.nombre + "</td><td>" +item.apellido + "</td><td>" +item.dni + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idCliente +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr>");
						});
						
					}else
						swal("Error al agregar la selección del cliente","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
				
			//limpia las cajas de texto
			$("#id_cliente_id").val("-1");
			$("#id_cliente_nombre").val("");
			$("#id_cliente_apellido").val("");
			$("#id_cliente_dni").val("");
			$("#id_cliente_msg").val("");
		
		}
	});
	
	
	//Al pulsar el botón registrar
	$("#id_btnRegistrar").click(function (){
		var var_cli = $("#id_cliente_id").val();
		var var_ape = $("#id_cliente_apellido").val();
		var var_nom = $("#id_cliente_nombre").val();
		var var_dni = $("#id_cliente_dni").val();
		var var_msg = $("#id_cliente_msg").val();
		var var_nom_com =  var_nom + ' ' + var_ape;
		
		var var_count = 0;
		$("#id_table_publicidad_body tr").each(function() {
			var_count = var_count + 1;
		});
		
		if (var_count < 1){
			$("#idMensajeTexto").text("Seleccione un cliente");
			$("#idMensaje").modal("show");
		}else{

			var jsonParam = {"idCliente":var_cli,"nombre":var_nom_com,"mensaje": var_msg};

			$.ajax({
				url:  'registraHistorialPublicidad',
				type: 'POST',
				dataType:'json',
				data: jsonParam,
				success:function(data){
					if(data.texto != "-1"){
						console.log(data.texto);
						$("#idMensajeTexto").html(data.texto);
						$("#idMensaje").modal("show");
						$("#id_table_publicidad_body").empty();
						$("#id_cliente_id").val("-1");
						$("#id_cliente_nombre").val("");
						$("#id_cliente_apellido").val("");
						$("#id_cliente_dni").val("");
						$("#id_cliente_msg").val("");
						
					}else
						swal("Error al agregar la Boleta","","error");
						return false;
					},
				error: function (jqXhr) { 
					swal("Error en la conexión","","error");
				}
		   });	
			   
		}
	});
	
	
	function muestraCliente(){
		var var_cliente = $("#id_txtCliente").val();

		//limpiar la tabla
		$("#id_table_cliente tbody").empty();
		
		//Se añade los clientes a la tabla
		$.getJSON("cargaCliente",{"filtro":var_cliente}, function (data){
			$.each(data, function(index, item){
				$('#id_table_cliente').append("<tr><td>" +item.idCliente + "</td><td>" +item.nombre + "</td><td>"+item.apellido + "</td><td>"+item.dni + "</td><td><button type='button' class='btn btn-default' aria-label='Left Align' onclick=\"f_seleccione_cliente('"+ item.idCliente+"','"+ item.nombre+"','"+ item.apellido+"', '"+ item.dni+"');\" ><span class='glyphicon glyphicon-ok' aria-hidden='true'></span></button></td></tr>");
			});
		});
	}

	

	//Al pulsar selecciona cliente
	function f_seleccione_cliente(id,nombre,apellido,dni){
		$("#id_cliente_id").val(id);
		$("#id_cliente_nombre").val(nombre);
		$("#id_cliente_apellido").val(apellido);
		$("#id_cliente_dni").val(dni);
		$("#idBuscaCliente").modal("hide");
	}
	
	
	//Al pulsar el botón eliminar
	function f_elimina_seleccion(id){	
		//limpiar la tabla
		$("#id_table_publicidad_body").empty();
			
		//Se añade los clientes a la tabla
		$.getJSON("eliminaSeleccion",{"idCliente":id}, function (data){
			$.each(data, function(index, item){
				$('#id_table_publicidad_body').append("<tr><td>" +item.idCliente + "</td><td>" +item.nombre + "</td><td>" +item.apellido + "</td><td>" +item.dni + "</td><td><button type='button' onclick='f_elimina_seleccion(" + item.idCliente +");' class='btn btn-default' aria-label='Left Align' ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td><tr>");
			});
		});

		//limpia las cajas de texto
		$("#id_cliente_id").val("-1");
		$("#id_cliente_nombre").val("");
		$("#id_cliente_apellido").val("");
		$("#id_producto_dni").val("");
		$("#id_cliente_msg").val("");
		
	}
		
	//Solo numeros en caja de texto
	function validarSoloNumerosEnteros(e) { // 1
		tecla = (document.all) ? e.keyCode : e.which; // 2
		if (tecla == 8)	return true; // 3
		patron = /[0-9]/;// Solo acepta números
		te = String.fromCharCode(tecla); // 5
		return patron.test(te); // 6
	}
	

	
</script>


</body>
</html>



