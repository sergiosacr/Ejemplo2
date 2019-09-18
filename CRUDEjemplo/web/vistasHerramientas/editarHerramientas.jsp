

<%@page import="modelo.DTOHerramientas"%>
<%@page import="modeloDAO.DAOHerramientas"%>
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
                    DAOHerramientas dao = new DAOHerramientas();
                    int Id_herramientas=Integer.parseInt((String)request.getAttribute("Id_herramientas"));
                    DTOHerramientas her= (DTOHerramientas)dao.list(Id_herramientas);
                    %>
                    
        <h1>Actualizar Herramientas</h1>
        <form action="<%=request.getContextPath()%>/CrtHerramientas">
            
            id:<br>
            <input class="form-control" type="text" value="<%= her.getId_herramientas()%>" name="txtId_herramientas" readonly="" ><br>          
            NOMBRE : <br>
            <input class="form-control" type="text" value="<%= her.getNombre()%>" name="txtNombre" required><br>
            DESCRIPCION : <br>
            <input class="form-control" type="text" value="<%= her.getDescripcion()%>" name="txtDescripcion" required><br>
            DESCRIPCION : <br>
            <input class="form-control" type="text" value="<%= her.getPrecio()%>" name="txtPrecio" required><br>
            CANTIDAD : <br>
            <input class="form-control" type="text" value="<%= her.getCantidad()%>" name="txtCantidad" required><br>
         
            TIPO HERRAMIENTAS : <br>
            <input class="form-control" type="number" value="<%=her.getTipo_herramientas_Id_tipo_herramientas()%>" name="txtTipo_herramientas_Id_tipo_herramientas" required>
            
            <input class="btn btn-warning" type="submit" name="accion" value="Actualizar">
            
            <a class="btn btn-danger" href="CrtHerramientas?accion=listar">Regresar</a>
        </form>
            </div>
        </div>     
    </body>
</html>
