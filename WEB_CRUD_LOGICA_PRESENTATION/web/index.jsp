<%-- 
    Document   : index
    Created on : 8/05/2020, 03:36:42 PM
    Author     : DIEGO
--%>
<%@page import="Controllers.UsersController"%>
<%@page import="Models.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% UsersController userController = new UsersController(); %>
<html>
    <head>
        <title>CRUD JAVA WEB</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
    </head>
    <body>
        <h1 class=" h1 text-center text-primary">CRUD</h1>
        <div class="container" style="margin-top:50px">
            <form action="" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="inputEmail4">Nombre</label>
                        <input type="text" id="name" class="form-control">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputPassword4">Contraseña</label>
                        <input type="password" id="password"  class="form-control">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputState">Estado</label>
                        <select id="state" class="form-control">
                            <option value="true">Activo</option>
                            <option value="false">Inactivo</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputZip">Documento</label>
                        <input type="number" id="document" class="form-control">
                    </div>
                </div>
                <div class="form-group col-md-3">          
                    <button type="button" id="bt-Add" class="btn btn-success" onclick="Add()">Agregar</button>
                    <button type="button" id="bt-Update" style="display:none" class="btn btn-primary" onclick="UpdateLast(this.value)">Actualizar</button>
                </div>
            </form>

            <table class="table" style="margin-top: 20px">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Contraseña</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Documento</th>
                        <th scope="col">Acción</th>
                    </tr>
                </thead>
                <tbody id="Table">
                    <%
                        ArrayList<Users> list = userController.List();
                        if (list != null) {
                            for (Users user : list) {
                    %>
                    <tr id="row<%= user.getId()%>">
                        <th scope="row"><%= user.getId()%></th>
                        <td><%= user.getName()%></td>
                        <td><%= user.getPassword()%></td>
                        <td><%= user.isState()%></td>
                        <td><%= user.getDocument()%></td>
                        <td> 
                            <button type="button" value="<%= user.getId()%>" class="btn btn-primary btn-sm" onclick="Update(this.value)">Actualizar</button>
                            <button type="button" value="<%= user.getId()%>" class="btn btn-danger btn-sm" onclick="Delete(this.value)">Eliminar</button>
                        </td>
                    </tr>
                    <%                                      }
                        }%>  
                </tbody>
            </table>
        </div>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="Resources/js/index.js"></script>
    </body>
</html>


