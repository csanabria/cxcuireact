using CxC.Datos;
using CxC.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CxC.WebApi.Controllers
{
    public class AuxiliarController : ApiController
    {
        // GET: api/Auxiliar
        public IEnumerable<FCCxCAuxiliar> Get()
        {
            NEGOCIO_Auxiliar objNegocios = new NEGOCIO_Auxiliar();
            var obj = objNegocios.NEGOCIO_SelectAll();
            return obj;
        }

        // GET: api/Auxiliar/5
        public FCCxCAuxiliar Get(int id)
        {
            NEGOCIO_Auxiliar obj = new NEGOCIO_Auxiliar();
            var res = obj.NEGOCIO_Select(id); //.Where(c => c.IdConcepto == id).FirstOrDefault();
            return res;
        }

        // POST: api/Auxiliar
        public HttpResponseMessage Post([FromBody]FCCxCAuxiliar nuevoAuxiliar)
        {
            try
            {
                //probar throw new Exception("Error de prueba");
                using (var negocio = new NEGOCIO_Auxiliar())
                {
                    var resNegocios = negocio.NEGOCIO_insertar(nuevoAuxiliar);

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

        // PUT: api/Auxiliar/5
        public HttpResponseMessage Put(FCCxCAuxiliar auxiliarModif)
        {
            try
            {
                using (var negocio = new NEGOCIO_Auxiliar())
                {
                    var resNegocios = negocio.NEGOCIO_update(auxiliarModif);

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

        // DELETE: api/Auxiliar/5
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                using (var negocio = new NEGOCIO_Auxiliar())
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
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}
