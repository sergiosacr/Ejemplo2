<%-- 
    Document   : listarecursos
    Created on : 26/07/2019, 09:57:59 AM
    Author     : Vannesa
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAORecursos"%>
<%@page import="modelo.DTORecursos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    recursos
                </div>
                <div class="card-body">
                    <a class="btn btn-success" href="CrtRecursos?accion=add">Agregar nuevo</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">idAsignacion_Recursos</th>
                                <th class="th-sm">Fecha</th>
                                <th class="th-sm">Cantidad de dinero</th>
                                <th class="th-sm">Observaciones</th>
                                <th class="th-sm">Acción</th>
                            </tr>
                        </thead>
                        <%
                            DAORecursos dao = new DAORecursos();
                            List<DTORecursos> listre = dao.listar();
                            Iterator<DTORecursos> iter = listre.iterator();
                            DTORecursos rec = null;
                            while (iter.hasNext()) {
                                rec = iter.next();


                        %>
                        <tbody>
                            <tr>
                                <td><%=rec.getIdAsignacion_Recursos()%></td>
                                <td><%=rec.getFecha()%></td>
                                <td><%=rec.getCantidad()%></td>
                                <td><%=rec.getObservaciones()%></td>

                                <td>
                                    <a href="CrtRecursos?accion=Editar&idAsignacion_Recursos=<%=rec.getIdAsignacion_Recursos()%>" class="btn btn-warning" style="margin-bottom: 10px;">Editar</a>
                                    <a href="CrtRecursos?accion=eliminar&idAsignacion_Recursos=<%=rec.getIdAsignacion_Recursos()%>" class="btn btn-danger">Remover</a>


                                </td>

                            </tr>

                        </tbody>
                        <% }%>
                    </table>
                    <div>
                        <input type="button" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel">
                    </div>
                </div>
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
