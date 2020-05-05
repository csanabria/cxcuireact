using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CxC.Datos;
using CxC.Negocio;

namespace CxC.WebApi.Controllers
{
    public class ConceptoController : ApiController
    {
        // GET: api/Concepto
        public IEnumerable<FCCxCConcepto> Get()
        {
            var objNegocios = new NEGOCIO_Concepto();
            var obj = objNegocios.NEGOCIO_SelectAll();
            return obj;
        }

        // GET: api/Concepto/5
        public FCCxCConcepto Get(int id)
        {
            NEGOCIO_Concepto obj = new NEGOCIO_Concepto();
            var res = obj.NEGOCIO_Select(id); //.Where(c => c.IdConcepto == id).FirstOrDefault();
            return res;
        }

        // POST: api/Concepto
        public HttpResponseMessage Post([FromBody]FCCxCConcepto nuevoConcepto)
        {
            try
            {
                using (var negocio = new NEGOCIO_Concepto())
                {
                    var resNegocios = negocio.NEGOCIO_insertar(nuevoConcepto);

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

        // PUT: api/Concepto/   verbo Put y {CxCConcepto} en el header
        public HttpResponseMessage Put(FCCxCConcepto conceptoModif)
        {
            try
            {
                using (var negocio = new NEGOCIO_Concepto())
                {
                    var resNegocios = negocio.NEGOCIO_update(conceptoModif);

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


        // DELETE: api/Concepto/5
        public HttpResponseMessage Delete(int id)
        {
            //eliminar
            using (var negocio = new NEGOCIO_Concepto())
            {
                var resNegocios = negocio.NEGOCIO_delete(id);

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
    }
}
