package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOHerramientas;
import modeloDAO.DAOHerramientas;

public class CrtHerramientas extends HttpServlet {

    String listarHerramientas = "vistasHerramientas/listarHerramientas.jsp";
    String agregarHerramientas = "vistasHerramientas/agregarHerramientas.jsp";
    String editarHerramientas = "vistasHerramientas/editarHerramientas.jsp";
    
    DTOHerramientas her = new DTOHerramientas();
    DAOHerramientas dao = new DAOHerramientas();

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
            out.println("<title>Servlet CrtHerramientas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtHerramientas at " + request.getContextPath() + "</h1>");
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
            acceso = listarHerramientas;
            System.out.println("Esta ingresando al CrtHerramientas");
        }else if (action.equalsIgnoreCase("addH")) {
            acceso = agregarHerramientas;
        }else if (action.equalsIgnoreCase("Agregar")) {
            
            String Nombre = request.getParameter("txtNombre");
            String Descripcion = request.getParameter("txtDescripcion");
            float Precio= Float.parseFloat(request.getParameter("txtPrecio"));
            String Cantidad = request.getParameter("txtCantidad");
            int Tipo_herramientas_Id_tipo_herramientas=Integer.parseInt(request.getParameter("txtTipo_herramientas_Id_tipo_herramientas"));
            
            
            
            her.setNombre(Nombre);
            her.setDescripcion(Descripcion);
            her.setPrecio(Precio);
            her.setCantidad(Cantidad);
            her.setTipo_herramientas_Id_tipo_herramientas(Tipo_herramientas_Id_tipo_herramientas);
            
            dao.add(her);
            acceso = listarHerramientas;

        } else if (action.equalsIgnoreCase("Editar")) {
            request.setAttribute("Id_herramientas", request.getParameter("Id_herramientas"));
            acceso=editarHerramientas;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            
            int Id_herramientas= Integer.parseInt(request.getParameter("txtId_herramientas"));
            String Nombre = request.getParameter("txtNombre");
            String Descripcion = request.getParameter("txtDescripcion");
            float Precio= Float.parseFloat(request.getParameter("txtId_herramientas"));
            String Cantidad = request.getParameter("txtCantidad");
            int Tipo_herramientas_Id_tipo_herramientas=Integer.parseInt(request.getParameter("txtTipo_herramientas_Id_tipo_herramientas"));
            
            
            her.setId_herramientas(Id_herramientas);
            her.setNombre(Nombre);
            her.setDescripcion(Descripcion);
            her.setPrecio(Precio);
            her.setCantidad(Cantidad);
            her.setTipo_herramientas_Id_tipo_herramientas(Tipo_herramientas_Id_tipo_herramientas);
            dao.edit(her);
            acceso = listarHerramientas;
        }
        else if (action.equalsIgnoreCase("eliminar")){
        int Id_herramientas=Integer.parseInt(request.getParameter("Id_herramientas"));
        her.setId_herramientas(Id_herramientas);
        dao.eliminar(Id_herramientas);
        acceso=listarHerramientas;
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
