package modeloDAO;

import config.conexion;
import interfaces.IntHerramientas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOHerramientas;

public class DAOHerramientas implements IntHerramientas {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOHerramientas her = new DTOHerramientas();

    @Override
    public List listar() {
        ArrayList<DTOHerramientas> listherramientas = new ArrayList<>();
        String sql = "select * from herramientas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOHerramientas herr = new DTOHerramientas();
                herr.setId_herramientas(rs.getInt("Id_herramientas"));
                herr.setNombre(rs.getString("Nombre"));
                herr.setDescripcion(rs.getString("Descripcion"));
                herr.setPrecio(rs.getFloat("Precio"));
                herr.setCantidad(rs.getString("Cantidad"));
                herr.setTipo_herramientas_Id_tipo_herramientas(rs.getInt("Tipo_herramientas_Id_tipo_herramientas"));

                listherramientas.add(herr);

            }

        } catch (SQLException e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return listherramientas;

    }

    @Override
    public DTOHerramientas list(int Id_herramientas) {
        String sql = "select * from herramientas where Id_herramientas=" + Id_herramientas;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
              
                her.setId_herramientas(rs.getInt("Id_herramientas"));
                her.setNombre(rs.getString("Nombre"));
                her.setDescripcion(rs.getString("Descripcion"));
                her.setPrecio(rs.getFloat("Precio"));
                her.setCantidad(rs.getString("Cantidad"));
                her.setTipo_herramientas_Id_tipo_herramientas(rs.getInt("Tipo_herramientas_Id_tipo_herramientas"));
            }

        } catch (Exception e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return her;

    }

    @Override
    public boolean add(DTOHerramientas her) {
        String sql = "insert into herramientas(Nombre, Descripcion, Precio, Cantidad,Tipo_herramientas_Id_tipo_herramientas)values('" + her.getNombre() + "','" + her.getDescripcion() + "','" + her.getPrecio() + "','" + her.getCantidad() + "','" + her.getTipo_herramientas_Id_tipo_herramientas() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;

    }

    @Override
    public boolean edit(DTOHerramientas her) {
        String sql = "update herramientas set Nombre='" + her.getNombre() + "',Descripcion='" + her.getDescripcion() + "',Precio='" + her.getPrecio() + "',Cantidad='" + her.getCantidad() + "',Tipo_herramientas_Id_tipo_herramientas='" + her.getTipo_herramientas_Id_tipo_herramientas() + "'where Id_herramientas=" + her.getId_herramientas();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean eliminar(int Id_herramientas) {
        String sql = "delete from herramientas where Id_herramientas=" + Id_herramientas;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("No se realiza la consulta");
        }
        return false;

    }

    public static void main(String[] args) {
        DAOHerramientas dao = new DAOHerramientas();

        dao.eliminar(0000000001);
    }

}
