package modeloDAO;

import config.conexion;
import interfaces.IntMarca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOMarca;

public class DAOMarca implements IntMarca {
    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOMarca marcaModelo= new DTOMarca();


    @Override
    public List listar() {
           ArrayList<DTOMarca> list = new ArrayList<>();
        String sql = "select * from marca";
        try {
            con=cn.getConnection();
            ps=con.prepareCall(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                DTOMarca marh = new DTOMarca();
                marh.setId_marca(rs.getInt("Id_marca"));
                marh.setNombre(rs.getString("Nombre"));
                list.add(marh);
            }
        } catch (Exception e) {
        }
        return list;
    
    }

    @Override
    public DTOMarca list(int Id_marca) {
           String sql = "select * from marca where Id_marca=" + Id_marca;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                marcaModelo.setId_marca(rs.getInt("Id_marca"));
                marcaModelo.setNombre(rs.getString("Nombre"));
                
            }
        } catch (Exception e) {
        }
        return marcaModelo;
        
    }

    @Override
    public boolean add(DTOMarca mar) {
         String sql="insert into marca (Nombre) values ('"+mar.getNombre()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(DTOMarca mar) {
       String sql="update marca set Nombre='"+mar.getNombre()+"'where Id_marca="+mar.getId_marca();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    
    }

    @Override
    public boolean Eliminar(int Id_marca) {
          String sql="delete from marca where Id_marca="+Id_marca;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
   
    }
    
}
