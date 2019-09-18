<%-- 
    Document   : principal
    Created on : 28/07/2019, 08:12:24 PM
    Author     : Vannesa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>A$I - Administrador</title>
        <link rel="shortcut icon" href="<%=request.getContextPath()%>img/A$I_png-logo.png">

        <!-- Bootstrap 4 local <link rel="stylesheet" href="css/bootstrap.min.css">  -->

        <!-- Bootstrap 4 online -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- Hoja de Estilos Propia-->
        <link href="<%=request.getContextPath()%>/css/cssAdmin.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    </head>

    <body>
        <div class="wrapper">
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h4>ELIAZAR<br>CONSTRUCCIONES S.A.S</h4>
                </div>

                <ul class="list-unstyled components">
                    <p style="font-weight: bold; color: #000" class="lead">Administrador</p>
                    <li>
                        <a href="#mSub1" data-toggle="collapse" aria-expanded="false" class="mt-5 dropdown-toggle">Cotización y Seguimiento</a>
                        <ul class="collapse list-unstyled" id="mSub1">
                            <li>
                                <a href="<%= request.getContextPath()%>/CrtProyecto?accion=add" target="workSection">Registar Proyecto</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=listar" target="workSection">Consultar Proyecto</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=AgregaCoti" target="workSection">Crear Cotización</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=ListarCoti" target="workSection">Consultar Cotización</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=listarCiudad" target="workSection">Consultar Ciudad</a>
                            </li>
                        </ul> 
                    </li>

                    <li>
                        <a href="#mSub2" data-toggle="collapse" aria-expanded="false" class="mt-3 dropdown-toggle">Asignación de Recursos</a>
                        <ul class="collapse list-unstyled" id="mSub2">

                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=Trabajador" target="workSection">Registrar Trabajador</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=ListarTrabajador" target="workSection">Consultar Trabajador</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=listaderecursos" target="workSection">Consultar Recursos</a>
                            </li>
                            <%--<li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=agregarrecurso" target="workSection">Asignar Recursos</a>
</li> 
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=agregarNovedad" target="workSection">Registrar Novedades</a>
                            </li> --%>
  
                            <li>
                                <a href="<%=request.getContextPath()%>/CtrGeneral?accion=listarNovedad" target="workSection">Consultar Novedades</a>
                            </li>
                        </ul> 
                    </li>

                    <li>
                        <a href="#mSub3" data-toggle="collapse" aria-expanded="false" class="mt-3 dropdown-toggle">Materiales y Herramientas</a>
                        <ul class="collapse list-unstyled" id="mSub3">

                             <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=agregarMateriales" target="workSection">Registar Materiales</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=listarMateriales" target="workSection">Consultar Materiales</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrTipo_Materiales?accion=listarTipo_Materiales" target="workSection"> Tipo Materiales</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CrtHerramientas?accion=addH" target="workSection">Registar Herramientas</a>
                            </li>
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=listarHerramientas" target="workSection">Concultar Herramientas</a>
                            </li>
                            
                            <li>
                                <a href="<%= request.getContextPath()%>/CtrTipo_Herramientas?accion=listarTipo_Herramientas" target="workSection"> Tipo de herramientas</a>
                            </li>
     
                             <li>
                                <a href="<%= request.getContextPath()%>/CtrGeneral?accion=listarMarca" target="workSection">Marcas</a>
                            </li>
                        </ul> 
                    </li>
                </ul>

                <footer class="row align-items-end">
                    <ul class="list-unstyled CTAs">
                        <li>
                            <a href="<%= request.getContextPath()%>/CtrGeneral?accion=Inicio" class="btn-dark">Salir a la página Principal</a>
                        </li>
                    </ul>
                </footer>
            </nav>

        
            <!-- BUTTON SIDEBAR -->
            <div class="container-fluid">

                <!-- NAV -->      

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <button type="button" id="sidebarCollapse" class="btn btn-warning">
                        <i class="fas fa-bullseye"></i>
                    </button>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">

                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link ml-4" href="#">INICIO<span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"></a>
                            </li>
                            <button class="dropdown-item" type="button">
                        </ul>
                        <div class="btn-group">
                            <button type="button" class="btn btn-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"></i> <a> ${Correo}</a>
                            </button>
                            <div class="dropdown-menu dropdown-menu"><hr></button>
                                <!--<button class="dropdown-item" type="button">Configuración</button>-->
                                <a href="<%=request.getContextPath()%>/CtrLogin?accion=Salir" class="dropdown-item">Salir</a>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- END NAV -->

                <!-- MAIN -->      
                <div role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <h1 class="h2">Administrador</h1>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <!--div class="btn-group mr-2">
                              <button type="button" class="btn btn-sm btn-outline-secondary"><a href="">Link 1</a></button>
                              <button type="button" class="btn btn-sm btn-outline-secondary"><a href="">Link 2</a></button>
                            </div-->
                        </div>
                    </div>
                    <section class="">
                        <iframe name="workSection" src="ModuloAdministrador/Bienvenido.jsp"></iframe>
                    </section> 
                </div>
                
        </div>  
        <!-- SCRPTS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- others 1 SCRPTS -->    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
        <script src="../js/dashboard.js" type="text/javascript"></script>
        <!-- others 2 SCRPTS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>
    </body>
</html>
