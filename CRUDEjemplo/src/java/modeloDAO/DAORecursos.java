
package modeloDAO;

import config.conexion;
import interfaces.crudrecursos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.DTORecursos;


public class DAORecursos implements crudrecursos {
    
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTORecursos r = new DTORecursos(); 

 @Override
    public List listar() {

        ArrayList<DTORecursos> listrecursos = new ArrayList<>();
         System.out.println(" preuibaasdasd " + listrecursos);
        String sql = "select * from asignacion_recursos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTORecursos re= new DTORecursos();
                re.setIdAsignacion_Recursos(rs.getInt("idAsignacion_Recursos"));
                re.setFecha(rs.getDate("Fecha"));
                re.setCantidad(rs.getString("Cantidad"));
                re.setObservaciones(rs.getString("Observaciones"));
                
                listrecursos.add(re);
                System.out.println(" preuiba " + listrecursos);
            }

        } catch (SQLException e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return listrecursos;

    }

    @Override
    public DTORecursos list(int idAsignacion_Recursos ) {
        String sql = "select * from asignacion_recursos where idAsignacion_Recursos=" + idAsignacion_Recursos;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                r.setIdAsignacion_Recursos(rs.getInt("idAsignacion_Recursos"));
                r.setFecha(rs.getDate("Fecha"));
                r.setCantidad(rs.getString("Cantidad"));
                r.setObservaciones(rs.getString("Observaciones"));
                
            }

        } catch (Exception e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return r;

    }

    @Override
    public boolean add(DTORecursos r) {
        String sql = "insert into asignacion_recursos(Fecha, Cantidad, Observaciones )values('" + r.getFecha() + "','" + r.getCantidad() + "','" + r.getObservaciones() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean edit(DTORecursos r) {
        String sql = "update asignacion_recursos set Fecha='" + r.getFecha() + "',Cantidad='" + r.getCantidad() + "',Observaciones='" + r.getObservaciones() + "'where idAsignacion_Recursos=" + r.getIdAsignacion_Recursos();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean eliminar(int idAsignacion_Recursos) {

        String sql = "delete from asignacion_recursos where idAsignacion_Recursos=" + idAsignacion_Recursos;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }
        return false;
    }

    
}


