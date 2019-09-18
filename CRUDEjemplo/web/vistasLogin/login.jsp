<%-- 
    Document   : login
    Created on : 28/07/2019, 08:03:44 PM
    Author     : Vannesa
--%>

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
        <div class="container fondoinicio col-lg-3">

            <form action="<%=request.getContextPath()%>/CtrLogin">
                <div class="form-group text-center">
                    <img src="<%=request.getContextPath()%>/img/login.jpg" height="80" width="80"/>
                    <p><strong>Inicio de sesión</strong></p>
                </div>
                <div class="form-group">
                    <div class ="form-group">
                        <label>Email:</label>
                        <input type="email" class="form-control" name="txtCorreo" placeholder="ejemplo@ejemplo.com" required>
                    </div>
                    <div class="from-group">
                        <label>Contraseña:</label>
                        <input class="form-control" type="password" name="txtContrasenia" placeholder="ingrese su Contraseña" required>
                    </div>
                    <div>
                        <input class="btn btn-danger btn-block" value="Ingresar" style="margin-top: 20px;" type="submit" name="accion" >
                        <!--<input class="btn btn-danger btn-block" style="margin-top: 20px;" type="submit" name="accion" value="Olvide Contraseña">-->
                    </div>
                    <
                </div>

            </form>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
