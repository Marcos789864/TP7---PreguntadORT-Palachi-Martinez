public  class Dificultades
{
    public int idDificultad{get;set;}

    public  string Nombre{get;set;}
public Dificultades(){

    }
public Dificultades (string pNombre, int pIdDificultad)
    {
        Nombre = pNombre;
        idDificultad = pIdDificultad;
    }
    
}