package interfaces;

import java.util.List;
import modelo.DTOMarca;

public interface IntMarca {
    public List listar();
    public DTOMarca list(int Id_marca);
    public boolean add (DTOMarca mar);
    public boolean edit(DTOMarca mar);
    public boolean Eliminar (int Id_marca);

    
}
