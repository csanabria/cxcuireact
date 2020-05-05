using CxC.Datos;
using CxC.Negocio;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CxC.WebApi.Controllers
{
    public class MaestroController : ApiController
    {
        // GET: api/Maestro
        public IEnumerable<FCCxCMaestro> Get()
        {
            NEGOCIO_Maestro objNegocios = new NEGOCIO_Maestro();
            var obj = objNegocios.NEGOCIO_SelectAll();
            return obj;
        }

        // GET: api/Maestro/5
        public FCCxCMaestro Get(int id)
        {
            NEGOCIO_Maestro obj = new NEGOCIO_Maestro();
            var res = obj.NEGOCIO_Select(id); //.Where(c => c.IdConcepto == id).FirstOrDefault();
            return res;
        }

        // POST: api/Maestro
        public HttpResponseMessage Post(FCCxCMaestro nuevoMaestro)
        {
            try
            {
                using (var negocio = new NEGOCIO_Maestro())
                {
                    var resNegocios = negocio.NEGOCIO_insertar(nuevoMaestro);

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
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }

        }

        // PUT: api/Maestro/5
        public HttpResponseMessage Put(FCCxCMaestro maestroModif)
        {
            try
            {
                using (var negocio = new NEGOCIO_Maestro())
                {
                    var resNegocios = negocio.NEGOCIO_update(maestroModif);

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
                        res.ReasonPhrase = "Error en la inserción";
                    }
                    return res;
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        // DELETE: api/Maestro/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                using (var negocio = new NEGOCIO_Maestro())
                {
                    var resNegocios = negocio.NEGOCIO_delete(id);

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
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
