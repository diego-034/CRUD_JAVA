/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Delete(id) {
    console.log(id);
    $.ajax({ 
        type: 'POST',
        url: 'Home',      
        data: 'Delete='+ id ,
        success: function(response) {
            if (response) {
                $("#row" + id).remove();
                alert("Elimiado Exitosamente");
            } else {
                alert("Ocurrio un Error");
            }
        },
        error: function(xhr, status) {
            alert('Disculpe, existió un problema');
        }
    });
}

