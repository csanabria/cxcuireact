using CxC.Datos;
using CxC.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Http;
using System.Web.Services;

namespace CxC.WebApi.Controllers
{
    public class BienoServicioController : ApiController
    {
        // GET: api/BienoServicio
        public IEnumerable<FCCxCBienoServicio> Get()
        {
            NEGOCIO_BienoServicio objNegocios = new NEGOCIO_BienoServicio();
            var obj = objNegocios.NEGOCIO_SelectAll();
            return obj;
        }

        // GET: api/BienoServicio/5
        public FCCxCBienoServicio Get(int id)
        {
            NEGOCIO_BienoServicio obj = new NEGOCIO_BienoServicio();
            var res = obj.NEGOCIO_Select(id); //.Where(c => c.IdConcepto == id).FirstOrDefault();
            return res;
        }

        // POST: api/BienoServicio
        public HttpResponseMessage Post([FromBody]FCCxCBienoServicio nuevoBienoServicio)
        {
            try
            {
                //probar throw new Exception("Error de prueba");
                using (var objNegocio = new NEGOCIO_BienoServicio())
                {
                    var resNegocios = objNegocio.NEGOCIO_insertar(nuevoBienoServicio);

                    //mensaje Http de respuesta del Api
                    HttpResponseMessage res = null;

                    if (resNegocios)
                    {
                        //crear respuesta de ok
                        res = new HttpResponseMessage(HttpStatusCode.OK);

                        //no se puede obtener el Id del nuevo registro pues retorna un bool
                        //var message = Request.CreateResponse(HttpStatusCode.Created, nuevoConcepto.IdConcepto);
                        //message.Headers.Location = new Uri(Request.RequestUri +
                        //    nuevoConcepto.IdConcepto.ToString());
                    }
                    else
                    {
                        //crear respuesta de error
                        res = new HttpResponseMessage(HttpStatusCode.InternalServerError);
                    }
                    return res;
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }

        }

        // PUT: api/BienoServicio/5
        public HttpResponseMessage Put(FCCxCBienoServicio BienoServicioModif)
        {
            try
            {
                using (var objNegocio = new NEGOCIO_BienoServicio())
                {
                    var resNegocios = objNegocio.NEGOCIO_update(BienoServicioModif);

                    //mensaje Http de respuesta del Api
                    HttpResponseMessage res = null;

                    if (resNegocios)
                    {
                        //crear respuesta de ok
                        res = new HttpResponseMessage(HttpStatusCode.OK);
                    }
                    else
                    {
                        //crear respuesta de error
                        res = new HttpResponseMessage(HttpStatusCode.InternalServerError);
                    }
                    return res;
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // DELETE: api/BienoServicio/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                using (var objNegocio = new NEGOCIO_BienoServicio())
                {
                    var resNegocios = objNegocio.NEGOCIO_delete(id);

                    //mensaje Http de respuesta del Api
                    HttpResponseMessage res = null;

                    if (resNegocios)
                    {
                        //crear respuesta de ok
                        res = new HttpResponseMessage(HttpStatusCode.OK);

                        //no se puede obtener el Id del nuevo registro pues retorna un bool
                        //var message = Request.CreateResponse(HttpStatusCode.Created, nuevoConcepto.IdConcepto);
                        //message.Headers.Location = new Uri(Request.RequestUri +
                        //    nuevoConcepto.IdConcepto.ToString());
                    }
                    else
                    {
                        //crear respuesta de error
                        res = new HttpResponseMessage(HttpStatusCode.InternalServerError);
                    }
                    return res;
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        [WebMethod(Description = "Retorna la lista de Bienes o Servicios asociados a un Auxiliar, _" +
            "con su respectivo IdPrecio, Precio(colones) y Periodo(año). Parametros: IdAuxiliar(es obligatorio), _" +
            "En el IdBienOServicio y Periodo enviar 0 (cero) si no se utilizan")]
        public HttpResponseMessage ObtenerBoSPrecio(FCCxCBienoServicio BienoServicioBuscar) //(int IdAuxiliar, int IdBienOServicio, int Periodo)
        {
            try
            {
                HttpResponseMessage res;
                using (var objNegocio = new NEGOCIO_BienoServicio())
                {
                    //Retorna la lista de Bienes o Servicios, con precio, idprecio, periodo           
                    var oBoSPrecio = objNegocio.NEGOCIO_Select(BienoServicioBuscar.IdBoS); // new NEGOCIO_BoSPrecio();// (224, "CA", 0, "Desconocido", Key_Ambiente);

                    //por qué hace esto antes de devolverlo?

                    if (BienoServicioBuscar.IdBoS > 0)  //if (BienoServicioBuscar.IdBienOServicio > 0)
                    {
                        oBoSPrecio.IdBoS = BienoServicioBuscar.IdBoS;// BienoServicioBuscar.IdBienOServicio;
                    }

                    oBoSPrecio.IdAuxiliar = BienoServicioBuscar.IdAuxiliar;

                    res = Request.CreateResponse(HttpStatusCode.OK, oBoSPrecio);
                    //response.Content = ???
                    res.Headers.CacheControl = new CacheControlHeaderValue()
                    {
                        MaxAge = TimeSpan.FromMinutes(20)
                    };
                }
                return res;
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
    }   //class
}   //namespace
