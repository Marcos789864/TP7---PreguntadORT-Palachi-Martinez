public  class Respuestas
{
    public  int idRespuestas{get;set;}

    public  int idPregunta{get;set;}

    public  int Opcion {get;set;}

    public  string Contenido {get;set;}

    public  bool Correcta {get;set;}

    public  string Foto {get; set;}

    public Respuestas()
{

}

public Respuestas (int pIdRespuesta, int pIdPregunta, int popcion, string pcontenido, bool pcorrecta, string pfoto)
{
        idRespuestas = pIdRespuesta;
        idPregunta = pIdPregunta;
        Opcion = popcion;
        Contenido = pcontenido;
        Correcta = pcorrecta;
        Foto = pfoto;
}

}


