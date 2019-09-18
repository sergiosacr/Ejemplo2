<%@page import="modelo.DTOProyecto"%>
<%@page import="modeloDAO.DAOProyecto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Proyecto      
                </div>
                <div class="card-body">
                    <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtProyecto?accion=add">Agregar Proyecto</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="text-center">Id_proyecto</th>
                                <th class="text-center">Costo</th>
                                <th class="text-center">Direccion</th>
                                <th class="text-center">Fecha_incio</th>
                                <th class="text-center">Fecha_fin</th>
                                <th class="text-center">Asignacion_recursos_idAsignacion_Recursos</th>
                                <th class="text-center">Ciudades_Id_ciudades</th>
                                <th class="text-center">Novedades_Id_novedades</th>
                                <th class="text-center">Estados_proyecto_Id_estado_proyecto</th>
                                <th class="th-sm">Acción</th>
                            </tr>
                        </thead>
                        <%
                            DAOProyecto dao = new DAOProyecto();
                            List<DTOProyecto> list = dao.listar();
                            Iterator<DTOProyecto> iter = list.iterator();
                            DTOProyecto pro = null;
                            while (iter.hasNext()) {
                                pro = iter.next();
                        %>
                        <tbody>
                            <tr>
                                <td class="text-center"><%= pro.getId_proyecto()%></td>
                                <td class="text-center"><%= pro.getCosto()%></td>
                                <td class="text-center"><%= pro.getDireccion()%></td>
                                <td class="text-center"><%= pro.getFecha_incio()%></td>
                                <td class="text-center"><%= pro.getFecha_fin()%></td>
                                <td class="text-center"><%= pro.getAsignacion_recursos_idAsignacion_Recursos()%></td>
                                <td class="text-center"><%= pro.getCiudades_Id_ciudades()%></td>
                                <td class="text-center"><%= pro.getNovedades_Id_novedades()%></td>
                                <td class="text-center"><%= pro.getEstados_proyecto_Id_estado_proyecto()%></td>
                                <td>
                                    <a class="btn btn-warning" href="CrtProyecto?accion=editar&Id_proyecto=<%=pro.getId_proyecto()%>">Editar</a>
                                    <a onclick="alerta()" class="btn btn-danger" id="ejemplo" target="">Remover</a>
                                </td>
                            </tr>
                        </tbody>
                        <% }%>
                    </table>
                    <button class="btn btn-outline-success" style="margin-bottom: 10px" onclick="tableToExcel('testTable', 'W3C Example Table')" value="Export to Excel"><i class="fas fa-file-excel"></i> Exportar a Excel</button>
                </div>
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
                                    function alerta()
                                    {
                                        var mensaje;
                                        var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                        if (opcion === true) {
                                            location.href = "<%= request.getContextPath()%>/CrtProyecto?accion=Eliminar&Id_proyecto=<%=pro.getId_proyecto()%>";
                                                    } else {
                                                        location.href = "<%= request.getContextPath()%>/CrtProyecto?accion=listar";
                                                    }
                                                    document.getElementById("ejemplo").innerHTML = mensaje;
                                                }
        </script>
    </body>
</html>

