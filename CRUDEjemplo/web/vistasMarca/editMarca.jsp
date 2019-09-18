<%@page import="modelo.DTOMarca"%>
<%@page import="modeloDAO.DAOMarca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <%
                    DAOMarca daomard = new DAOMarca();
                    int Id_marca = Integer.parseInt((String)request.getAttribute("Id_marca"));
                    DTOMarca marca = (DTOMarca) daomard.list(Id_marca);
                %>
                <h1>Modificar Marca</h1>
                <form action="<%= request.getContextPath()%>/CrtMarca">
                    
                    Nombre:<br>
                    <input class="form-control" type="text" value="<%= marca.getNombre()%>" name="txtnom" ><br>
                    
                    <input class="btn btn-primary" type="submit" name="accion" value="Actualizar"><br>
                    <a class="btn btn-danger" href="CtrGeneral?accion=listarMarca">Regresar</a>
                </form>
            </div>
        </div>
    </body>
</html>
