
package modelo;

public class DTOHerramientas {
 int Id_herramientas;
 String Nombre;
 String Descripcion;
 float Precio; 
 String Cantidad;
 int Tipo_herramientas_Id_tipo_herramientas;

    public DTOHerramientas() {
    }

    public DTOHerramientas(int Id_herramientas, String Nombre, String Descripcion, float Precio, String Cantidad, int Tipo_herramientas_Id_tipo_herramientas) {
        this.Id_herramientas = Id_herramientas;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Cantidad = Cantidad;
        this.Tipo_herramientas_Id_tipo_herramientas = Tipo_herramientas_Id_tipo_herramientas;
    }

    public int getId_herramientas() {
        return Id_herramientas;
    }

    public void setId_herramientas(int Id_herramientas) {
        this.Id_herramientas = Id_herramientas;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getTipo_herramientas_Id_tipo_herramientas() {
        return Tipo_herramientas_Id_tipo_herramientas;
    }

    public void setTipo_herramientas_Id_tipo_herramientas(int Tipo_herramientas_Id_tipo_herramientas) {
        this.Tipo_herramientas_Id_tipo_herramientas = Tipo_herramientas_Id_tipo_herramientas;
    }
 
}
