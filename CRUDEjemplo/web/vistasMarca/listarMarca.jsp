<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DTOMarca"%>
<%@page import="modeloDAO.DAOMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <a href="listarMarca.jsp"></a>
         <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">        <link rel="stylesheet" src="">

        <title>Marcas</title>
    </head>
    <body>
        <div class="container">
            <h1>MARCA</h1>
            <a class="btn btn-success" href="CtrGeneral?accion=addMarca">Agregar nuevo</a>
            <br>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Id_Marca</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">ACCIONES</th>
                    </tr>
                </thead>
                <%
                    DAOMarca dao=new DAOMarca();
                    List<DTOMarca>list=dao.listar();
                    Iterator<DTOMarca>iter=list.iterator();
                    DTOMarca mar=null;
                    while (iter.hasNext()) {
                            mar=iter.next();
                        
                %>

                <tbody>
                    <tr>
                        <td class="text-center"><%= mar.getId_marca()%></td>
                        <td class="text-center"><%= mar.getNombre()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="CrtMarca?accion=editar&Id_marca=<%= mar.getId_marca()%>">Editar</a>
                            <a class="btn btn-danger" href="CrtMarca?accion=Eliminar&Id_marca=<%= mar.getId_marca()%>">Remove</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
    </body>
</html>