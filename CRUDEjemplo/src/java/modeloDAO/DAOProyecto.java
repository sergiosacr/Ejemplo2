package modeloDAO;

import config.conexion;
import interfaces.IntProyecto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOProyecto;

public class DAOProyecto implements IntProyecto {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOProyecto Pro = new DTOProyecto();

    @Override
    public List listar() {
        ArrayList<DTOProyecto> listarPro = new ArrayList<>();
        String sql = "select * from Proyecto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOProyecto Proy = new DTOProyecto();
                Proy.setId_proyecto(rs.getInt("Id_proyecto"));
                Proy.setCosto(rs.getFloat("Costo"));
                Proy.setDireccion(rs.getString("Direccion"));
                Proy.setFecha_incio(rs.getDate("Fecha_incio"));
                Proy.setFecha_fin(rs.getDate("Fecha_fin"));
                Proy.setAsignacion_recursos_idAsignacion_Recursos(rs.getInt("Asignacion_recursos_idAsignacion_Recursos"));
                Proy.setCiudades_Id_ciudades(rs.getInt("Ciudades_Id_ciudades"));
                Proy.setNovedades_Id_novedades(rs.getInt("Novedades_Id_novedades"));
                Proy.setEstados_proyecto_Id_estado_proyecto(rs.getInt("Estados_proyecto_Id_estado_proyecto"));
                listarPro.add(Proy);
            }
        } catch (Exception e) {
        }
        return listarPro;
    }

    @Override
    public DTOProyecto list(int Id_proyecto) {
        String sql = "select * from Proyecto where Id_proyecto=" + Id_proyecto;
        System.out.println("Id proyecto " + Id_proyecto);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                Pro.setId_proyecto(rs.getInt("Id_proyecto"));
                Pro.setCosto(rs.getFloat("Costo"));
                Pro.setDireccion(rs.getString("Direccion"));
                Pro.setFecha_incio(rs.getDate("Fecha_incio"));
                Pro.setFecha_fin(rs.getDate("Fecha_fin"));
                Pro.setAsignacion_recursos_idAsignacion_Recursos(rs.getInt("Asignacion_recursos_idAsignacion_Recursos"));
                Pro.setCiudades_Id_ciudades(rs.getInt("Ciudades_Id_ciudades"));
                Pro.setNovedades_Id_novedades(rs.getInt("Novedades_Id_novedades"));
                Pro.setEstados_proyecto_Id_estado_proyecto(rs.getInt("Estados_proyecto_Id_estado_proyecto"));
                
                System.out.println("datos consultados" + Pro);
            }
        } catch (Exception e) {
        }
        return Pro;
    }

    @Override
    public boolean add(DTOProyecto pro) {
        String sql = "insert into Proyecto (Id_proyecto,Costo,Direccion,Fecha_incio,Fecha_fin,Asignacion_recursos_idAsignacion_Recursos,Ciudades_Id_ciudades,Novedades_Id_novedades,Estados_proyecto_Id_estado_proyecto)  values ('" + pro.getId_proyecto() + "','" + pro.getCosto() + "','" + pro.getDireccion() + "','" + pro.getFecha_incio() + "','" + pro.getFecha_fin() + "','" + pro.getAsignacion_recursos_idAsignacion_Recursos() + "','" + pro.getCiudades_Id_ciudades() + "','" + pro.getNovedades_Id_novedades() + "','" + pro.getEstados_proyecto_Id_estado_proyecto() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(DTOProyecto pro) {
        String sql = "update Proyecto set Id_proyecto='"+pro.getId_proyecto()+"',Costo='" + pro.getCosto() + "',Direccion='" + pro.getDireccion() + "',Fecha_incio='" + pro.getFecha_incio() + "',Fecha_fin='" + pro.getFecha_fin() + "',Asignacion_recursos_idAsignacion_Recursos='" + pro.getAsignacion_recursos_idAsignacion_Recursos() + "',Ciudades_Id_ciudades='" + pro.getCiudades_Id_ciudades() + "',Novedades_Id_novedades='" + pro.getNovedades_Id_novedades() + "',Estados_proyecto_Id_estado_proyecto='" + pro.getEstados_proyecto_Id_estado_proyecto() + "' where Id_proyecto=" + pro.getId_proyecto();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int Id_proyecto) {
        String sql = "delete from Proyecto where Id_proyecto=" + Id_proyecto;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}
