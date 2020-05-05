using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Web.Http.Cors;
using System.Configuration;
using System.Web.Routing;
using CxC.WebApi.Clases;
using CxC.Objetos.Clases;
using System.Web.Http.Controllers;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;

//esto se hace pues los decoradores están repetidos en dos namespaces: System.Web.Http y System.Web.Mvc
using AllowAnonymousAttribute = System.Web.Http.AllowAnonymousAttribute;
using RoutePrefixAttribute = System.Web.Http.RoutePrefixAttribute;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;
using System.Web.Script.Serialization;

namespace CxC.WebApi
{
    /// <summary>
    /// login controller class for authenticate users
    /// </summary>
    //version mia ******************************************
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        #region Instancias
        //Instancia a la clase de Servicios en UIProcess
        private AccesoSeguridad ServiciosSeguridad = new AccesoSeguridad();
        //Objeto de retorno
        oRespuesta<string> respuestaValidacion = new oRespuesta<string>();

        //Debido que el usuario aun no está logueado, se usa un dummy inicial al logueo.
        //Luego de loguearse, cambia los datos al usuario que se encuentra logueado.
        int idUsuarioLogueado = 1;
        string usuarioLogueado = "sistemaLogueo@itcr.ac.cr";
        public string sessionId = ConfigurationManager.AppSettings["SessionID"];

        //public void InitializeController(RequestContext context)
        //{
        //    base.Initialize(context)
        //}

        //versión de initialize para Api Controller, cambia el tipo de dato de context
        //public void InitializeController(HttpControllerContext context)
        //{
        //    base.Initialize(context);
        //    //base.Initialize(context);
        //}

        #endregion

        public const string JsonContentType = "application/json";

        [System.Web.Http.HttpGet]
        public IHttpActionResult Get()
        {
            //var res = new JsonResult();
            //res.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            //res.ContentType = JsonContentType;
            //res.MaxJsonLength = 
            //res.Data = "método HTTP inválido - usar el verbo http correcto";
            //return res;
            return Ok("Endpoint correcto, pero método HTTP inválido - usar el verbo POST");
        }

        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        //Este tipo será el valor de retorno para la autenticación, que complementa los datos completos del usuario con los datos
        //de autenticación (JWToken, expiración TODO, etc TODO)
        class DatosUsuario : UIProcess.WCF_Seguridad.TEC_Usuario
        {
            public int Id { get; set; }
            public string LoginUsuario { get; set; }

            public string NombreCompleto { get; set; }
            public string JWToken { get; set; }
            public DateTime? ExpiracionToken { get; set; }
        }

        //versión con objeto API, funciona
        [System.Web.Http.HttpPost]
        //[EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult Post()
        {
            string usuario = String.Empty, clave = String.Empty;
            //error por defecto (credenciales incorrectas) (pesimista)
            //OWASP Secure Coding Best Practices (SBP) (#28, #33)
            /* 33. Authentication failure responses should not indicate which part of the authentication data was incorrect. 
             * For example, instead of "Invalid username" or "Invalid password", just use "Invalid username and/or password" for both. 
             * Error responses must be truly identical in both display and source code
             * https://www.owasp.org/index.php/OWASP_Secure_Coding_Practices_Checklist
            */
            IHttpActionResult res = Ok(-1);     //error generico por defecto (pesimista)

            // @ la casa
            bool NoSegTec = true;
            if (NoSegTec)
            {
                //modo desarrollo, brincarse la seguridad del TEC, usar datos alambrados

                //poner los datos en un oRespuesta<string> para continuar
                CxC.Objetos.Clases.oRespuesta<string> objResValidar = new oRespuesta<string>();

                //CxC.WebApi.WCF_Seguridad.TEC_Usuario datosUsuario = (CxC.WebApi.WCF_Seguridad.TEC_Usuario)resValidar.Data;

                //falta calcular nombreCompleto, JWToken para retornarlo de una vez

                DatosUsuario datosUsuarioExt = new DatosUsuario();
                datosUsuarioExt.Apellido1 = "Apellido1";
                datosUsuarioExt.Apellido2 = "Apellido2";
                datosUsuarioExt.Bloqueado = false;
                datosUsuarioExt.CorreoElectronicoANotificar = "csanabria@itcr.ac.cr";
                datosUsuarioExt.CorreoElectronicoPrincipal = "csanabria@itcr.ac.cr";
                datosUsuarioExt.Departamento = "DATIC";
                datosUsuarioExt.Descripcion = "";
                datosUsuarioExt.DescripPuesto = "Profesional en TI";
                datosUsuarioExt.Estado = true;
                datosUsuarioExt.extension = "2354";
                datosUsuarioExt.FechaCreacion = new DateTime(1996, 2, 7);
                datosUsuarioExt.FechaExpiracion = new DateTime(6155, 12, 31);
                datosUsuarioExt.FechaNacimiento = new DateTime(1976, 4, 20);
                datosUsuarioExt.IdDepartamento = 1;
                datosUsuarioExt.Identificacion = "109360326";
                datosUsuarioExt.IdTipoUsuario = 1;
                datosUsuarioExt.IdUsuario = 1;
                datosUsuarioExt.NoCarnet = "";
                datosUsuarioExt.Nombre = "Nombre";
                datosUsuarioExt.OcupaCambioContrasena = false;
                datosUsuarioExt.Oficina = "B6";
                datosUsuarioExt.TipoUsuario = "1";
                datosUsuarioExt.UsuarioCreacion = "1";
                datosUsuarioExt.UsuarioModificacion = "1";
                datosUsuarioExt.UsuarioVencido = false;


                datosUsuarioExt.NombreCompleto = datosUsuarioExt.Apellido1 + " " + datosUsuarioExt.Apellido2 + " " + datosUsuarioExt.Nombre;
                datosUsuarioExt.Id = datosUsuarioExt.IdUsuario;
                datosUsuarioExt.LoginUsuario = usuario;
                //genera el JW Token y le pone expiración por defecto de 1 hora (esto es renovable)
                datosUsuarioExt.JWToken = JwtManager.GenerarToken(usuario);
                datosUsuarioExt.ExpiracionToken = DateTime.UtcNow.AddHours(24);


                //ya validó al usuario, obtiene los permisos (claims)
                //aca es donde ocupo obtener los permisos, luego de saber que las credenciales son válidas
                //TODO var consultaPermisos = ServiciosSeguridad.ConsultarPermisosUsuario(0, datosUsuario.IdUsuario, 0, 0, idUsuarioLogueado, usuarioLogueado, Utilitarios.Clases.Utilitarios.GetIpAddress(), "SessionId");

                var datosPermisos = new { };// consultaPermisos.ObjetoRespuesta;

                var datosCompletos = new
                {
                    datosUsuario = datosUsuarioExt,
                    datosPermisos = datosPermisos
                };

                //validación correcta del usuario y pone los datos para set retornados los datos
                objResValidar.CodigoRespuesta = 0;
                objResValidar.MensajeRespuesta = "";
                objResValidar.ObjetoRespuesta = new JavaScriptSerializer().Serialize(datosCompletos);

                res = Ok(objResValidar);
            }
            else
            {
                try
                {
                    if (Request.Headers.Contains("usuario"))
                    {
                        usuario = Request.Headers.GetValues("usuario").FirstOrDefault();
                        if (Request.Headers.Contains("clave"))
                        {
                            clave = Request.Headers.GetValues("clave").FirstOrDefault();
                        }

                        var resValidar = ValidarUsuario(usuario, clave);

                        //poner los datos en un oRespuesta<string> para continuar
                        CxC.Objetos.Clases.oRespuesta<string> objResValidar = new oRespuesta<string>();
                        if (resValidar.Data.GetType().FullName == "CxC.WebApi.WCF_Seguridad.TEC_Usuario")
                        {
                            CxC.WebApi.WCF_Seguridad.TEC_Usuario datosUsuario = (CxC.WebApi.WCF_Seguridad.TEC_Usuario)resValidar.Data;

                            //falta calcular nombreCompleto, JWToken para retornarlo de una vez

                            DatosUsuario datosUsuarioExt = new DatosUsuario();
                            datosUsuarioExt.Apellido1 = datosUsuario.Apellido1;
                            datosUsuarioExt.Apellido2 = datosUsuario.Apellido2;
                            datosUsuarioExt.Bloqueado = datosUsuario.Bloqueado;
                            datosUsuarioExt.CorreoElectronicoANotificar = datosUsuario.CorreoElectronicoANotificar;
                            datosUsuarioExt.CorreoElectronicoPrincipal = datosUsuario.CorreoElectronicoPrincipal;
                            datosUsuarioExt.Departamento = datosUsuario.Departamento;
                            datosUsuarioExt.Descripcion = datosUsuario.Descripcion;
                            datosUsuarioExt.DescripPuesto = datosUsuario.DescripPuesto;
                            datosUsuarioExt.Estado = datosUsuario.Estado;
                            datosUsuarioExt.extension = datosUsuario.extension;
                            datosUsuarioExt.FechaCreacion = datosUsuario.FechaCreacion;
                            datosUsuarioExt.FechaExpiracion = datosUsuario.FechaExpiracion;
                            datosUsuarioExt.FechaNacimiento = datosUsuario.FechaNacimiento;
                            datosUsuarioExt.IdDepartamento = datosUsuario.IdDepartamento;
                            datosUsuarioExt.Identificacion = datosUsuario.Identificacion;
                            datosUsuarioExt.IdTipoUsuario = datosUsuario.IdTipoUsuario;
                            datosUsuarioExt.IdUsuario = datosUsuario.IdUsuario;
                            datosUsuarioExt.NoCarnet = datosUsuario.NoCarnet;
                            datosUsuarioExt.Nombre = datosUsuario.Nombre;
                            datosUsuarioExt.OcupaCambioContrasena = datosUsuario.OcupaCambioContrasena;
                            datosUsuarioExt.Oficina = datosUsuario.Oficina;
                            datosUsuarioExt.TipoUsuario = datosUsuario.TipoUsuario;
                            datosUsuarioExt.UsuarioCreacion = datosUsuario.UsuarioCreacion;
                            datosUsuarioExt.UsuarioModificacion = datosUsuario.UsuarioModificacion;
                            datosUsuarioExt.UsuarioVencido = datosUsuario.UsuarioVencido;


                            datosUsuarioExt.NombreCompleto = datosUsuario.Apellido1 + " " + datosUsuario.Apellido2 + " " + datosUsuario.Nombre;
                            datosUsuarioExt.Id = datosUsuario.IdUsuario;
                            datosUsuarioExt.LoginUsuario = usuario;
                            //genera el JW Token y le pone expiración por defecto de 1 hora (esto es renovable)
                            datosUsuarioExt.JWToken = JwtManager.GenerarToken(usuario);
                            datosUsuarioExt.ExpiracionToken = DateTime.UtcNow.AddHours(1);


                            //ya validó al usuario, obtiene los permisos (claims)
                            //aca es donde ocupo obtener los permisos, luego de saber que las credenciales son válidas
                            var consultaPermisos = ServiciosSeguridad.ConsultarPermisosUsuario(0, datosUsuario.IdUsuario, 0, 0, idUsuarioLogueado, usuarioLogueado, Utilitarios.Clases.Utilitarios.GetIpAddress(), "SessionId");

                            var datosPermisos = consultaPermisos.ObjetoRespuesta;

                            var datosCompletos = new
                            {
                                datosUsuario = datosUsuarioExt,
                                datosPermisos = datosPermisos
                            };

                            //validación correcta del usuario y pone los datos para set retornados los datos
                            objResValidar.CodigoRespuesta = 0;
                            objResValidar.MensajeRespuesta = "";
                            objResValidar.ObjetoRespuesta = new JavaScriptSerializer().Serialize(datosCompletos);

                            res = Ok(objResValidar);
                        }
                        else
                        {
                            objResValidar.CodigoRespuesta = -1;
                            objResValidar.MensajeRespuesta = "Credenciales inválidas";

                        }
                        //fin poner datos...
                    }
                    else
                    {
                        //no viene el parametro usuario en el header
                        res = Ok(-2);                                                                   //SBP#33 - faltan credenciales pero genera credenciales incorrectas
                    }
                }
                catch (Exception ex)
                {
                    res = Ok(-1);           //error genérico
                }
            } //else del if (NoSecTec)
            return res;
        }

        /// <summary>
        /// Login de usuario - valida las credenciales ingresadas
        /// Metodo provisto por Esteban / Erick
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="contrasena"></param>
        /// <returns></returns>
        public JsonResult ValidarUsuario(string usuario, string contrasena)
        {
            try
            {
                string extITCR = ConfigurationManager.AppSettings["extITCR"].ToString();
                string extTEC = ConfigurationManager.AppSettings["extTEC"].ToString();
                string extESTUDTEC = ConfigurationManager.AppSettings["exESTUDTEC"].ToString();

                if (!usuario.Contains("@" + extITCR))
                {
                    usuario = usuario + "@" + extITCR; //Por ahora solo funcionarios
                }


                //Validación de nulos
                if (string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(contrasena))
                {
                    respuestaValidacion.CodigoRespuesta = -1;
                    respuestaValidacion.MensajeRespuesta = Utilitarios.Mensajes.Mensajes.ValidacionNulos;
                    return new JsonResult { Data = respuestaValidacion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                }

                if (!string.IsNullOrEmpty(usuario))
                {
                    if (usuario.Contains(extTEC))
                    {
                        usuario = usuario.Replace(extTEC, extITCR);
                    }
                }

                //Limpieza de datos de logueo
                usuario = usuario.Trim();
                contrasena = contrasena.Trim();
                usuario = usuario.ToLower();

                //Prevención inicial de inyección de código
                bool validaCaracteresUsuario = Utilitarios.Clases.Utilitarios.ValidarCaracteresEspeciales(usuario);
                bool validaCaracteresPassword = Utilitarios.Clases.Utilitarios.ValidarCaracteresEspeciales(contrasena);

                //Validación caracteres usuario
                if (validaCaracteresUsuario)
                {
                    respuestaValidacion.CodigoRespuesta = -1;
                    respuestaValidacion.MensajeRespuesta = Utilitarios.Mensajes.Mensajes.ValidacionCaracteresUsuario;
                    return new JsonResult { Data = respuestaValidacion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                }
                //Validación caracteres contraseña
                else if (validaCaracteresPassword)
                {
                    respuestaValidacion.CodigoRespuesta = -1;
                    respuestaValidacion.MensajeRespuesta = Utilitarios.Mensajes.Mensajes.ValidacionCaracteresContrasena;
                    return new JsonResult { Data = respuestaValidacion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                }

                //Acceso a servicio para validación de usuario

                //csanabria- para Api no aplica... Session[ConfigurationManager.AppSettings["SessionID"]] = HttpContext.Session.SessionID;
                var consultaUsuario = ServiciosSeguridad.AutenticarUsuario(usuario, contrasena, idUsuarioLogueado, usuarioLogueado, Utilitarios.Clases.Utilitarios.GetIpAddress(), "SessionId"); //csanabria- para Api no aplica... Session[sessionId].ToString());

                //Fue validado
                if (consultaUsuario.CodigoRespuesta == 0)
                {
                    //Si el usuario es válido crea la sesión
                    //csanabria- para Api no aplica...Session[ConfigurationManager.AppSettings["CodigoUsuarioLogueado"]] = consultaUsuario.ObjetoRespuesta.IdUsuario;
                    //csanabria- para Api no aplica...Session["sesionCodigoUsuarioLogueado"] = consultaUsuario.ObjetoRespuesta.IdUsuario;
                    //csanabria- para Api no aplica...Session[ConfigurationManager.AppSettings["usuarioLogueado"]] = usuario;
                    //generarPermisosMenu(usuario);

                    //var consultaPermisos = ServiciosSeguridad.ConsultarPermisosUsuario(0, consultaUsuario.ObjetoRespuesta.IdUsuario, 0, 0, idUsuarioLogueado, usuarioLogueado, Utilitarios.Clases.Utilitarios.GetIpAddress(), "SessionId");

                    //combinar ambos objetos respuesta para retornar todos los datos en una sola llamada
                    //UIProcess.WCF_Seguridad.TEC_MensajeOfTEC_Usuario datosUsuario = consultaUsuario;
                    //UIProcess.WCF_Seguridad.TEC_MensajeOfListOfTEC_Permiso datosPermisos = consultaPermisos;

                    //var respuesta = new
                    //{
                    //    usuario = datosUsuario,
                    //    permisos = datosPermisos
                    //};


                    var resultado = new JsonResult { Data = consultaUsuario.ObjetoRespuesta, JsonRequestBehavior = JsonRequestBehavior.AllowGet };

                    return resultado;
                }
                else
                {
                    //Si el usuario no es válido no crea el dato de sesión
                    //csanabria- para Api no aplica...Session[ConfigurationManager.AppSettings["CodigoUsuarioLogueado"]] = "0";
                    //csanabria- para Api no aplica...Session[ConfigurationManager.AppSettings["usuarioLogueado"]] = null;
                    respuestaValidacion.CodigoRespuesta = -1;
                    //respuestaValidacion.MensajeRespuesta = consultaUsuario.DescripcionRespuesta;
                    return new JsonResult { Data = respuestaValidacion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                }
            }
            catch (Exception ex)
            {
                respuestaValidacion.CodigoRespuesta = -1;
                respuestaValidacion.MensajeRespuesta = Utilitarios.Mensajes.Mensajes.MensajeGenerico;
                return new JsonResult { Data = respuestaValidacion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
        }


        /// <summary>
        /// Obtiene los permisos /menu del usuario
        /// </summary>
        /// <param name="idPadre"></param>
        /// <returns></returns>
        public JsonResult ConsultarPermisosUsuario(int idUsuario, string sessionId)
        {
            try
            {
                //Acceso a servicios
                var consultaPermisos = ServiciosSeguridad.ConsultarPermisosUsuario(0, idUsuario, 0, 0, idUsuarioLogueado, usuarioLogueado, Utilitarios.Clases.Utilitarios.GetIpAddress(), sessionId);


                if (true) //csanabria- para Api no aplica... (respuesta.ObjetoRespuesta.Count() <= 0)
                {
                    respuestaValidacion.CodigoRespuesta = -1;
                    respuestaValidacion.MensajeRespuesta = Utilitarios.Mensajes.Mensajes.ValidacionPermisosUsuario;
                    return new JsonResult { Data = consultaPermisos, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
                }

                //warning de código inalcanzable, pero se debe al cambio anterior de if (true)
                //return new JsonResult { Data = respuesta, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
            catch (Exception ex)
            {
                respuestaValidacion.CodigoRespuesta = -1;
                respuestaValidacion.MensajeRespuesta = Utilitarios.Mensajes.Mensajes.MensajeGenerico;
                return new JsonResult { Data = respuestaValidacion, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }

        }


        //csanabria:PARA EL API NO APLICA
        //Cerrar sesión de aplicación
        //public ActionResult CerrarSesion()
        //{
        //    //inserta en bitácora del sistema de seguridad la salida
        //    if (Session[ConfigurationManager.AppSettings["usuarioLogueado"]] != null)
        //    {
        //        // ServiciosSeguridad.InsertarBitacoraSistema("Cierre de sesión Usuario : " + Session[ConfigurationManager.AppSettings["UsuarioLogueado"]].ToString(), Constantes.CodigosBitacora.INACTIVAR, "LoginController - Interno", "CerrarSesion", false, Convert.ToInt32(Session[ConfigurationManager.AppSettings["CodigoUsuarioLogueado"]]), Session[ConfigurationManager.AppSettings["UsuarioLogueado"]].ToString(), Utilitarios.Clases.Utilitarios.GetIpAddress(), Session[sessionId].ToString(), null);
        //    }



        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        //    Response.Cache.SetNoStore();
        //    Session.Clear();
        //    Session.Abandon();
        //    Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));

        //    return RedirectToAction("Index", "Login");
        //}



        static class JwtManager
        {
            public static string GenerarToken(string string_original)
            {
                string res = String.Empty;
                if (!String.IsNullOrEmpty(string_original))
                {
                    try
                    {
                        byte[] plaintextBytes = Encoding.Unicode.GetBytes(string_original);

                        res = Encrypt(string_original, "DATIC", "Dataehaeh");
                    }
                    catch (Exception ex)
                    {
                        //TODO: TEMP si da error
                        res = string_original;
                    }
                }
                return res;
            }
        }

        //algoritmo de encripción SIMETRICA
        public static string Encrypt(string value, string password, string salt)
        {
            DeriveBytes rgb = new Rfc2898DeriveBytes(password, Encoding.Unicode.GetBytes(salt));
            SymmetricAlgorithm algorithm = new TripleDESCryptoServiceProvider();
            byte[] rgbKey = rgb.GetBytes(algorithm.KeySize >> 3);
            byte[] rgbIV = rgb.GetBytes(algorithm.BlockSize >> 3);
            ICryptoTransform transform = algorithm.CreateEncryptor(rgbKey, rgbIV);
            using (MemoryStream buffer = new MemoryStream())
            {
                using (CryptoStream stream = new CryptoStream(buffer, transform, CryptoStreamMode.Write))
                {
                    using (StreamWriter writer = new StreamWriter(stream, Encoding.Unicode))
                    {
                        writer.Write(value);
                    }
                }
                return Convert.ToBase64String(buffer.ToArray());
            }
        }

        //algoritmo de des-encripción (encripción SIMETRICA anterior)
        public static string Decrypt(string text, string password, string salt)
        {
            DeriveBytes rgb = new Rfc2898DeriveBytes(password, Encoding.Unicode.GetBytes(salt));
            SymmetricAlgorithm algorithm = new TripleDESCryptoServiceProvider();
            byte[] rgbKey = rgb.GetBytes(algorithm.KeySize >> 3);
            byte[] rgbIV = rgb.GetBytes(algorithm.BlockSize >> 3);
            ICryptoTransform transform = algorithm.CreateDecryptor(rgbKey, rgbIV);
            using (MemoryStream buffer = new MemoryStream(Convert.FromBase64String(text)))
            {
                using (CryptoStream stream = new CryptoStream(buffer, transform, CryptoStreamMode.Read))
                {
                    using (StreamReader reader = new StreamReader(stream, Encoding.Unicode))
                    {
                        return reader.ReadToEnd();
                    }
                }
            }
        }

        public class DatosError
        {
            public int CodigoRespuesta { get; set; }
            public string Mensaje { get; set; }
        }

        public class DatosRespuesta
        {
            public int CodigoRespuesta { get; set; }
            public string Mensaje { get; set; }
            public Object ObjetoRespuesta { get; set; }
        }
    }
}
