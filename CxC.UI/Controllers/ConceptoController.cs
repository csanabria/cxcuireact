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
    public class ConceptoController : Controller
    {
        //List<SelectListItem> listaTipoConcepto()
        //{
        //    List<SelectListItem> lts = new List<SelectListItem>();
        //    var listaConcepto = NEGOCIO_ConceptoTipo.NEGOCIO_SelectAll().ToList();
        //    foreach (var row in listaConcepto)
        //    {
        //        lts.Add(new SelectListItem { Text = row.DscTipoDeudor, Value = row.IdTipoDeudor.ToString() });
        //    }
        //    return lts;
        //}
        //List<SelectListItem> listaTipoIdentificacion()
        //{
        //    List<SelectListItem> lti = new List<SelectListItem>();
        //    var listaIdentificacionTipo = NEGOCIO_IdentificacionTipo.NEGOCIO_SelectAll().ToList();
        //    foreach (var row in listaIdentificacionTipo)
        //    {
        //        lti.Add(new SelectListItem { Text = row.Dsc_TipoIdentif, Value = row.Id_TipoIdentif.ToString() });
        //    }
        //    return lti;
        //}
        // GET: Concepto

        List<SelectListItem> listaSiNo = new List<SelectListItem>
            {
                new SelectListItem { Text = "S", Value ="S"},
                new SelectListItem { Text = "N", Value ="N"}
            };
        List<SelectListItem> listaCodigoEstado = new List<SelectListItem>
            {
                new SelectListItem { Text = "A", Value ="A"},
                new SelectListItem { Text = "I", Value ="I"}
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

                //ViewBag.listaTipoConcepto = NEGOCIO_ConceptoTipo.NEGOCIO_SelectAll().ToList();
                //ViewBag.listaTipoIdentificacion = NEGOCIO_IdentificacionTipo.NEGOCIO_SelectAll().ToList();

                ViewBag.ListaSiNo = listaSiNo;

                var objNegocios = new NEGOCIO_Concepto();
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


            //ViewBag.listaTipoConcepto = listaTipoConcepto();
            //ViewBag.TipoIdentificacion = listaTipoIdentificacion();
            ViewBag.ListaSiNo = listaSiNo;
            ViewBag.listaCodigoEstado = listaCodigoEstado;
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "IdConcepto,DscTipo,CodEstado,CtaContable,UsarExpiracion,NumDiasExpira,EnviaNotificacion")] FCCxCConcepto obj)
        {
            
            if (ModelState.IsValid)
            {
                using (var negocios = new NEGOCIO_Concepto())
                {
                    negocios.NEGOCIO_insertar(obj);
                }
                //originalmente asumía clase y método estáticos
                //var res = NEGOCIO_Concepto.NEGOCIO_insertar(obj);
                return RedirectToAction("Index");
            }
            ViewBag.ListaSiNo = listaSiNo;
            ViewBag.listaCodigoEstado = listaCodigoEstado;
            return View(obj);
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var objNegocios = new NEGOCIO_Concepto();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdConcepto  == id);
            if (obj == null)
            {
                return HttpNotFound();
            }

            ViewBag.ListaSiNo = listaSiNo;
            ViewBag.listaCodigoEstado = listaCodigoEstado;
            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Edit([Bind(Include = "IdConcepto,DscTipo,CodEstado,CtaContable,UsarExpiracion,NumDiasExpira,EnviaNotificacion")] FCCxCConcepto obj)
        {
            if (ModelState.IsValid)/* Valida que los datos de validacion en la vista se cumplan segun las anotaciones*/
            {
               
                //var res = NEGOCIO_Concepto.NEGOCIO_update(obj);
                return RedirectToAction("Index");
            }
            ViewBag.ListaSiNo = listaSiNo;
            ViewBag.listaCodigoEstado = listaCodigoEstado;
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var objNegocios = new NEGOCIO_Concepto();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdConcepto == id);

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }

            ViewBag.ListaSiNo = listaSiNo;
            return View(obj);

        }

        // GET: FCCxCAuxiliars/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var objNegocios = new NEGOCIO_Concepto();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdConcepto  == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            ViewBag.ListaSiNo = listaSiNo;
            return View(obj);
        }

        // POST: FCCxCAuxiliars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //var obj = NEGOCIO_Concepto.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdConcepto == id);
            //var res = NEGOCIO_Concepto.NEGOCIO_delete(obj.IdConcepto);
            return RedirectToAction("Index");
        }
    }
}