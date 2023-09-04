public  class Categorias
{

    public  int idCategoria{get;set;}

    public  string Nombre{get;set;}

    public  string Foto{get;set;}

public Categorias(){

    }
public Categorias (string pNombre, int pIdCategoria, string pFoto)
    {
        Nombre = pNombre;
        idCategoria = pIdCategoria;
        Foto = pFoto;
    }





}