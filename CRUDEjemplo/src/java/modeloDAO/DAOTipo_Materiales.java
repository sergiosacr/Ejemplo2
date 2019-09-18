
package modeloDAO;

import config.conexion;
import interfaces.IntTipo_Materiales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOTipo_Materiales;


public class DAOTipo_Materiales  implements IntTipo_Materiales {
    conexion cn= new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOTipo_Materiales TipoMaterial = new DTOTipo_Materiales();

    @Override
    public List listar() {
        ArrayList<DTOTipo_Materiales>List=new ArrayList<>();
        String sql="select * from tipo_materiales";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DTOTipo_Materiales Tipo_mtl = new DTOTipo_Materiales();
                Tipo_mtl.setId_tipo_materiales(rs.getInt("Id_tipo_materiales"));
                Tipo_mtl.setTipo_materiales(rs.getString("Tipo_materiales"));
                Tipo_mtl.setDescripcion(rs.getString("Descripcion"));
                List.add(Tipo_mtl);
            }
        } catch (Exception e) {
        }
        return List;
    }

    @Override
    public DTOTipo_Materiales list(int Id_tipo_materiales) {
         String sql="select * from tipo_materiales where Id_tipo_materiales="+Id_tipo_materiales;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                TipoMaterial.setId_tipo_materiales(rs.getInt("Id_tipo_materiales"));
                TipoMaterial.setTipo_materiales(rs.getString("Tipo_materiales"));
                TipoMaterial.setDescripcion(rs.getString("Descripcion"));
            }
        } catch (Exception e) {
        }
        return TipoMaterial;   
    }

    @Override
    public boolean agregar(DTOTipo_Materiales TipoMaterial) {
       String sql="insert into tipo_materiales(Tipo_materiales, Descripcion)values('"+TipoMaterial.getTipo_materiales()+"','"+TipoMaterial.getDescripcion()+"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean editar(DTOTipo_Materiales TipoMaterial) {
       String sql="update tipo_materiales set Tipo_materiales='"+TipoMaterial.getTipo_materiales()+"', Descripcion='"+TipoMaterial.getDescripcion()+"' where Id_tipo_materiales="+TipoMaterial.getId_tipo_materiales();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int Id_tipo_materiales) {
       String sql="delete from tipo_materiales where Id_tipo_materiales="+Id_tipo_materiales;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
