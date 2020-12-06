<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="esS">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<link rel="stylesheet" href="css/noti.css" />
<title>Configuracion de Notificaciones</title>
</head>
<body>
	<jsp:include page="intranetCabecera.jsp" />

	<div class="container" style="width: 80%; margin-top: 4%">
		<div class="container">
			<h1>
				<strong>Configuración de Notificaciones</strong>
			</h1>
		</div>
		<div class="col-md-23">
			<form id="idFormElimina" action="eliminaCrudModalidad">
				<input type="hidden" id="id_elimina" name="id">
			</form>

			<form accept-charset="UTF-8"
				action="consultaConfiguracionNotificaciones" class="simple_form"
				id="defaultForm2" method="post">

				<div class="row" style="height: 70px">

					<div class="col-md-2">
						<button type="button" data-toggle='modal' onclick="registrar();"
							class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
					</div>
					<div class="col-md-4">
						<c:if test="${sessionScope.MENSAJE != null }">
							<div class="alert alert-success" id="success-alert">
								<button type="button" class="close" data-dismiss="alert">x</button>
								${sessionScope.MENSAJE}
							</div>
						</c:if>
						<c:remove var="MENSAJE" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="content">

							<table id="tablePaginacion"
								class="table table-striped">
								<thead>
									<tr class="bg-primary">
										<th>Id</th>
										<th>Categoria de Notificación</th>
										<th>Estado</th>
										<th></th>

									</tr>
								</thead>
								<tbody>

									<c:forEach items="${sessionScope.configuracionNotificaciones}"
										var="x">
										<tr>
											<td>${x.idConfiguracionNotificacion}</td>
											<td>${x.tipoMovimiento.nombre}</td>
											<td>${x.estado}</td>

											<td>
												<button type='button' data-toggle='modal'
													onclick="editar('${x.idConfiguracionNotificacion}','${x.estado}','${x.tipoMovimiento.idTipoMovimiento}');"
													class='btn btn-success'
													style='background-color: hsla(233, 100%, 100%, 0);'>
													<img src='images/estado.svg' id='id_update' width='auto'
														height='auto' />
												</button>
											</td>

										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="modal fade" id="idModalRegistra">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> Registro de
							Configuracion de Notificaciones
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8"
							action="registraActualizaCrudModalidad" class="form-horizontal"
							method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Datos de Configuración de Notificaciones</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">


											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_nombre">Estado</label>
												<div class="col-lg-5">
													<select id="id_reg_estado" name="estado"
														class='form-control'>
														<option value="ACTIVO">ACTIVO</option>
														<option value="INACTIVO">INACTIVO</option>
													</select>
												</div>

											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">TIPO</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_reg_tipom"
														name="tipoMovimiento.idTipoMovimiento" type="text" />
												</div>
											</div>



											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="submit" class="btn btn-primary">REGISTRA</button>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>

		</div>

		<div class="modal fade" id="idModalActualiza">
			<div class="modal-dialog" style="width: 60%">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-ok-sign"></span> 
							Seleccione las categorias de notificaciones de las cuales usted quiera ser notificado   
						</h4>
					</div>
					<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"
							action="actualizaConfiguracionNotificacion"
							class="form-horizontal" method="post">
							<div class="panel-group" id="steps">
								<!-- Step 1 -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#steps"
												href="#stepOne">Configuración de Notificación</a>
										</h4>
									</div>
									<div id="stepOne" class="panel-collapse collapse in">
										<div class="panel-body">
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">Id</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_ID" readonly="readonly"
														name="idConfiguracionNotificacion" type="text" />
												</div>
											</div>


											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_nombre">Estado</label>
												<div class="col-lg-5">
													<select id="id_estado" name="estado" class='form-control'>

														<option value="ACTIVO">ACTIVO</option>
														<option value="INACTIVO">INACTIVO</option>



													</select>
												</div>

											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label" for="id_ID">Categoria de Notificación</label>
												<div class="col-lg-5">
													<input class="form-control" id="id_tipom"
														readonly="readonly" name="tipoMovimiento.idTipoMovimiento"
														type="text" />
												</div>
											</div>


											<div class="form-group">
												<div class="col-lg-9 col-lg-offset-3">
													<button type="submit" class="btn btn-primary">Guardar</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>

		</div>



	</div>

	<script type="text/javascript">
		$("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
			$("#success-alert").slideUp(500);
		});
	</script>


	<script type="text/javascript">
		function registrar() {
			$('#idModalRegistra').modal("show");
		}
		function editar(id, estado, tipom) {
			$('input[id=id_ID]').val(id);
			$('input[id=id_estado]').val(estado);
			$('input[id=id_tipom]').val(tipom);
			$('#idModalActualiza').modal("show");
		}
		/* $(document).ready(function() {
		 $('#tablePaginacion').DataTable();
		 } ); */
	</script>

	<script type="text/javascript">
		$('#id_form_registra')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								"nombre" : {
									selector : '#id_reg_nombre',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										}
									}
								},
								"numHombres" : {
									selector : '#id_reg_num_hombres',
									validators : {
										notEmpty : {
											message : 'El número de hombres es un campo obligatorio'
										},
										lessThan : {
											value : 15,
											inclusive : true,
											message : 'La edad es menor a 15'
										},
										greaterThan : {
											value : 0,
											inclusive : true,
											message : 'La edad es mayor a 0'
										}
									}
								},
								"numMujeres" : {
									selector : '#id_reg_num_mujeres',
									validators : {
										notEmpty : {
											message : 'El número de mujeres es un campo obligatorio'
										},
										lessThan : {
											value : 15,
											inclusive : true,
											message : 'La edad es menor a 15'
										},
										greaterThan : {
											value : 0,
											inclusive : true,
											message : 'La edad es mayor a 0'
										}
									}
								},
								"edadMaxima" : {
									selector : '#id_reg_maxima',
									validators : {
										notEmpty : {
											message : 'La edad máxima es un campo obligatorio'
										},
										lessThan : {
											value : 35,
											inclusive : true,
											message : 'La edad es menor a 35'
										},
										greaterThan : {
											value : 18,
											inclusive : true,
											message : 'La edad es mayor a 18'
										}
									}
								},
								"edadMinima" : {
									selector : '#id_reg_minima',
									validators : {
										notEmpty : {
											message : 'La edad mínima es un campo obligatorio'
										},
										lessThan : {
											value : 35,
											inclusive : true,
											message : 'La edad es menor a 35'
										},
										greaterThan : {
											value : 18,
											inclusive : true,
											message : 'La edad es mayor a 18'
										}
									}
								},
								"deporte.idDeporte" : {
									selector : '#id_reg_deporte',
									validators : {
										notEmpty : {
											message : 'El deporte un campo obligatorio'
										},
									}
								},
							}
						});
	</script>

	<script type="text/javascript">
		$('#id_form_actualiza')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								"nombre" : {
									selector : '#id_act_nombre',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										}
									}
								},
								"numHombres" : {
									selector : '#id_act_num_hombres',
									validators : {
										notEmpty : {
											message : 'El número de hombres es un campo obligatorio'
										},
										lessThan : {
											value : 15,
											inclusive : true,
											message : 'La edad es menor a 15'
										},
										greaterThan : {
											value : 0,
											inclusive : true,
											message : 'La edad es mayor a 0'
										}
									}
								},
								"numMujeres" : {
									selector : '#id_act_num_mujeres',
									validators : {
										notEmpty : {
											message : 'El número de mujeres es un campo obligatorio'
										},
										lessThan : {
											value : 15,
											inclusive : true,
											message : 'La edad es menor a 15'
										},
										greaterThan : {
											value : 0,
											inclusive : true,
											message : 'La edad es mayor a 0'
										}
									}
								},
								"edadMaxima" : {
									selector : '#id_act_maxima',
									validators : {
										notEmpty : {
											message : 'La edad máxima es un campo obligatorio'
										},
										lessThan : {
											value : 35,
											inclusive : true,
											message : 'La edad es menor a 35'
										},
										greaterThan : {
											value : 18,
											inclusive : true,
											message : 'La edad es mayor a 18'
										}
									}
								},
								"edadMinima" : {
									selector : '#id_act_minima',
									validators : {
										notEmpty : {
											message : 'La edad mínima es un campo obligatorio'
										},
										lessThan : {
											value : 35,
											inclusive : true,
											message : 'La edad es menor a 35'
										},
										greaterThan : {
											value : 18,
											inclusive : true,
											message : 'La edad es mayor a 18'
										}
									}
								},
								"deporte.idDeporte" : {
									selector : '#id_act_deporte',
									validators : {
										notEmpty : {
											message : 'El deporte un campo obligatorio'
										},
									}
								},
							}
						});
	</script>

</body>
</html>