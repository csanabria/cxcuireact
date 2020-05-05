using CxC.Datos;
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
    public class PeriodoController : Controller
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

                NEGOCIO_Auxiliar objNegocios = new NEGOCIO_Auxiliar();
                List<FCCxCAuxiliar> listaAuxiliar = objNegocios.NEGOCIO_SelectAll().ToList();
                ViewBag.Auxiliar = listaAuxiliar;

                var lista = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList();
                return View(lista);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        //crea la lista para combo de dscAuxiliar
        List<SelectListItem> listaAuxiliar()
        {
            NEGOCIO_Auxiliar objNegocios = new NEGOCIO_Auxiliar();
            List<FCCxCAuxiliar> listaAuxiliar = objNegocios.NEGOCIO_SelectAll().ToList();
            List<SelectListItem> lA = new List<SelectListItem>();
            foreach (var row in listaAuxiliar)
            {
                lA.Add(new SelectListItem { Text = row.DscAuxiliar, Value = row.IdAuxiliar.ToString() });
            }
            return lA;
        }
        public ActionResult Create()
        {           
            ViewBag.Auxiliar = listaAuxiliar();
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "IdPeriodo,IdAuxiliar,DscPeriodo,FecInicio,FecFinal")] FCCxCPeriodo obj)
        {
            var res = NEGOCIO_Periodo.NEGOCIO_insertar(obj);        
            return RedirectToAction("Index");
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var obj = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdPeriodo == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.Auxiliar = listaAuxiliar();
            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdPeriodo,IdAuxiliar,DscPeriodo,FecInicio,FecFinal")] FCCxCPeriodo obj)
        {
            //var res = NEGOCIO_FCCxCAuxiliar.NEGOCIO_update(obj);
            //return RedirectToAction("Index");
            var res = NEGOCIO_Periodo.NEGOCIO_update(obj);
            if (ModelState.IsValid)
            {
                return RedirectToAction("Index");
            }
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var obj = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdPeriodo  == id);

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
            var obj = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdPeriodo  == id);
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
            var obj = NEGOCIO_Periodo.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdPeriodo  == id);
            var res = NEGOCIO_Periodo.NEGOCIO_delete(obj);
            return RedirectToAction("Index");
        }
    }
}