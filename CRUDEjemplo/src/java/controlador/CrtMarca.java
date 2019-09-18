    package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOMarca;
import modeloDAO.DAOMarca;

public class CrtMarca extends HttpServlet {

    //Ruta donde se encuentras las vistas
    String listar = "vistasMarca/listarMarca.jsp";
    String add = "vistasMarca/addMarca.jsp";
    String edit = "vistasMarca/editMarca.jsp";
    DTOMarca m = new DTOMarca();
    DAOMarca dao = new DAOMarca();
    int Id_marca;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtMarca</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtMarca at " + request.getContextPath() + "</h1>");
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
        if (action.equalsIgnoreCase("listarMarca")) {
            acceso = listar;
            System.out.println("Esta ingresando al CrtMarca");
        } else if (action.equalsIgnoreCase("addMarca")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            
            String Nombre = request.getParameter("txtnom");
           
            m.setNombre(Nombre);
            dao.add(m);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("Id_marca", request.getParameter("Id_marca"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            
           
            String Nombre = request.getParameter("txtnom");
           
            m.setNombre(Nombre);
            dao.edit(m);
            acceso = listar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            Id_marca = Integer.parseInt(request.getParameter("Id_marca"));
            m.setId_marca(Id_marca);
            dao.Eliminar(Id_marca);
            acceso = listar;

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
    