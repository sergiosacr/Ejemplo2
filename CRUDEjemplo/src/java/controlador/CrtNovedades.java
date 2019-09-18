
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTONovedades;
import modeloDAO.DAONovedades;


public class CrtNovedades extends HttpServlet {

    String listarNovedades = "vistasNovedades/listarNovedad.jsp";
    String agregarNovedades = "vistasNovedades/agregarNovedad.jsp";
    String editarNovedades = "vistasNovedades/editarNovedad.jsp";
    DTONovedades nov = new DTONovedades();
    DAONovedades dao = new DAONovedades();
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
            out.println("<title>Servlet CrtNovedades</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtNovedades at " + request.getContextPath() + "</h1>");
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
        String acceso = "";

        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listarNovedades;
            System.out.println("Esta ingresando al CrtNovedades");
        } else if (action.equalsIgnoreCase("addN")) {
            acceso = agregarNovedades;
        } else if (action.equalsIgnoreCase("Agregar")) {
      //int Id_novedades= Integer.parseInt(request.getParameter("txtId_Novedades"));
            String Fecha = request.getParameter("txtFecha");
            String Novedades = request.getParameter("txtNovedades");
            String Observaciones = request.getParameter("txtObservaciones");
            int Tipo_novedad_Id_tipo_novedad=Integer.parseInt(request.getParameter("txtTipo_novedad_Id_tipo_novedad"));
            
            nov.setFecha(Date.valueOf(Fecha));
            nov.setNovedades(Novedades);
            nov.setObservaciones(Observaciones);
            nov.setTipo_novedad_Id_tipo_novedad(Tipo_novedad_Id_tipo_novedad);
            dao.add(nov);
            acceso = listarNovedades;

        } else if (action.equalsIgnoreCase("Editar")) {
            request.setAttribute("Id_novedades", request.getParameter("Id_novedades"));
            acceso=editarNovedades;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            
            int Id_Novedades = Integer.parseInt(request.getParameter("txtId_Novedades"));
            String Fecha = request.getParameter("txtFecha");
            String Novedades = request.getParameter("txtNovedades");
            String Observaciones = request.getParameter("txtObservaciones");
            int Tipo_novedad_Id_tipo_novedad=Integer.parseInt(request.getParameter("txtTipo_novedad_Id_tipo_novedad"));
            
            nov.setId_novedades(Id_Novedades);
            nov.setFecha(Date.valueOf(Fecha));
            nov.setNovedades(Novedades);
            nov.setObservaciones(Observaciones);
            nov.setTipo_novedad_Id_tipo_novedad(Tipo_novedad_Id_tipo_novedad);
            
            dao.edit(nov);
            acceso = listarNovedades;
        }
        else if (action.equalsIgnoreCase("eliminar")){
        int Id_novedades=Integer.parseInt(request.getParameter("Id_novedades"));
        nov.setId_novedades(Id_novedades);
        dao.eliminar(Id_novedades);
        acceso=listarNovedades;
        }

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
