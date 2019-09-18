
package modelo;

public class DTOLogin {
    int Id_usuario;
    String Correo;
    String Contrasenia;
    int IDrol;
    String nombres;

    public DTOLogin() {
    }

    public DTOLogin(int Id_usuario, String Correo, String Contrasenia,int IDrol,String Nombres) {
        this.Id_usuario = Id_usuario;
        this.Correo = Correo;
        this.Contrasenia = Contrasenia;
        this.IDrol = IDrol;
        this.nombres = nombres;
    }

    public int getIDrol() {
        return IDrol;
    }

    public void setIDrol(int IDrol) {
        this.IDrol = IDrol;
    }

    public int getId_usuario() {
        return Id_usuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setId_usuario(int Id_usuario) {
        this.Id_usuario = Id_usuario;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getContrasenia() {
        return Contrasenia;
    }

    public void setContrasenia(String Contrasenia) {
        this.Contrasenia = Contrasenia;
    }
    
    
}
