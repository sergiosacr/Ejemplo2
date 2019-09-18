
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modeloDAO.DAOCotizacion;
import modelo.DTOCotizacion;


public class CtrCotizacion extends HttpServlet {
    
    //Ruta donde se encuentras las vistas

    String listarCoti = "vistasCotizacion/ListarCotizacion.jsp";
    String AddCoti = "vistasCotizacion/AddCotizacion.jsp";
    String EditCoti = "vistasCotizacion/EditCotizacion.jsp";
    DTOCotizacion c = new DTOCotizacion();
    DAOCotizacion dao = new DAOCotizacion();
    int Id_cotizacion;

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrCotizacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrCotizacion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listarCoti;
        } else if (action.equalsIgnoreCase("addCoti")) {
            acceso = AddCoti;
        } else if (action.equalsIgnoreCase("Agregar")) {
            
            String Fecha = request.getParameter("txtfecoti");
            int Cantidad_trabajadores = Integer.parseInt(request.getParameter("txtcantra"));
            String Descripcion = request.getParameter("txtdes");
            float Valor_total = Float.parseFloat(request.getParameter("txtvaltor"));
            int Proyecto_Id_proyecto = Integer.parseInt(request.getParameter("txtpidp"));
            int Usuario_Id_usuario = Integer.parseInt(request.getParameter("txtuidu"));
            
            c.setId_cotizacion(Id_cotizacion);
            c.setFecha_cotizacion(Date.valueOf(Fecha));
            c.setCantidad_trabajadores(Cantidad_trabajadores);
            c.setDescripcion(Descripcion);
            c.setValor_total(Valor_total);
            c.setProyecto_Id_proyecto(Proyecto_Id_proyecto);
            c.setUsuario_Id_usuario(Usuario_Id_usuario);
            
            dao.add(c);
            acceso = listarCoti ;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("Id_cotizacion", request.getParameter("Id_cotizacion"));
            acceso = EditCoti;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            Id_cotizacion = Integer.parseInt(request.getParameter("txtidcoti"));
            String Fecha = request.getParameter("txtfecoti");
            int Cantidad_trabajadores = Integer.parseInt(request.getParameter("txtcantra"));
            String Descripcion = request.getParameter("txtdes");
            float Valor_total = Float.parseFloat(request.getParameter("txtvaltor"));
            int Proyecto_Id_proyecto = Integer.parseInt(request.getParameter("txtpidp"));
            int Usuario_Id_usuario = Integer.parseInt(request.getParameter("txtuidu"));

            c.setId_cotizacion(Id_cotizacion);
            c.setFecha_cotizacion(Date.valueOf(Fecha));
            c.setCantidad_trabajadores(Cantidad_trabajadores);
            c.setDescripcion(Descripcion);
            c.setValor_total(Valor_total);
            c.setProyecto_Id_proyecto(Proyecto_Id_proyecto);
            c.setUsuario_Id_usuario(Usuario_Id_usuario);

            dao.edit(c);
            acceso = listarCoti;
        } else if (action.equalsIgnoreCase("eliminar")) {
            System.out.println("esta entrando al controlador cotizacion" + Id_cotizacion);
            Id_cotizacion = Integer.parseInt(request.getParameter("Id_cotizacion"));
            c.setId_cotizacion(Id_cotizacion);
            dao.Eliminar(Id_cotizacion);
            acceso = listarCoti;

        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}