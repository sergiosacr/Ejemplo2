
package config;
/**aqui se realiza la conexion a la BD, primero esta el uml,el nombre de la bD, el usuario, y el espacio de la contraseña( xq el programa que tenemos instalado para eso 
 no necesita) dentro de un try catch para prevenir las excepciones al momento de ejecutar y un retorno con la clase conexión en este caso la represento con (con) **/
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
    Connection con;
    public  conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver"); 
            con= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba","root",""); 
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error"+e);
        }
    }
    public Connection getConnection(){
        return con;
    }

    
}

