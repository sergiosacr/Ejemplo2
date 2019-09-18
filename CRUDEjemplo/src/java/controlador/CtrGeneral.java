
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CtrGeneral extends HttpServlet {

    //variables Administrador
    String Inicio="index.jsp";
    String ListarRecursos = "vistasRecursos/listarecursos.jsp";
    String AsignarRecursos= "vistasRecursos/agregarecursos.jsp";
    String novedades="vistasNovedades/agregarNovedad.jsp";
    String ListarNovedad = "vistasNovedades/listarNovedad.jsp";
    String Editarnovedades="vistasNovedades/editarNovedad.jsp";
    String Trabajador="vistaEmpleado/agregarEmpleado.jsp";
    String ListarTrabajador= "vistaEmpleado/listarEmpleado.jsp";
    String ListarC= "vistasCotizacion/ListarCotizacion.jsp";
    String ListarP= "vistasProyecto/ListarProyecto.jsp";
    String AgregarP= "vistasProyecto/AddProyecto.jsp";
    String ListarCiudad= "vistasCiudades/ListarCiudades.jsp";
    String AgregarCoti= "vistasCotizacion/AddCotizacion.jsp";
    String ListarHerramientas= "vistasHerramientas/listarHerramientas.jsp";
    String ListarMarca="vistasMarca/listarMarca.jsp";
    String AgregarMarca="vistasMarca/addMarca.jsp";
    
    
    //variables Contratista
    String listaR= "vistasRecursos/listarecursos.jsp";
    String AsignaR= "vistasRecursos/agregarecursos.jsp";
    String novedad= "vistasNovedades/agregarNovedad.jsp";
    String listarN= "vistasNovedades/listarNovedad.jsp";
    String editarN= "vistasNovedades/editarNovedad.jsp";
    String trabaja= "vistaEmpleado/agregarEmpleado.jsp";
    String listaT= "vistaEmpleado/listarEmpleado.jsp";
    String AgregaCoti= "vistasCotizacion/AddCotizacion.jsp";
    String EditarCoti="vistasCotizacion/EditCotizacion.jsp";
    String ListarCoti= "vistasCotizacion/ListarCotizacion.jsp";
    
//variables clientes
    String Listacotizacion="vistasCotizacion/ListarCotizacion.jsp";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrGeneral</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrGeneral at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";
        //redirección Administrador
        if(action.equalsIgnoreCase("Inicio")){
            acceso=Inicio;
        }else if (action.equalsIgnoreCase("agregarrecurso")){
            acceso=AsignarRecursos;
        }else if (action.equalsIgnoreCase("agregarNovedad")){
            acceso=novedades;
        }else if (action.equalsIgnoreCase("listarNovedad")){
            acceso = ListarNovedad;
        }else if (action.equalsIgnoreCase("Trabajador")){
            acceso=Trabajador;
        }else if (action.equalsIgnoreCase("ListarTrabajador")){
            acceso= ListarTrabajador;
        }else if (action.equalsIgnoreCase("listaderecursos")){
            acceso=ListarRecursos;
        }else if (action.equalsIgnoreCase("ListarC")){
        acceso=ListarC;
        }else if (action.equalsIgnoreCase("listar")){
        acceso=ListarP;
        }else if (action.equalsIgnoreCase("AddProyecto")){
        acceso=AgregarP;
        }else if (action.equalsIgnoreCase("listarCiudad")){
        acceso=ListarCiudad;
        }else if (action.equalsIgnoreCase("listarHerramientas")){
        acceso=ListarHerramientas;
        }else if (action.equalsIgnoreCase("listarMarca")) {
            acceso = ListarMarca;
        
        }  else if (action.equalsIgnoreCase("addMarca")) {
            acceso= AgregarMarca;
            
            //redirección contratista
        }else if (action.equalsIgnoreCase("listaR")){
        acceso=listaR;
        } else if (action.equalsIgnoreCase("AsignaR")){
        acceso=AsignaR;
        }else if (action.equalsIgnoreCase("novedad")){
        acceso=novedad;
        }else if (action.equalsIgnoreCase("listarN")){
        acceso=listarN;
        }else if (action.equalsIgnoreCase("editarN")){
        acceso=editarN;
        }else if (action.equalsIgnoreCase("trabaja")){
        acceso=trabaja;
        }else if (action.equalsIgnoreCase("listaT")){
        acceso=listaT;
        }else if (action.equalsIgnoreCase("AgregaCoti")){
        acceso=AgregaCoti;
        }else if (action.equalsIgnoreCase("EditarCoti")){
        acceso=EditarCoti;
        }else if (action.equalsIgnoreCase("ListarCoti")){
        acceso=ListarCoti;
        
        
        //redireccion clientes
        }else if (action.equalsIgnoreCase("Listacotizacion")){
        acceso=Listacotizacion;}
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
