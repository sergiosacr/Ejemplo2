package modeloDAO;

import config.conexion;
import interfaces.IntCotizacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOCotizacion;

public class DAOCotizacion implements IntCotizacion {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOCotizacion CotiModelo = new DTOCotizacion();

    @Override
    public DTOCotizacion list(int Id_cotizacion) {
        String sql = "select * from Cotizacion where Id_cotizacion=" + Id_cotizacion;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                CotiModelo.setId_cotizacion(rs.getInt("Id_cotizacion"));
                CotiModelo.setFecha_cotizacion(rs.getDate("Fecha_cotizacion"));
                CotiModelo.setCantidad_trabajadores(rs.getInt("Cantidad_trabajadores"));
                CotiModelo.setDescripcion(rs.getString("Descripcion"));
                CotiModelo.setValor_total(rs.getFloat("Valor_total"));
                CotiModelo.setProyecto_Id_proyecto(rs.getInt("Proyecto_Id_proyecto"));
                CotiModelo.setUsuario_Id_usuario(rs.getInt("Usuario_Id_usuario"));
            }
        } catch (Exception e) {
        }
        return CotiModelo;
    }
    /*public static void main(String[] args) {
        DAOCotizacion dao = new DAOCotizacion();
        System.out.println(dao.add(new DTOCotizacion(01-01-2019, 8, "asdsa", 14.4, 1, 2)));
    }*/

    @Override
    public boolean add(DTOCotizacion coti) {
      boolean flag = false;
      String sql = "insert into Cotizacion (Fecha_cotizacion,Cantidad_trabajadores,Descripcion,Valor_total,Proyecto_Id_proyecto,Usuario_Id_usuario) values ('" + coti.getFecha_cotizacion() + "','" + coti.getCantidad_trabajadores() + "','" + coti.getDescripcion() + "','" + coti.getValor_total() + "','" + coti.getProyecto_Id_proyecto() + "','" + coti.getUsuario_Id_usuario() + "')";
        try {
            System.out.println("Consultar" + sql);
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if(ps.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    @Override
    public boolean edit(DTOCotizacion coti) {
        String sql = "update Cotizacion set Id_cotizacion='" + coti.getId_cotizacion() + "',Fecha_cotizacion='" + coti.getFecha_cotizacion() + "',Cantidad_trabajadores='" + coti.getCantidad_trabajadores() + "',Descripcion='" + coti.getDescripcion() + "',Valor_total='" + coti.getValor_total() + "',Proyecto_Id_proyecto='" + coti.getProyecto_Id_proyecto() + "',Usuario_Id_usuario='" + coti.getUsuario_Id_usuario() + "'where Id_cotizacion=" + coti.getId_cotizacion();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

            System.out.println("Datos" + sql);
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int Id_cotizacion) {
        String sql = "delete from Cotizacion where Id_cotizacion=" + Id_cotizacion;
        try {
            System.out.println("esta entrando al modelo dao" + Id_cotizacion);
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public List listarCotizacion() {
        ArrayList<DTOCotizacion> listarCotizacion = new ArrayList<>();
        String sql = "select * from Cotizacion";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                DTOCotizacion c = new DTOCotizacion();
                
                c.setId_cotizacion(rs.getInt("Id_cotizacion"));
                c.setFecha_cotizacion(rs.getDate("Fecha_cotizacion"));
                c.setCantidad_trabajadores(rs.getInt("Cantidad_trabajadores"));
                c.setDescripcion(rs.getString("Descripcion"));
                c.setValor_total(rs.getFloat("Valor_total"));
                c.setProyecto_Id_proyecto(rs.getInt("Proyecto_Id_proyecto"));
                c.setUsuario_Id_usuario(rs.getInt("Usuario_Id_usuario"));
                listarCotizacion.add(c);
            }
        } catch (Exception e) {
        }
        return listarCotizacion;
    }

}
