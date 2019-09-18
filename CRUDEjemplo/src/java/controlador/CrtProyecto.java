/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOProyecto;
import modeloDAO.DAOProyecto;

/**
 *
 * @author sacr9
 */
public class CrtProyecto extends HttpServlet {

     //Ruta donde se encuentras las vistas

    String listarPro = "vistasProyecto/ListarProyecto.jsp";
    String AddPro = "vistasProyecto/AddProyecto.jsp";
    String EditPro = "vistasProyecto/EditProyecto.jsp";
    DTOProyecto pro = new DTOProyecto();
    DAOProyecto dao = new DAOProyecto();
    int Id_proyecto;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtProyecto</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtProyecto at " + request.getContextPath() + "</h1>");
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
            acceso = listarPro;
            System.out.println("Esta ingresando al CrtProyecto");
            
        } else if (action.equalsIgnoreCase("add")) {
            acceso = AddPro;
            
        } else if (action.equalsIgnoreCase("Agregar")) {
            float Costo = Float.parseFloat(request.getParameter("txtcos"));
            String Direccion = request.getParameter("txtdes");
            String Fecha = request.getParameter("txtfein");
            String Fecha_fin = request.getParameter("txtfefin");
            int Asignacion_recursos_idAsignacion_Recursos = Integer.parseInt(request.getParameter("txtaid"));
            int Ciudades_Id_ciudades = Integer.parseInt(request.getParameter("txtcid"));
            int Novedades_Id_novedades = Integer.parseInt(request.getParameter("txtnid"));
            int Estados_proyecto_Id_estado_proyecto = Integer.parseInt(request.getParameter("txteid"));

            pro.setCosto(Costo);
            pro.setDireccion(Direccion);
            pro.setFecha_incio(Date.valueOf(Fecha));
            pro.setFecha_fin(Date.valueOf(Fecha_fin));
            pro.setAsignacion_recursos_idAsignacion_Recursos(Asignacion_recursos_idAsignacion_Recursos);
            pro.setCiudades_Id_ciudades(Ciudades_Id_ciudades);
            pro.setNovedades_Id_novedades(Novedades_Id_novedades);
            pro.setEstados_proyecto_Id_estado_proyecto(Estados_proyecto_Id_estado_proyecto);

            dao.add(pro);
            acceso = listarPro;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("Id_proyecto", request.getParameter("Id_proyecto"));
            acceso = EditPro;
            
        } else if (action.equalsIgnoreCase("Actualizar")) {
            Id_proyecto = Integer.parseInt(request.getParameter("txtidpro"));
            float Costo = Float.parseFloat(request.getParameter("txtcos"));
            String Direccion = request.getParameter("txtdes");
            String Fecha = request.getParameter("txtfein");
            String Fecha_fin = request.getParameter("txtfefin");
            int Asignacion_recursos_idAsignacion_Recursos = Integer.parseInt(request.getParameter("txtaid"));
            int Ciudades_Id_ciudades = Integer.parseInt(request.getParameter("txtcid"));
            int Novedades_Id_novedades = Integer.parseInt(request.getParameter("txtnid"));
            int Estados_proyecto_Id_estado_proyecto = Integer.parseInt(request.getParameter("txteid"));

            pro.setId_proyecto(Id_proyecto);
            pro.setCosto(Costo);
            pro.setDireccion(Direccion);
            pro.setFecha_incio(Date.valueOf(Fecha));
            pro.setFecha_fin(Date.valueOf(Fecha_fin));
            pro.setAsignacion_recursos_idAsignacion_Recursos(Asignacion_recursos_idAsignacion_Recursos);
            pro.setCiudades_Id_ciudades(Ciudades_Id_ciudades);
            pro.setNovedades_Id_novedades(Novedades_Id_novedades);
            pro.setEstados_proyecto_Id_estado_proyecto(Estados_proyecto_Id_estado_proyecto);

            dao.edit(pro);
            acceso = listarPro;
            
        } else if (action.equalsIgnoreCase("Eliminar")) {
            Id_proyecto = Integer.parseInt(request.getParameter("Id_proyecto"));
            pro.setId_proyecto(Id_proyecto);
            dao.Eliminar(Id_proyecto);
            acceso = listarPro;
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
