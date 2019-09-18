<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DTOTipo_Herramientas"%>
<%@page import="modeloDAO.DAOTipo_Herramientas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Consultar Tipo de Herramientas</title>
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/A$I_png-logo.png">
        
        <!-- BOOTSTRAP LOCAL <link rel="stylesheet" href="css/bootstrap.min.css">  -->
        <!-- BOOTSTRAP 4 ONLINE -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- HOJAS DE ESTILOS PROPIA -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssMod.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssPrinc.css">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>

    <body>
        <div class="lead" style="font-size: 15px;">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Consultar Tipo de Herramientas</a>
                <hr style="background-color: gold; width: 100%">
            </small>
        </div>
        <div class="container-fluid">
            <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">CONSULTAR HERRAMIENTAS</h1>
            <a href="<%= request.getContextPath()%>/CtrTipo_Herramientas?accion=agregarTipo_Herramientas">Agregar Nuevo Tipo de Herramienta</a>            
            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Tipo de Herramienta</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <%
                    DAOTipo_Herramientas htaDAO = new DAOTipo_Herramientas();
                    List<DTOTipo_Herramientas> list = htaDAO.listar();
                    Iterator<DTOTipo_Herramientas> iter = list.iterator();
                    DTOTipo_Herramientas hta = null;
                    while (iter.hasNext()) {
                        hta = iter.next();

                %>
                <tbody>
                    <tr>
                        <td><%= hta.getId_tipo_herramientas()%></td>
                        <td><%= hta.getTipo_herramientas()%></td>
                        <td><%= hta.getDescripcion()%></td>
                        <td>
                            <a href="<%= request.getContextPath()%>/CtrTipo_Herramientas?accion=editarTipo_Herramientas&Id_tipo_herramientas=<%= hta.getId_tipo_herramientas()%>">Editar</a>
                            <a href="<%= request.getContextPath()%>/CtrTipo_Herramientas?accion=eliminarTipo_Herramientas&Id_tipo_herramientas=<%= hta.getId_tipo_herramientas()%>">Eliminar</a>
                        </td>                            
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <div class="">
                <input type="search" placeholder="Buscar Tipo de Herramienta..." size="20">
            </div>
        </div>		
        <!-- SCRPTS -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/tableToExcel.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
    <!-- FIN DEL CUERPO -->
</html>
</body>
</html>
