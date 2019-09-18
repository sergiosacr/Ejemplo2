

<%@page import="modelo.DTOCotizacion"%>
<%@page import="modeloDAO.DAOCotizacion"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>JSP Page</title>
    </head>
    <body>

        <div class="d-flex justify-content-around">
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Cotización      
                </div>
                <div class="card-body">
                     <a class="btn btn-success" href="<%=request.getContextPath()%>/CtrGeneral?accion=AgregaCoti">Agregar nueva cotización</a> 
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="text-center">Id cotizacion</th>
                                <th class="text-center">Fecha cotizacion</th>
                                <th class="text-center">Cantidad trabajadores</th>
                                <th class="text-center">Descripcion</th>
                                <th class="text-center">Valor total</th>
                                <th class="text-center">Proyecto </th>
                                <th class="text-center">Usuario </th>
                                <th class="text-center">Acción</th>
                            </tr>
                        </thead>
                        <%
                            DAOCotizacion dao = new DAOCotizacion();
                            List<DTOCotizacion> listC = dao.listarCotizacion();
                            Iterator<DTOCotizacion> iter = listC.iterator();
                            DTOCotizacion Cotizacion = null;
                            while (iter.hasNext()) {
                                Cotizacion = iter.next();

                        %>
                        <tbody>
                            <tr>
                                <td class="text-center"><%=Cotizacion.getId_cotizacion()%></td>
                                <td class="text-center"><%=Cotizacion.getFecha_cotizacion()%></td>
                                <td class="text-center"><%=Cotizacion.getCantidad_trabajadores()%></td>
                                <td class="text-center"><%=Cotizacion.getDescripcion()%></td>
                                <td class="text-center"><%=Cotizacion.getValor_total()%></td>
                                <td class="text-center"><%=Cotizacion.getProyecto_Id_proyecto()%></td>
                                <td class="text-center"><%=Cotizacion.getUsuario_Id_usuario()%></td>
                                <td class="text-center">
                                    <a class="btn btn-warning" href="CtrCotizacion?accion=editar&Id_cotizacion=<%= Cotizacion.getId_cotizacion()%>">Editar</a>
                                    <a  onclick="alerta()" class="btn btn-danger" id="ejemplo" target="">Remover</a> 
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
        <script>
                                 function alerta()
                                 {
                                     var mensaje;
                                     var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                     if (opcion === true) {
                                         location.href = "<%= request.getContextPath()%>/CtrCotizacion?accion=Eliminar&Id_cotizacion=<%= Cotizacion.getId_cotizacion()%>";
                                                 } else {
                                                     location.href = "<%= request.getContextPath()%>/CtrCotizacion?accion=listar";
                                                 }
                                                 document.getElementById("ejemplo").innerHTML = mensaje;
                                             }
        </script>

    </body>
</html>
