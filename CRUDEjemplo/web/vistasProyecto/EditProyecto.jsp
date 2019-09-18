<%@page import="modelo.DTOProyecto"%>
<%@page import="modeloDAO.DAOProyecto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <%
                    DAOProyecto dao = new DAOProyecto();
                    int Id_proyecto = Integer.parseInt((String) request.getAttribute("Id_proyecto"));
                    DTOProyecto Pro = (DTOProyecto) dao.list(Id_proyecto);
                %>  
                <h1>Modificar Proyecto</h1>
                <form action="<%=request.getContextPath()%>/CrtProyecto">
                    Id_proyecto:<br>
                    <input class="form-control" type="text" value="<%=Pro.getId_proyecto()%>" name="txtidpro" readonly=""><br>
                    Costo:<br>
                    <input class="form-control" type="text" value="<%=Pro.getCosto()%>" name="txtcos"><br>
                    Direccion:<br>
                    <input class="form-control" type="text"  value="<%=Pro.getDireccion()%>"name="txtdes"><br>
                    Fecha_incio:<br>
                    <input class="form-control" type="date" value="<%=Pro.getFecha_incio()%>" name="txtfein"><br>
                    Fecha_fin:<br>
                    <input class="form-control" type="date" value="<%=Pro.getFecha_fin()%>" name="txtfefin"><br>
                    Asignacion_recursos_idAsignacion_Recursos:<br>
                    <input class="form-control" type="text" value="<%=Pro.getAsignacion_recursos_idAsignacion_Recursos()%>" name="txtaid"><br>
                    Ciudades_Id_ciudades:<br>
                    <input class="form-control" type="text" value="<%=Pro.getCiudades_Id_ciudades()%>" name="txtcid"><br>
                    Novedades_Id_novedades:<br>
                    <input class="form-control" type="text" value="<%=Pro.getNovedades_Id_novedades()%>" name="txtnid"><br>
                    Estados_proyecto_Id_estado_proyecto:<br>
                    <input class="form-control" type="text" value="<%=Pro.getEstados_proyecto_Id_estado_proyecto()%>" name="txteid"><br>

                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
                    <a href="CrtProyecto?accion=listar">Regresar</a>
                </form>         
            </div>
        </div>
       
</body>
</html>