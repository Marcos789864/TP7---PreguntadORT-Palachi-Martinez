public  class Preguntas
{
    public  int idPregunta{get;set;}

    public  int idCategorias{get;set;}

    public  int idDificultad{get;set;}

    public string Enunciado{get;set;}

    public  string Foto{get;set;}

    public Preguntas(){

    }

public Preguntas (int pIdPregunta, int pIdCategoria, int pIdDificultad, string penunciado, string pfoto)
    {
        idPregunta = pIdPregunta;
        idCategorias = pIdCategoria;
        idDificultad = pIdDificultad;
        Enunciado = penunciado;
        Foto = pfoto;
    }





}