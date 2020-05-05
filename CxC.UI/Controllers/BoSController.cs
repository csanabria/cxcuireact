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
    public class BoSController : Controller
    {
        List<SelectListItem> listaConcepto()
        {
            List<SelectListItem> lts = new List<SelectListItem>();
            var objNegocios = new NEGOCIO_Concepto();
            var lista = objNegocios.NEGOCIO_SelectAll().ToList();
            foreach (var row in lista)
            {
                lts.Add(new SelectListItem { Text = row.DscTipo, Value = row.IdConcepto.ToString() });
            }
            return lts;
        }
        List<SelectListItem> listaAuxiliar()
        {
            List<SelectListItem> lts = new List<SelectListItem>();
            NEGOCIO_Auxiliar objNegocios = new NEGOCIO_Auxiliar();
            var lista = objNegocios.NEGOCIO_SelectAll().ToList();
            foreach (var row in lista)
            {
                lts.Add(new SelectListItem { Text = row.DscAuxiliar  , Value = row.IdAuxiliar.ToString() });
            }
            return lts;
        }

        List<SelectListItem> listaSP()
        {
            List<SelectListItem> lts = new List<SelectListItem>();
            var objNegocios = new NEGOCIO_StoreProc();
            var lista = objNegocios.NEGOCIO_SelectAll().ToList();
            foreach (var row in lista)
            {
                lts.Add(new SelectListItem { Text = row.Nom_SP , Value = row.Id_SP.ToString() });
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

                var objNegocios = new NEGOCIO_Concepto();
                ViewBag.Concepto = objNegocios.NEGOCIO_SelectAll().ToList();
                NEGOCIO_Auxiliar objNegociosAuxiliar = new NEGOCIO_Auxiliar();
                ViewBag.Auxiliar = objNegociosAuxiliar.NEGOCIO_SelectAll().ToList();
                var objNegociosStoreProc = new NEGOCIO_StoreProc();
                ViewBag.SP = objNegociosStoreProc.NEGOCIO_SelectAll().ToList();

                var objNegociosBoS = new NEGOCIO_BienoServicio();
                var listaBoS = objNegociosBoS.NEGOCIO_SelectAll().ToList();
                return View(listaBoS);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        public ActionResult Create()
        {

            ViewBag.listaConcepto = listaConcepto();
            ViewBag.listaAuxiliar = listaAuxiliar();
            ViewBag.listaSP = listaSP();
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Include = "IdBoS,DscBoS,IdAuxiliar,IdConcepto,FecCreacion,UsrCreacion,FecUltModif,UsrUltModif,Id_SP")] FCCxCBienoServicio obj)
        {
            obj.UsrCreacion = Session["usuarioLogueado"].ToString();
            obj.FecCreacion = DateTime.Now;
            obj.UsrUltModif = Session["usuarioLogueado"].ToString();
            obj.FecUltModif = DateTime.Now;
            if (ModelState.IsValid)
            {
                var objNegocios = new NEGOCIO_BienoServicio();
                var res = objNegocios.NEGOCIO_insertar(obj);
                return RedirectToAction("Index");
            }

            ViewBag.listaConcepto = listaConcepto();
            ViewBag.listaAuxiliar = listaAuxiliar();
            ViewBag.listaSP = listaSP();
            return View(obj);
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var objNegocios = new NEGOCIO_BienoServicio();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoS  == id);
            if (obj == null)
            {
                return HttpNotFound();
            }

            ViewBag.listaConcepto = listaConcepto();
            ViewBag.listaAuxiliar = listaAuxiliar();
            ViewBag.listaSP = listaSP();
            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Edit([Bind(Include = "IdBoS,DscBoS,IdAuxiliar,IdConcepto,FecCreacion,UsrCreacion,FecUltModif,UsrUltModif,Id_SP")] FCCxCBienoServicio obj)
        {
            obj.UsrUltModif = Session["usuarioLogueado"].ToString();
            obj.FecUltModif = DateTime.Now;
            if (ModelState.IsValid)/* Valida que los datos de validacion en la vista se cumplan segun las anotaciones*/
            {
                var objNegocios = new NEGOCIO_BienoServicio();
                var res = objNegocios.NEGOCIO_update(obj);
                return RedirectToAction("Index");
            }

            ViewBag.listaConcepto = listaConcepto();
            ViewBag.listaAuxiliar = listaAuxiliar();
            ViewBag.listaSP = listaSP();
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var objNegocios = new NEGOCIO_BienoServicio();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoS == id);

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (obj == null)
            {
                return HttpNotFound();
            }

            var objNegociosConcepto = new NEGOCIO_Concepto();
            ViewBag.Concepto = objNegociosConcepto.NEGOCIO_SelectAll().ToList();
            NEGOCIO_Auxiliar objNegociosAuxiliar = new NEGOCIO_Auxiliar();
            ViewBag.Auxiliar = objNegociosAuxiliar.NEGOCIO_SelectAll().ToList();
            var objNegociosStoreProc = new NEGOCIO_StoreProc();
            ViewBag.SP = objNegocios.NEGOCIO_SelectAll().ToList();
            return View(obj);

        }

        // GET: FCCxCAuxiliars/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var objNegocios = new NEGOCIO_BienoServicio();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoS == id);
            if (obj == null)
            {
                return HttpNotFound();
            }
            var objNegociosContepto = new NEGOCIO_BienoServicio();
            ViewBag.Concepto = objNegociosContepto.NEGOCIO_SelectAll().ToList();
            NEGOCIO_Auxiliar objNegociosAuxiliar = new NEGOCIO_Auxiliar();
            ViewBag.Auxiliar = objNegocios.NEGOCIO_SelectAll().ToList();
            var objNegociosStoreProc = new NEGOCIO_Concepto();
            ViewBag.SP = objNegociosStoreProc.NEGOCIO_SelectAll().ToList();
            return View(obj);
        }

        // POST: FCCxCAuxiliars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var objNegocios = new NEGOCIO_BienoServicio();
            var obj = objNegocios.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.IdBoS == id);
            var res = objNegocios.NEGOCIO_delete(obj.IdBoS);
            return RedirectToAction("Index");
        }
    }
}