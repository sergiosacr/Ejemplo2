<%-- 
    Document   : listarEmpleado
    Created on : 5/08/2019, 08:53:22 PM
    Author     : Vannesa
--%>

<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTOUsuario"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAOUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">        <link rel="stylesheet" src="">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 ">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Empleados
                </div>
                <div class="card-body" style="margin-left: -30px;">
                    <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtUsuario?accion=addEmpleado">Agregar Empleado</a>
                    <table border="1" class="table table-striped table-bordered table-sm" >
                        <thead>
                            <tr>
                              
                                <th class="th-sm">Nombres</th>
                                <th class="th-sm">Apellidos</th>
                                <th class="th-sm">Celular</th> 
                                <th class="th-sm">Teléfono</th>
                                <th class="th-sm">Correo electrónico</th>
                                <th class="th-sm">Dirección</th>
                                <th class="th-sm">Ciudad</th>
                                <th class="th-sm">Código Proyecto</th>
                                 <th class="th-sm">Contraseña</th>  
                                <th class="th-sm">Acción</th>
                            </tr>
                        </thead>
                        
       
                        <%
                            DAOUsuario dao = new DAOUsuario();
                            List<DTOUsuario> list = dao.listar();
                            Iterator<DTOUsuario> iter = list.iterator();
                            DTOUsuario usu = null;
                            while (iter.hasNext()) {
                                usu = iter.next();


                        %>
                        <tbody>
                            <tr>
                               
                                <td><%=usu.getNombres()%></td>
                                <td><%=usu.getApellidos()%></td>
                                <td><%=usu.getNumero_celular()%></td>
                                <td><%=usu.getNumero_telefono()%></td>
                                <td><%=usu.getCorreo()%></td>
                                <td><%=usu.getDireccion()%></td>
                                <td><%=usu.getRoles_Id_roles()%></td>
                                <td><%=usu.getCiudades_Id_ciudades()%></td>
                                <td><%=usu.getProyecto_Id_proyecto()%></td>
                                <td>
                                    <a class="btn btn-warning" href="CrtUsuario?accion=Editar&Id_usuario=<%=usu.getId_usuario()%>" style="margin-bottom: 10px;">Editar</a>
                                     <a  onclick="alerta()" class="btn btn-danger" id="ejemplo" target="">Remover</a> 
 
                                </td>

                            </tr>
                            <script>
                            function alerta()
                            {
                                var mensaje;
                                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                if (opcion === true) {
                                    location.href = "<%= request.getContextPath()%>/CrtUsuario?accion=Eliminar&Id_usuario=<%= usu.getId_usuario()%>";
                                            } else {
                                                location.href = "<%= request.getContextPath()%>/CrtUsuario?accion=listar";
                                            }
                                            document.getElementById("ejemplo").innerHTML = mensaje;
                                        }
                        </script>
                        </tbody>
                        <% }%>
                    </table>
                </div>
            </div>
        </div>
        <script src="<%= request.getContextPath()%>/js/jquery.js" type="text/javascript"></script>
         


        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
    </body>
</html>
