/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOCiudades;
import modeloDAO.DAOCiudades;

/**
 *
 * @author sacr9
 */
public class CrtCiudades extends HttpServlet {
 //Ruta donde se encuentras las vistas
    String listarC = "vistasCiudades/ListarCiudades.jsp";
    String AddC = "vistasCiudades/AddCiudades.jsp";
    String EditC = "vistasCiudades/EditCiudades.jsp";
    DTOCiudades c = new DTOCiudades();
    DAOCiudades dao = new DAOCiudades();
    int Id_ciudades;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtCiudades</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtCiudades at " + request.getContextPath() + "</h1>");
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
            acceso = listarC;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = AddC;
            System.out.println("Esta ingresando al CrtCiudades");
        } else if (action.equalsIgnoreCase("Agregar")) {
            String Nombre = request.getParameter("txtNombre");
            c.setNombre(Nombre);
            dao.add(c);
            acceso = listarC;
            
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("Id_ciudades", request.getParameter("Id_ciudades"));
            acceso = EditC;
        } else if (action.equalsIgnoreCase("Actualizar")) {

            Id_ciudades = Integer.parseInt(request.getParameter("txtId_ciudades"));
            String Nombre = request.getParameter("txtNombre");

            c.setId_ciudades(Id_ciudades);
            c.setNombre(Nombre);

            dao.edit(c);
            acceso = listarC;
        } else if (action.equalsIgnoreCase("eliminar")) {
            Id_ciudades = Integer.parseInt(request.getParameter("Id_ciudades"));
            c.setId_ciudades(Id_ciudades);
            dao.Eliminar(Id_ciudades);
            acceso = listarC;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

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
