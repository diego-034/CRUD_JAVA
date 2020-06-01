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
<% if (request.getParameter("name") != null) {
        Users user = new Users();
        user.setName(request.getParameter("name"));
        user.setPassword(request.getParameter("password"));
        user.setState(Boolean.parseBoolean(request.getParameter("state")));        
        user.setDocument(request.getParameter("document"));
        if (userController.Add(user)) {%>
                <script>
                 alert('¡registro exitoso!');
                </script>
<% }
    }
%>
<html>
    <head>
        <title>CRUD JAVA WEB</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <h1 class=" h1 text-center text-primary">CRUD</h1>
        <div class="container" style="margin-top:50px">
            <form action="" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="inputEmail4">Nombre</label>
                        <input type="text" name="name" class="form-control" id="inputEmail4">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputPassword4">Contraseña</label>
                        <input type="password" name="password"  class="form-control" id="inputPassword4">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputState">Estado</label>
                        <select id="inputState"name="state" class="form-control">
                            <option value="true">Activo</option>
                            <option value="false">Inactivo</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputZip">Documento</label>
                        <input type="number" name="document" class="form-control" id="inputZip">
                    </div>
                </div>
                <div class="form-group col-md-3">          
                    <button type="submit" class="btn btn-success">Agregar</button>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-2" style="display:none">
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
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
                <tbody>
                    <%
                        ArrayList<Users> list = userController.List();
                        if (list != null) {
                            for (Users user : list) {
                    %>
                    <tr>
                        <th scope="row"><%= user.getId()%></th>
                        <td><%= user.getName()%></td>
                        <td><%= user.getPassword()%></td>
                        <td><%= user.isState()%></td>
                        <td><%= user.getDocument()%></td>
                        <td> 
                            <button type="submit" value="<%= user.getId()%>" class="btn btn-primary btn-sm" onClick="Update(this.value)">Actualizar</button>
                            <button type="submit" value="<%= user.getId()%>" class="btn btn-danger btn-sm" onClick="Delete(this.value)">Eliminar</button>
                        </td>
                    </tr>
                    <%                                      }
                        }%>  
                </tbody>
            </table>
        </div>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="Ajax.js"></script>
    </body>
</html>


