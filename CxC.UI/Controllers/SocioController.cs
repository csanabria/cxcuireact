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
    public class SocioController : Controller
    {
        // GET: Socio
        List<SelectListItem> listaTipoSocio()
        {
            List<SelectListItem> lts = new List<SelectListItem>();
            var listaSocio = NEGOCIO_SocioTipo.NEGOCIO_SelectAll().ToList();
            foreach (var row in listaSocio)
            {
                lts.Add(new SelectListItem { Text = row.DscTipoDeudor , Value = row.IdTipoDeudor.ToString() });
            }
            return lts;
        }
        List<SelectListItem> listaTipoIdentificacion()
        {
            List<SelectListItem> lti = new List<SelectListItem>();
            var listaIdentificacionTipo= NEGOCIO_IdentificacionTipo.NEGOCIO_SelectAll().ToList();
            foreach (var row in listaIdentificacionTipo)
            {
                lti.Add(new SelectListItem { Text = row.Dsc_TipoIdentif , Value = row.Id_TipoIdentif.ToString ()    });
            }
            return lti;
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
                
                ViewBag.listaTipoSocio = NEGOCIO_SocioTipo.NEGOCIO_SelectAll().ToList();
                ViewBag.listaTipoIdentificacion = NEGOCIO_IdentificacionTipo.NEGOCIO_SelectAll().ToList();

                var lista = NEGOCIO_Socio.NEGOCIO_SelectAll().ToList();
                return View(lista);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }            
        }
        public ActionResult Create()
        {


            ViewBag.listaTipoSocio = listaTipoSocio();
            ViewBag.TipoIdentificacion = listaTipoIdentificacion();

            return View();
        }
        [HttpPost]        
        public ActionResult Create([Bind(Include = "Id_Socio,Num_Identificacion,Id_TipoIdentif,Num_Identificacion2,Dsc_NombreSocio,Dsc_NombreSocio2,Id_TipoSocio,Email_Socio,num_CelularSocio,num_TelefonoSocio,Dsc_Info1Socio,Dsc_Info2Socio,Fec_Creacion,Usr_Creo,Fec_UltModif,Usr_UltModif")] FCCxCSocio obj)
        {
            obj.Usr_Creacion= Session["usuarioLogueado"].ToString();
            obj.Fec_Creacion = DateTime.Now;
            if (ModelState.IsValid)
            {
                var res = NEGOCIO_Socio.NEGOCIO_insertar(obj);
                return RedirectToAction("Index");
            }
            ViewBag.listaTipoSocio = listaTipoSocio();
            ViewBag.TipoIdentificacion = listaTipoIdentificacion();
            return View(obj);
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var obj = NEGOCIO_Socio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_Socio  == id);
            if (obj == null)
            {
                return HttpNotFound();
            }

            ViewBag.listaTipoSocio = listaTipoSocio();
            ViewBag.TipoIdentificacion = listaTipoIdentificacion();

            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
         
        public ActionResult Edit([Bind(Include = "Id_Socio,Num_Identificacion,Id_TipoIdentif,Num_Identificacion2,Dsc_NombreSocio,Dsc_NombreSocio2,Id_TipoSocio,Email_Socio,num_CelularSocio,num_TelefonoSocio,Dsc_Info1Socio,Dsc_Info2Socio,Fec_Creacion,Usr_Creo,Fec_UltModif,Usr_UltModif")] FCCxCSocio obj)
        {
            if (ModelState.IsValid)/* Valida que los datos de validacion en la vista se cumplan segun las anotaciones*/
            {
                obj.Usr_UltModif = Session["usuarioLogueado"].ToString();
                obj.Fec_UltModif = DateTime.Now;
                var res = NEGOCIO_Socio.NEGOCIO_update(obj);
                return RedirectToAction("Index");
            }
            ViewBag.listaTipoSocio = listaTipoSocio();
            ViewBag.TipoIdentificacion = listaTipoIdentificacion();
            return View(obj);
        }
        public ActionResult Details(int? id)
        {
            var obj = NEGOCIO_Socio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_Socio == id);

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
            var obj = NEGOCIO_Socio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_Socio == id);
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
            var obj = NEGOCIO_Socio.NEGOCIO_SelectAll().ToList().FirstOrDefault(a => a.Id_Socio == id);
            var res = NEGOCIO_Socio.NEGOCIO_delete(obj);
            return RedirectToAction("Index");
        }
    }
}