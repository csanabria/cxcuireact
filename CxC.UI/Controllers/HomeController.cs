﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CxC.UIProcess.Clases;
using CxC.Objetos.Clases;
using CxC.Utilitarios.Clases;
using CxC.Utilitarios.Constantes;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;

namespace CxC.UI.Controllers
{
    public class HomeController : Controller
    {
        #region Instancias
        //Instancia a la clase de Servicios en UIProcess
        private AccesoSeguridad ServiciosSeguridad = new AccesoSeguridad();
        //Objeto de retorno
        oRespuesta<string> respuestaValidacion = new oRespuesta<string>();

        //Debido que el usuario aun no está logueado, se usa un dummy inicial al logueo.
        //Luego de loguearse, cambia los datos al usuario que se encuentra logueado.
        public int idUsuarioLogueado = 1;
        public string usuarioLogueado = "sistemaLogueo@itcr.ac.cr";
        public string sessionNombreUsuario = "NombreUsuario";
        public string sessionId = ConfigurationManager.AppSettings["SessionID"];
        #endregion

        public ActionResult Index()
        {
            if (Session["usuarioLogueado"] != null)
            {
                ViewBag.NombreUsuario = Session["usuarioLogueado"].ToString();
                ViewBag.NombreCompleto = Session["usuarioLogueado"].ToString();
                //inicializa el controller de Login para obtener el menú.
                LoginController controllerPermiso = new LoginController();
                controllerPermiso.InitializeController(this.Request.RequestContext);
                JsonResult respuesta = controllerPermiso.ConsultarPermisosUsuario(0);                
                Session["PermisosMenu"] = respuesta.Data;
                Session["IdTipoPermiso"] = ConfigurationManager.AppSettings["TipoPermiso"];

                string _url = Request.Url.ToString();
                //Consulta permiso de acceso a URL
                //bool tieneAcceso = TieneAccesoAView(respuesta.Data, _url);
                bool tieneAcceso = true;
                if (tieneAcceso == false) { return RedirectToAction("PaginaInvalida", "Login"); }

                return View();
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}