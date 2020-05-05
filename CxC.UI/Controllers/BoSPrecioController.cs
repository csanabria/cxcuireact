using CxC.Negocio;
using CxC.Datos;
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
    public class BoSPrecioController : Controller
    {
        List<SelectListItem> listaPeriodo()
        {
            List<SelectListItem> lts = new List<SelectListItem>();
            var lista = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList();
            foreach (var row in lista)
            {
                lts.Add(new SelectListItem { Text = row.DscPeriodo, Value = row.IdPeriodo.ToString() });
            }
            return lts;
        }
        
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

                ViewBag.Periodo = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList();
                ViewBag.listaPeriodo = listaPeriodo();
                var lista = NEGOCIO_BoSPrecio.NEGOCIO_SelectAll().ToList();
                return View(lista);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        public ActionResult Create()
        {

            ViewBag.listaPeriodo = listaPeriodo();
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "IdBoSPrecio,IdBoS,MonPrecio,MonCosto,NumPeriodo,FecCreacion,UsrCreacion,FecUltModif,UsrUltModif")] FCCxCBoSPrecio obj)
        {
            obj.UsrCreacion  = Session["usuarioLogueado"].ToString();
            obj.FecCreacion = DateTime.Now;
            obj.UsrUltModif  = Session["usuarioLogueado"].ToString();
            obj.FecUltModif = DateTime.Now;
            if (ModelState.IsValid)
            {
                var res = NEGOCIO_BoSPrecio.NEGOCIO_insertar(obj);
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
            var obj = NEGOCIO_BoSPrecio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoSPrecio == id);
            if (obj == null)
            {
                return HttpNotFound();
            }

            ViewBag.listaPeriodo = listaPeriodo();
            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Edit([Bind(Include = "IdBoSPrecio,IdBoS,MonPrecio,MonCosto,NumPeriodo,FecCreacion,UsrCreacion,FecUltModif,UsrUltModif")] FCCxCBoSPrecio obj)
        {
            obj.UsrUltModif = Session["usuarioLogueado"].ToString();
            obj.FecUltModif = DateTime.Now;
            if (ModelState.IsValid)/* Valida que los datos de validacion en la vista se cumplan segun las anotaciones*/
            {
                
                var res = NEGOCIO_BoSPrecio.NEGOCIO_update(obj);
                return RedirectToAction("Index");
            }
            //ViewBag.ListaSiNo = listaSiNo;
            //ViewBag.listaCodigoEstado = listaCodigoEstado;
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var obj = NEGOCIO_BoSPrecio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoSPrecio == id);

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }

            ViewBag.Periodo = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList();
            return View(obj);

        }

        // GET: FCCxCAuxiliars/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var obj = NEGOCIO_BoSPrecio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoSPrecio == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.Periodo = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList();
            return View(obj);
        }

        // POST: FCCxCAuxiliars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var obj = NEGOCIO_BoSPrecio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoSPrecio == id);
            var res = NEGOCIO_BoSPrecio.NEGOCIO_delete(obj);
            return RedirectToAction("Index");
        }
    }
}