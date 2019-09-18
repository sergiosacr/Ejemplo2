
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
        <h1>Agregar Herramientas</h1>
        <form action="<%=request.getContextPath()%>/CrtHerramientas">
            Nombre :<br>
            <input class="form-control" type="text" name="txtNombre" required><br>
            Descripcion : <br>
            <input class="form-control" type="text" name="txtDescripcion" required><br>
            Precio : <br>
            <input class="form-control" type="text" name="txtPrecio" required><br>
            Cantidad : <br>
            <input class="form-control" type="number" name="txtCantidad" required><br>
            TTipo_herramientas_Id_tipo_herramientas: <br>
<input class="form-control" type="number" name="txtTipo_herramientas_Id_tipo_herramientas" required><br> 
            
            
            <input class="btn btn-warning" type="submit" name="accion" value="Agregar">
            
            <a class="btn btn-danger" href="CrtHerramientas?accion=listar">Regresar</a>
        </form>         
            </div>
        </div>
    </body>
</html>
