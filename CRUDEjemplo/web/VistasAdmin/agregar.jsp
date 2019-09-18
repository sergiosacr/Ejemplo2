<!--
/** aca estan las etiquetas, como su nombre lo indica sirve para que el usuario vea y realice las acciones 
request.getContextPath uso esto para que devulva al inicio en este caso el controlador usuario luego de realizar las funciones,
estan los enlaces de boostrap para hacer las etiquetas.. y ya**/-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I - Ingrese</title>
        <link rel="shortcut icon" href="../images/A$I_png-logo.png">

        <!-- Bootstrap 4 css local <link rel="stylesheet" href="css/bootstrap.min.css">  -->
        <!-- Bootstrap 4 css online -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Hoja de Estilos Propia-->
        <link href="<%=request.getContextPath()%>/css/estilos.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>
    <body>

        <nav style="background: #F09D1E" class="navbar scrolling-navbar stiky navbar-expand-lg navbar-dark ">
            <div class="container">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="../images/A$I_png-nombre.png" alt="" width="35%" height="35%"></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link logPrinc" data-scroll href="<%= request.getContextPath()%>/CtrGeneral?accion=Inicio">PÁGINA PRINCIPAL</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container fondoinicio col-lg-4">
            <div class="col-lg-12">
                <h1>Agregar usuario</h1>
                <form action="<%=request.getContextPath()%>/CrtUsuario">
                    Nombres :<br>
                    <input class="form-control" type="text" name="txtNombre" required><br>
                    Apellidos : <br>
                    <input class="form-control" type="text" name="txtApellidos" required><br>
                    Número celular<br>
                    <input class="form-control" type="number" name="txtCelular" required=""><br>
                    Número telefono : <br>
                    <input class="form-control" type="number" name="txtTelefono"><br>
                    Correo : <br>
                    <input class="form-control" type="email" name="txtCorreo" required><br>
                    Dirección :<br>
                    <input class="form-control" type="text" name="txtDireccion" required><br>
                    Rol :<br>
                    <input class="form-control" type="number" value="2" name="txtRol" readonly="" required><br>
                    Ciudad :<br>
                    <input class="form-control" type="number" name="txtCiudad" required><br>
                    Proyecto : <br>
                    <input class="form-control" type="number" name="txtProyecto" required><br>
                    Contraseña:<br>
                    <input class="form-control" type="text" name="txtContrasenia" required><br>

                    <input class="btn btn-primary" type="submit" name="accion" value="AgregarLogin">

                    <a class="btn btn-primary" style="margin-left: 20px"href="CtrGeneral?accion=Inicio">Regresar</a>
                </form>
            </div>
        </div>     
    </body>
</html> 
