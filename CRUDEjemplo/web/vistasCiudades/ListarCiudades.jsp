<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTOCiudades"%>
<%@page import="modeloDAO.DAOCiudades"%>
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
                <div class="card-header">
                    Ciudades      
                </div>
                <div class="card-body">
                    <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtCiudades?accion=add">Agregar Ciudades</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="text-center">Id_ciudades</th>
                                <th class="text-center">Nombre</th>

                                <th class="th-sm">Acción</th>
                            </tr>
                        </thead>
                        <%
                            DAOCiudades dao = new DAOCiudades();
                            List<DTOCiudades> list = dao.listar();
                            Iterator<DTOCiudades> iter = list.iterator();
                            DTOCiudades C = null;
                            while (iter.hasNext()) {
                                C = iter.next();
                        %>
                        <tbody>
                            <tr>
                                <td class="text-center"><%=C.getId_ciudades()%></td>
                                <td class="text-center"><%=C.getNombre()%></td>
                                <td>
                                    <a class="btn btn-warning" href="CrtCiudades?accion=editar&Id_ciudades=<%=C.getId_ciudades()%>">Editar</a> 
                                    <a onclick="alerta()" class="btn btn-danger" id="ejemplo" target="">Remover</a> 
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
        <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="../js/tableToExcel.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
                            function alerta()
                            {
                                var mensaje;
                                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                if (opcion === true) {
                                    location.href = "<%= request.getContextPath()%>/CrtCiudades?accion=Eliminar&Id_ciudades=<%=C.getId_ciudades()%>";
                                            } else {
                                                location.href = "<%= request.getContextPath()%>/CrtCiudades?accion=listar";
                                            }
                                            document.getElementById("ejemplo").innerHTML = mensaje;
                                        }
        </script>
    </body>
</html>
