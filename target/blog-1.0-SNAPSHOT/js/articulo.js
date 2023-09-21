/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {   
    $("#formul").submit(function () { 
        
        var data = $(this).serialize();       
              $.post("controller/passComentario.jsp", data, procesarComentario);
       return false;

    });

    function procesarComentario(datos) {
      
        $("#outputComentarios").html(datos);
       
    }

});
