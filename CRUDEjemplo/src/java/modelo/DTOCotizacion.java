package modelo;

import java.sql.Date;

public class DTOCotizacion {

    int Id_cotizacion;
    Date Fecha_cotizacion;
    int Cantidad_trabajadores;
    String Descripcion;
    float Valor_total;
    int Proyecto_Id_proyecto;
    int Usuario_Id_usuario;

    public DTOCotizacion() {

    }

    public DTOCotizacion(Date Fecha_cotizacion, int Cantidad_trabajadores, String Descripcion, float Valor_total, int Proyecto_Id_proyecto, int Usuario_Id_usuario) {
        this.Fecha_cotizacion = Fecha_cotizacion;
        this.Cantidad_trabajadores = Cantidad_trabajadores;
        this.Descripcion = Descripcion;
        this.Valor_total = Valor_total;
        this.Proyecto_Id_proyecto = Proyecto_Id_proyecto;
        this.Usuario_Id_usuario = Usuario_Id_usuario;
    }

    public int getId_cotizacion() {
        return Id_cotizacion;
    }

    public void setId_cotizacion(int Id_cotizacion) {
        this.Id_cotizacion = Id_cotizacion;
    }

    public Date getFecha_cotizacion() {
        return Fecha_cotizacion;
    }

    public void setFecha_cotizacion(Date Fecha_cotizacion) {
        this.Fecha_cotizacion = Fecha_cotizacion;
    }

    public int getCantidad_trabajadores() {
        return Cantidad_trabajadores;
    }

    public void setCantidad_trabajadores(int Cantidad_trabajadores) {
        this.Cantidad_trabajadores = Cantidad_trabajadores;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public float getValor_total() {
        return Valor_total;
    }

    public void setValor_total(float Valor_total) {
        this.Valor_total = Valor_total;
    }

    public int getProyecto_Id_proyecto() {
        return Proyecto_Id_proyecto;
    }

    public void setProyecto_Id_proyecto(int Proyecto_Id_proyecto) {
        this.Proyecto_Id_proyecto = Proyecto_Id_proyecto;
    }

    public int getUsuario_Id_usuario() {
        return Usuario_Id_usuario;
    }

    public void setUsuario_Id_usuario(int Usuario_Id_usuario) {
        this.Usuario_Id_usuario = Usuario_Id_usuario;
    }

}
