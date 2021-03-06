<%-- 
    Document   : index
    Created on : 21-mar-2020, 11:23:10
    Author     : alumno
--%>



<%@page contentType="text/html" pageEncoding="ISO-8859-9"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Pruebas de Java Web</title>
    </head>
    <body>
        <!--Conexion base de datos-->
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals(0)) {
                response.sendRedirect("login.jsp");
            }

        %>
        <!--Barra de navegacion-->
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand">Pruebas JW</a>
            <form class="form-inline" action="logout.jsp">
                <a href="datosUsuario.jsp"><i class="fa fa-user" aria-hidden="true" ></i><%=sesion.getAttribute("user")%></a>
                <button class="btn btn-outline-danger my-2 my-sm-0 ml-5"  type="submit" >Desconectarse</button>
            </form>
        </nav>
        <!--Formulario-->
        <div class="container"> 
            <div class="row">
                <div class="col-sm">
                    <form action="index.jsp" method="post">
                        <div class="form-group">
                            <label>Escribe tu nombre</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                            <label>Escribe tu edad</label>
                            <input type="text" class="form-control" name="edad" placeholder="Edad">
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
            </div>
            <!--Alerta-->
            <div class="row">
                <div class="col-sm">
                    <div class="alert alert-primary" role="alert">
                        <%
                            String nombre = request.getParameter("nombre");
                            String edad = request.getParameter("edad");
                            if ((nombre != "" && edad != "") && (nombre != null && edad != null)) {
                                String saludar = "Hola " + nombre + " tienes " + edad;
                                out.println(saludar);
                            } else {
                                out.println("no hay datos");
                            }

                        %>
                    </div>
                </div>
            </div>


            <!--Tablas-->
            <h1>Tabla sin acceso a base de datos</h1>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Correo</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Javier</td>
                        <td>Rexa</td>
                        <td>Javier_rexa@hotmail.com</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Pepe</td>
                        <td>Perez</td>
                        <td>Pepe_perez@hotmail.com</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>Kevin</td>
                        <td>LKevin@hotmail.com</td>
                    </tr>
                </tbody>
            </table>
            <br><br><br>
            <h1>Tabla con acceso a base de datos</h1>
     
            <form action="index.jsp" method="get">
            
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center"></th>
                            <th scope="col" class="text-center">
                                <input type="text" name="nombre" class="form-control" placeholder="Buscar por nombre"/>
                            </th>
                            <th scope="col" class="text-center">
                                <input type="submit" value="Buscar" name="Enviar" class="form-control btn btn-primary"/>
                            </th>
                            <th></th>
                            <th scope="col" >
                                <a href="crearEmpleado.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                            </th>
                        </tr>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <jsp:include page="Empleados"/>
                    </tbody>
                </table>
            </form>        
            <!--imagenes-->   
            <img src="https://images.pexels.com/photos/2184717/pexels-photo-2184717.png?cs=srgb&dl=gato-gato-bicolor-gato-callejero-gato-domestico-2184717.jpg&fm=jpg" class="rounded float-left" height="100" width="100" alt="...">
        </div>
    </body>
</html>
