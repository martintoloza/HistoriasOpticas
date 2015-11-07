function buscarPorCiudad(){
   $("#boton_buscar").click(function(){
    // var codigo = $("#codigo").val();
    // var codigo = $("#codigo").toString();
     var codigo = $("#codigo").val();
     // document.write("VariableJS = " + codigo);
     $.ajax({
        url: "/ciudades/buscar_por_ciudad/" + codigo,
        dataType: "JSON",
        timeout: 10000,
        beforeSend: function(){
           $("#respuesta").html("Cargando...");
        },
        error: function(){
           $("#respuesta").html("Error al intentar buscar la ciudad. Por favor intente más tarde.");
        },
        success: function(res){
           if(res){
              $("#respuesta").html('<a href="/ciudades/'+res.id+'"> '+res.codigo+' ' + res.nombre + ' </a>');
           }else{
              $("#respuesta").html("El codigo no le pertenece a ningúna ciudad.");
           }
        }
     })
  });
};

$(document).ready(function(){
   buscarPorCiudad();
});