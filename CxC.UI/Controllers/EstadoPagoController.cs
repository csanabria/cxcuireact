using CxC.Objetos;
using CxC.Datos;
using System;
using CxC.Negocio;
using CxC.Utilitarios.Clases;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace CxC.UI.Controllers
{
    public class EstadoPagoController : Controller
    {
        // GET: EstadoPago
        List<SelectListItem> listaEstado = new List<SelectListItem>
        {
            new SelectListItem { Text ="Activo", Value ="A"},
            new SelectListItem { Text ="Inactivo", Value ="I"}
        };
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

                var lista = NEGOCIO_EstadoPago.NEGOCIO_SelectAll().ToList();
                return View(lista);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        public ActionResult Create()
        {
            ViewBag.listaEstado = listaEstado;
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "IdEstadoPago,DscEstadoPago,CodEstado")] FCCxCEstadoPago obj)
        {
            var res = NEGOCIO_EstadoPago.NEGOCIO_insertar(obj);
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var obj = NEGOCIO_EstadoPago.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdEstadoPago == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.listaEstado = listaEstado;
            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdEstadoPago,DscEstadoPago,CodEstado")] FCCxCEstadoPago obj)
        {
            //var res = NEGOCIO_FCCxCEstadoPago.NEGOCIO_update(obj);
            //return RedirectToAction("Index");
            var res = NEGOCIO_EstadoPago.NEGOCIO_update(obj);
            if (ModelState.IsValid)
            {
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var obj = NEGOCIO_EstadoPago.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdEstadoPago == id);

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

        // GET: FCCxCEstadoPagos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var obj = NEGOCIO_EstadoPago.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdEstadoPago == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            return View(obj);
        }

        // POST: FCCxCEstadoPagos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var obj = NEGOCIO_EstadoPago.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdEstadoPago == id);
            var res = NEGOCIO_EstadoPago.NEGOCIO_delete(obj);
            return RedirectToAction("Index");
        }
    }
}