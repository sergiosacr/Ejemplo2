
<%@page import="java.util.Iterator"%>
<%@page import="modelo.DTONovedades"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.DAONovedades"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    Novedades      
                </div>
                 <div class="card-body">
                     <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtNovedades?accion=addN">Agregar novedad</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">Id novedades</th>
                                <th class="th-sm">Fecha</th>
                                <th class="th-sm">Novedades</th>
                                <th class="th-sm">Observaciones</th>
                                <th class="th-sm">Tipo novedad</th>
                                <th class="th-sm">Acción</th>
                            </tr>
                             </thead>
                            <%
                            DAONovedades dao = new DAONovedades();
                            List<DTONovedades> listre = dao.listar();
                            Iterator<DTONovedades> iter = listre.iterator();
                            DTONovedades nov = null;
                            while (iter.hasNext()) {
                                nov = iter.next();
                        %>
                       
                        <tbody>
                            <tr>
                                <td><%=nov.getId_novedades()%></td>
                                <td><%=nov.getFecha()%></td>
                                <td><%=nov.getNovedades()%></td>
                                <td><%=nov.getObservaciones()%></td>
                                <td><%=nov.getTipo_novedad_Id_tipo_novedad()%></td>

                                <td>
                                    <a href="CrtNovedades?accion=Editar&Id_novedades=<%=nov.getId_novedades()%>" class="btn btn-warning" style="margin-bottom: 10px;">Editar</a>
                                     <a  onclick="alerta()" class="btn btn-danger" id="ejemplo" target="">Remover</a> 
 
                                
                                </td>

                            </tr>

                            <script>
                            function alerta()
                            {
                                var mensaje;
                                var opcion = confirm("¿Esta seguro de remover el resgistro?");
                                if (opcion === true) {
                                    location.href = "<%= request.getContextPath()%>/CrtNovedades?accion=Eliminar&Id_novedades=<%= nov.getId_novedades()%>";
                                            } else {
                                                location.href = "<%= request.getContextPath()%>/CrtNovedades?accion=listar";
                                            }
                                            document.getElementById("ejemplo").innerHTML = mensaje;
                                        }
                        </script>
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
