using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_PregunradOrt_Palachi_Martinez.Models;

namespace TP07_PregunradOrt_Palachi_Martinez.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.ListaCategoria = BD.ObtenerCategorias();
        ViewBag.ListaDificultades= BD.ObtenerDificultades();
        return View("ConfigurarJuego");
    } 
//

    public IActionResult Comenzar(string username,int dificultad,int categoria)
    {
        Juego.CargarJuego(username,dificultad,categoria);
        return RedirectToAction("Jugar");
    }

//
    public IActionResult Jugar()
    {
        ViewBag.Nombre = Juego.ObtenerNombre();
        ViewBag.Puntaje = Juego.ObtnerPuntaje();
        ViewBag.pregunta = Juego.ObtenerProximaPregunta();
        if(Juego.ObtenerProximaPregunta() == null) return View("Fin");
        ViewBag.respuestas = Juego.ObtenerProximasRespuestas(ViewBag.pregunta.idPregunta);
       return View("Jugar");
    }

    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta,int idRespuesta)
    {
    ViewBag.correcta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        ViewBag.respuestaCorrecta = Juego.ObtenerRespuestaCorrecta(idPregunta);
        ViewBag.username = Juego.ObtenerNombre();
        ViewBag.puntajeActual = Juego.ObtnerPuntaje();
       ViewBag.acierto = Juego.VerificarRespuesta(idPregunta,idRespuesta);
        return View("Respuestas");
    }

   

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
