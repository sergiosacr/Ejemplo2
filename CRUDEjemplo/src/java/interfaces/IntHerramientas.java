package interfaces;

import java.util.List;
import modelo.DTOHerramientas;

public interface IntHerramientas {

    public List listar();

    public DTOHerramientas list(int Id_herramientas);

    public boolean add(DTOHerramientas her);

    public boolean edit(DTOHerramientas her);

    public boolean eliminar(int Id_herramientas);

}

