/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Update(id) {
    $.ajax({
        type: 'GET',
        url: 'Edit',
        data: 'Edit=' + id,
        dataType: "json",
        success: function (response) {
            $("#bt-Update").val(response.Id);
            $("#name").val(response.Name);
            $("#password").val(response.Password);
            $("#state").val(response.State ? "true" : "false");
            $("#document").val(response.Document);
            $("#bt-Update").css({'display': 'block'});
            $("#bt-Add").css({'display': 'none'});
        },
        error: function (xhr, status) {
            alert('Disculpe, existió un problema');
        }
    });
}

function Delete(id) {
    $.ajax({
        type: 'GET',
        url: 'Main',
        data: 'Delete=' + id,
        success: function (response) {
            if (response) {
                $("#row" + id).remove();
                alert("Elimiado Exitosamente");
            } else {
                alert("Ocurrio un Error");
            }
        },
        error: function (xhr, status) {
            alert('Disculpe, existió un problema');
        }
    });
}
function Add() {
    let name = $("#name").val();
    let password = $("#password").val();
    let state = $("#state").val();
    let document = $("#document").val();
    $.ajax({
        url: 'Main',
        data: {Add: true, Name: name, Password: password, State: state, Document: document},
        type: 'POST',
        success: function (response) {
            if (response) {
                alert("Agregado con exito")
                location.reload();
            } else {
                alert("Ocurrio un error")
            }
        },
        error: function (xhr, status) {
            alert('Disculpe, existió un problema');
        }
    });
}
function UpdateLast(id) {
    let name = $("#name").val();
    let password = $("#password").val();
    let state = $("#state").val();
    let document = $("#document").val();
    $.ajax({
        url: 'Edit',
        data: {Update: true, Name: name, Password: password, State: state, Document: document, Id: id},
        type: 'POST',
        success: function (response) {
            if (response) {
                alert("Actualizado con exito")
                location.reload();
            } else {
                alert("Ocurrio un error")
            }
        },
        error: function (xhr, status) {
            alert('Disculpe, existió un problema');
        }
    });
}

