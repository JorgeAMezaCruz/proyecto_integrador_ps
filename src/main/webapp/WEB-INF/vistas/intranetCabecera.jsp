<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="container">
 <div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    
    <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-left">
       	<li><a href="verIntranetHome">Home</a></li>
    </ul>
    
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Configuraciones<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:forEach var="x" items="${sessionScope.objMenus}">
		        	<c:if test="${x.tipo == 3}">
					<li>
		        			<a href="${x.ruta}">
		        				${x.nombre}
		        			</a>
		        		</li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
     	</li>
     </ul>
         
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Mis Operaciones<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:forEach var="x" items="${sessionScope.objMenus}">
		        	<c:if test="${x.tipo == 1}">
					<li>
		        			<a href="${x.ruta}">
		        				${x.nombre}
		        			</a>
		        		</li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
     	</li>
     </ul>
     
     <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Mantenimientos<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:forEach var="x" items="${sessionScope.objMenus}">
		        	<c:if test="${x.tipo == 2}">
					<li>
		        			<a href="${x.ruta}">
		        				${x.nombre}
		        			</a>
		        		</li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
     	</li>
     </ul>
     
     
      <ul class="nav navbar-nav navbar-right"> 
     	<li id="noti_Container" >
     		
     			<div id="noti_Counter"></div>   <!--SHOW NOTIFICATIONS COUNT.-->
                <a id="noti_Button" href=""><samp class="bubble"><img src='images/notifi.png' width='24px' height='24px' /></samp></a>
                <div id="notifications">
                    <h3>Notificaciones</h3>
                   	<div style="height:640px;" > 
                   		<div id="idNotificaciones">
                   		</div>
                   	
                   	</div>
                   <!-- <div class="seeAll"><a href="">Ver Todas las notificaciones</a></div>  -->
                   <a href="verIntranetHome" class="boton_2">Ver Todas las notificaciones</a>
                </div>
     	</li>     	   
     </ul>
     
      
     <ul class="nav navbar-nav navbar-right">
       	<li><a href="logout">Salir</a></li>
     </ul>
      
    </div>
  </div>
</div>  
</div>



<script>
var contador = 0;	

	$(document).ready(function () {
		
    	$.getJSON("cargaNotificaciones", {}, function(data){
    		$.each(data, function(index,item){
    			contador+=1;
    			console.log(contador);
    			$("#idNotificaciones").append("<h4>"+ item.historialnotificacion.mensaje +"</h4>");
    			$("#idNotificaciones").append("<h4>"+ item.texto +"</h4>");
    			$("#idNotificaciones").append("-----------------------------------------------");
    			

    		});

    		 $('#noti_Counter')
             .css({ opacity: 0 })
             .text(contador)  // AÑADIR VALOR DINÁMICO (PUEDE EXTRAER DATOS DE LA BASE DE DATOS O XML).
             .css({ top: '14px' })
             .animate({ right: '0px', opacity: 1 }, 500);
             
    	});
    	

    	// MOSTRAR ANIMADO EL CONTADOR DE NOTIFICACIONES
       

        $('#noti_Button').click(function () {

            // TOGGLE (MOSTRAR U OCULTAR) VENTANA DE NOTIFICACIONES.
            $('#notifications').fadeToggle('fast', 'linear', function () {
                if ($('#notifications').is(':hidden')) {
                    $('#noti_Button').css('background-color');
                }
                // // CAMBIAR EL COLOR DE FONDO DEL BOTÓN. 
                else $('#noti_Button').css('background-color');
            });

            $('#noti_Counter').fadeOut('slow');     // OCULTAR EL MOSTRADOR.

            return false;
        });

        // OCULTAR NOTIFICACIONES CUANDO SE HAGA CLIC EN CUALQUIER LUGAR DE LA PÁGINA. 
        $(document).click(function () {
            $('#notifications').hide();

           // COMPRUEBE SI EL CONTADOR DE NOTIFICACIONES ESTÁ OCULTO.
            if ($('#noti_Counter').is(':hidden')) {
                // // CAMBIAR EL COLOR DE FONDO DEL BOTÓN.
                $('#noti_Button').css('background-color');
            }
        });

        $('#notifications').click(function () {
            return false;       // NO HACER NADA CUANDO SE HAGA CLIC EN EL CONTENEDOR
        });
    });
    </script>

