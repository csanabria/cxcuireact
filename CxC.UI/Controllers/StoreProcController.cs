﻿using CxC.Datos;
using CxC.Negocio;
using CxC.Objetos;
using CxC.Utilitarios.Clases;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;


namespace CxC.UI.Controllers
{
    public class StoreProcController : Controller
    {
        // GET: IdentificacionTipo
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
                var datosMenu = respuesta.Data.SerializarObjeto();
                Session["PermisosMenu"] = respuesta.Data;
                Session["IdTipoPermiso"] = ConfigurationManager.AppSettings["TipoPermiso"];

                string _url = Request.Url.ToString();
                //Consulta permiso de acceso a URL
                //bool tieneAcceso = TieneAccesoAView(respuesta.Data, _url);
                bool tieneAcceso = true;
                if (tieneAcceso == false) { return RedirectToAction("PaginaInvalida", "Login"); }
                var objNegocios = new NEGOCIO_StoreProc();
                var lista = objNegocios.NEGOCIO_SelectAll().ToList();
                return View(lista);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "Id_SP,Nom_SP,Dsc_SP")] FCCxCStoreProc obj)
        {
            if (ModelState.IsValid)
            {
                var objNegocios = new NEGOCIO_StoreProc();
                var res = objNegocios.NEGOCIO_insertar(obj);
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var objNegocios = new NEGOCIO_StoreProc();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_SP  == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_SP,Nom_SP,Dsc_SP")] FCCxCStoreProc obj)
        {
            
            if (ModelState.IsValid)
            {
                var objNegocios = new NEGOCIO_StoreProc();
                var res = objNegocios.NEGOCIO_update(obj);
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var objNegocios = new NEGOCIO_StoreProc();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_SP  == id);

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);

        }

        // GET: FCCxCAuxiliars/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var objNegocios = new NEGOCIO_StoreProc();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_SP  == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        // POST: FCCxCAuxiliars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var objNegocios = new NEGOCIO_StoreProc();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_SP  == id);
            var res = objNegocios.NEGOCIO_delete(obj);
            return RedirectToAction("Index");
        }
    }
}