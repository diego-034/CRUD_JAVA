/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Update(idSelected) {
    alert("id seleccionado: " + idSelected);
    $.ajax({
        type: 'POST',
        url: 'Main',
        data: 'idSelected=' + idSelected,
        success: function (response) {
           
            console.log(response);
        }
    });
}

function Delete(idSelected) {
    alert("id seleccionado: " + idSelected);
    $.ajax({
        type: 'GET',
        url: 'Main',
        data: 'idSelected=' + idSelected,
        success: function (response) {
            window.location.href='index.jsp'; 
            console.log(response);

        }
    });
}

