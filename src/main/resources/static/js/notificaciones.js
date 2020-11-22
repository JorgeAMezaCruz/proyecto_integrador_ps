$(document).ready(function(){         
    //SimpleNotification.warning(title, text, options);
    $("#btnSuccess").click(function(){
       SimpleNotification.success({
           title: 'Configuración',  
           text: 'Actualizacion de información personal.'               
       },{
           //opciones
           duration:4000, //tiempo que dura la notificación
           sticky:false, //permanece fijo aunque termine la duración
           fadeout:4000, //el tiempo de la animación de desvanecer
       }); 
    });
    
    $("#btnInfo").click(function(){                
       SimpleNotification.info({
           title: 'Título de INFO',
           image: 'img/forest.jpg',  
       },{
           // top-left, top-right, bottom-left, bottom-center and bottom-right            
           position: 'bottom-center', //posición de la notificación
           closeOnClick: true, //cerrar con un click               
       });
    });
       
    $("#btnError").click(function(){
       SimpleNotification.error({
           title: 'Título de ERRROR',  
           text: 'Texto de prueba para notificación de error.'               
       },{         
           duration:1000, //tiempo que dura la notificación
           position: 'bottom-right'
       });        
    });
    
    $("#btnWarning").click(function(){
       SimpleNotification.warning({
           title: 'Título de WARNING',  
           text: 'Texto de prueba para notificación de Warning.'               
       },{
           //opciones
           duration:2000, //tiempo que dura la notificación
           position: 'bottom-center'
       });        
    });
    
    $("#btnCustom").click(function(){
       SimpleNotification.message({
           title: 'Mensaje personalizado',  
           text: 'Seleccione una opción',
           buttons: [{
                    value: 'Abrir', type: 'success', onClick: (notification) => {
                        SimpleNotification.success({
                            title: 'Opción Abrir', text: 'Abriste otra notificación sin cerrar la anterior.'
                        }, { position: 'top-left' })
                    }
                }, {
                    value: 'Cerrar', type: 'error', onClick: (notification) => {
                        SimpleNotification.message({
                            title: 'Cerrando...', text: 'La notificación principal se cerrará con un desvanecimiento gradual gracias a ``notification.closeFadeout()``.'
                        }, { position: 'top-right' });
                        notification.closeFadeout();
                    }
                }],  
       },{
           //opciones
           sticky:true,
           position: 'bottom-center'
       });        
    });    
});