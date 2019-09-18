
<%@page import="modelo.DTOHerramientas"%>
<%@page import="modeloDAO.DAOHerramientas"%>
<%@page import="modeloDAO.DAONovedades"%>
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
        <title>Herramientas</title>
    </head>
    <body>
        <div class="d-flex justify-content-around">
            <small>
                <a href="">Inicio</a> > <a href="">Materiales y Herramientas</a> > <a href="">Consultar Herramientas</a>
                <hr style="background-color: gold; width: 100%">
            </small>
            <div class="card col-sm-12 quitarpadding">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="card-header">
                    Herramientas      
                </div>
                <h1 class="h2 text-center my-5" style="font-family: Microsoft YaHei Light">CONSULTAR HERRAMIENTAS</h1>
                 <div class="card-body">
                     <a class="btn btn-success" href="<%= request.getContextPath()%>/CrtHerramientas?accion=addH">Agregar Herramientas</a>
                    <table id="testTable" summary="Code page support in different versions of MS Windows." rules="groups" frame="hsides" border="1" class="table table-striped table-bordered table-sm">
                        <thead>
                            <tr>
                                <th class="th-sm">Idherramientas</th>
                                <th class="th-sm">Nombre</th>
                                <th class="th-sm">Descripcion</th>
                                <th class="th-sm">Precio</th>
                                <th class="th-sm">Cantidad</th>
                                <th class="th-sm">Tipo herramientas</th>
                                <th class="th-sm">Acción</th>
                            </tr>
                             </thead>
                            <%
                            DAOHerramientas dao = new DAOHerramientas();
                            List<DTOHerramientas> listre = dao.listar();
                            Iterator<DTOHerramientas> iter = listre.iterator();
                            DTOHerramientas her = null;
                            while (iter.hasNext()) {
                                her = iter.next();
                        %>
                       
                        <tbody>
                            <tr>
                                <td><%=her.getId_herramientas()%></td>
                                <td><%=her.getNombre()%></td>
                                <td><%=her.getDescripcion()%></td>
                                <td><%=her.getPrecio()%></td>
                                <td><%=her.getCantidad()%></td>
                                <td><%=her.getTipo_herramientas_Id_tipo_herramientas()%></td>

                                <td>
                                    
                                    <a class="btn btn-warning" href="CrtHerramientas?accion=Editar&Id_herramientas=<%=her.getId_herramientas()%>">Editar</a>
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
                                            location.href = "<%= request.getContextPath()%>/CrtHerramientas?accion=eliminar&Id_herramientas=<%=her.getId_herramientas()%>";
                                                    } else {
                                                        location.href = "<%= request.getContextPath()%>/CrtHerramientas?accion=listar";
                                                    }
                                                    document.getElementById("ejemplo").innerHTML = mensaje;
                                                }
        </script>

    </body>
</html>
