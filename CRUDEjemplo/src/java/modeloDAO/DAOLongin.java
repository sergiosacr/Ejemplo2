
package modeloDAO;

import java.sql.PreparedStatement;
import config.conexion;
import interfaces.IntLogin;
import java.sql.Connection;
import java.sql.ResultSet;
import modelo.DTOLogin;

public class DAOLongin implements IntLogin{

    conexion cn=new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
   
    
    @Override
    public int validar(DTOLogin lo) {
        int r=0;
       String sql="select * from usuario where Correo=? and contrasenia=?"; 
        try {
            con=cn.getConnection();
            ps= con.prepareStatement(sql);
            ps.setString(1, lo.getCorreo());
            ps.setString(2,lo.getContrasenia());
            System.out.println("contraseña" + lo.getContrasenia());
            rs=ps.executeQuery();
            
            while(rs.next()){
             r=r+1;   
            lo.setCorreo(rs.getString("Correo"));
            lo.setContrasenia(rs.getString("contrasenia"));
            lo.setIDrol(rs.getInt("Roles_Id_roles"));
            lo.setNombres(rs.getString("Nombres"));
            }
            if(r==1){
            return 1;
            }else{
            return 0;
            }
        } catch (Exception e) {
            System.out.println("Error en la consulta de validación de login");
        }
       return 0;
    }
    
}
