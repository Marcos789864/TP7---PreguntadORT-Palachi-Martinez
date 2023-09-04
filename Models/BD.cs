
using System.Data.SqlClient;
using Dapper;

public static class BD
{

    private static string ConnectionString {get; set; } = @"Server=  localhost;DataBase=PreguntadOrt;Trusted_Connection=True;";

    public static List<Categorias> ObtenerCategorias()
    {
        List<Categorias> Categorias= new List<Categorias>(); 
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "Select * from Categorias";
            Categorias = db.Query<Categorias>(sql).ToList();
        }
        return Categorias;
    }

    public static List<Dificultades> ObtenerDificultades()
    {
        List<Dificultades> Dificultades= new List<Dificultades>(); 
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            string sql = "Select * from Dificultades";
            Dificultades = db.Query<Dificultades>(sql).ToList();
        }
        return Dificultades;
    }

    public static List<Preguntas> ObtenerPreguntas(int dificultad,int categoria)
    {
        string sql = "";
        List<Preguntas> preguntas = new List<Preguntas>(); 
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            if((dificultad== -1 && categoria == 1) || (dificultad==-1 && categoria == -1))
            {
                sql = "SELECT * From Preguntas";
                preguntas = db.Query<Preguntas>(sql).ToList();
            }
            else if(dificultad !=1 && categoria ==-1)
            {
                sql = "Select * From Preguntas where idDificultad = @pdificultad";
                preguntas = db.Query<Preguntas>(sql,new{pdificultad = dificultad}).ToList();
            }
            else
            {
                sql  = "Select * From Preguntas where idDificultad = @pdificultad AND idCategoria = @pcategoria " ;
                preguntas = db.Query<Preguntas>(sql,new{pdificultad = dificultad, pcategoria = categoria}).ToList();
            }

        }
        return preguntas;
    }

    public static  List<Respuestas> ObtnerRespuestas(List<Preguntas> preguntas)
    {
        
        List<Respuestas> respuesta = new List<Respuestas>();
        List<Respuestas> respuestasPreguntas = new List<Respuestas>();
           string sql = "Select * from Respuestas where idPregunta = @pidPregunta";
            using(SqlConnection db = new SqlConnection(ConnectionString))
            {
                 foreach (Preguntas n in preguntas)
                {       
                    respuestasPreguntas = db.Query<Respuestas>(sql, new {pidPregunta = n.idPregunta}).ToList();
                    respuesta.AddRange(respuestasPreguntas);
                }
            }
        return respuesta;
    }

    public static string ObtenerRespuestaCorrecta (int idPregunta )
{
    string Correcta;
    
            string sql = "SELECT Contenido FROM Respuestas INNER JOIN Preguntas ON Preguntas.IdPregunta = Respuestas.IdPregunta WHERE Respuestas.Correcta = 1 AND Preguntas.IdPregunta = @pIdPregunta";
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            Correcta = db.QueryFirstOrDefault<string>(sql, new{@pIdPregunta = idPregunta});
        }
        return Correcta;
}



}