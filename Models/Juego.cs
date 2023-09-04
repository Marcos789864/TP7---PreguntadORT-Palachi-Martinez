using TP07_PregunradOrt_Palachi_Martinez.Models;
public static class Juego
{
    private static string username;

    private static int i;

    private static int puntajeActual;

    private static int CantidadPreguntasCorrectas;

    private static List<Preguntas> Preguntas;

    private static List<Respuestas> Respuestas;



    public static void InicializarJuego()
    {
        i=0;
        username = "";
        puntajeActual = 0;
        CantidadPreguntasCorrectas = 0;
    }

    public static List<Categorias> ObtenerCategorias()
    {
        List<Categorias> categorias = BD.ObtenerCategorias();
        return categorias;
    }

    public static List<Dificultades> ObtenerDificultades()
    {
        List<Dificultades> dificultad = BD.ObtenerDificultades();
        return dificultad;
    }

    public static void CargarJuego( string usernam,int dificultad,int categoria)
    {
        Preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        Respuestas = BD.ObtnerRespuestas(Preguntas);
        username = usernam;
    }


    public static string ObtenerNombre()
    {
        return username ;
    }

    public static int ObtnerPuntaje()
    {
        return puntajeActual;
    }


    public static Preguntas ObtenerProximaPregunta()
    {
        if(Preguntas.Count>0){
            return Preguntas[0];
        }
        else
        {
            return null;
        } 
    }

//
    public static List<Respuestas> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuestas> r = new List<Respuestas>();

        foreach(Respuestas a in Respuestas)
        {
            if(a.idPregunta == idPregunta)
            {
             r.Add(a);
            }
        }
        return r;
    }

    public static bool VerificarRespuesta( int idPregunta, int idRespuesta)
    {
       bool correcta = false;
        int eliminar = 0;
        for (int i = 0; i < Preguntas.Count; i++)
        {
            if(Preguntas[i].idPregunta==idPregunta)
            {
                eliminar = i;
            }
        }
        Preguntas.RemoveAt(eliminar);

        foreach (Respuestas r in Respuestas)
        {
            if((r.idRespuestas == idRespuesta)&&(r.Correcta == true)){
            correcta = true;
            puntajeActual += 100;
            CantidadPreguntasCorrectas ++;  
        }
        }
        return correcta;
    }

    public static string ObtenerRespuestaCorrecta(int idPregunta){
        return BD.ObtenerRespuestaCorrecta(idPregunta);
    }
}