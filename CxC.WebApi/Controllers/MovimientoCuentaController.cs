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
    public class MovimientoCuentaController : ApiController
    {
        // GET: api/MovimientoCuenta
        public IEnumerable<FCCxCMovimientoCuenta> Get()
        {
            var objNegocios = new NEGOCIO_MovimientoCuenta();
            var obj = objNegocios.NEGOCIO_SelectAll();
            return obj;
        }

        // GET: api/MovimientoCuenta/5
        public FCCxCMovimientoCuenta Get(int id)
        {
            NEGOCIO_MovimientoCuenta obj = new NEGOCIO_MovimientoCuenta();
            var res = obj.NEGOCIO_Select(id); //.Where(c => c.IdMovimientoCuenta == id).FirstOrDefault();
            return res;
        }

        // POST: api/MovimientoCuenta
        public HttpResponseMessage Post([FromBody]FCCxCMovimientoCuenta nuevoMovimientoCuenta)
        {
            try
            {
                using (var negocio = new NEGOCIO_MovimientoCuenta())
                {
                    var resNegocios = negocio.NEGOCIO_insertar(nuevoMovimientoCuenta);

                    //mensaje Http de respuesta del Api
                    HttpResponseMessage res = null;

                    if (resNegocios)
                    {
                        //crear respuesta de ok
                        res = new HttpResponseMessage(HttpStatusCode.OK);

                        //no se puede obtener el Id del nuevo registro pues retorna un bool
                        //var message = Request.CreateResponse(HttpStatusCode.Created, nuevoMovimientoCuenta.IdMovimientoCuenta);
                        //message.Headers.Location = new Uri(Request.RequestUri +
                        //    nuevoMovimientoCuenta.IdMovimientoCuenta.ToString());
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

        // PUT: api/MovimientoCuenta/   verbo Put y {CxCMovimientoCuenta} en el header
        public HttpResponseMessage Put(FCCxCMovimientoCuenta MovimientoCuentaModif)
        {
            try
            {
                using (var negocio = new NEGOCIO_MovimientoCuenta())
                {
                    var resNegocios = negocio.NEGOCIO_update(MovimientoCuentaModif);

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


        // DELETE: api/MovimientoCuenta/5
        public HttpResponseMessage Delete(int id)
        {
            //eliminar
            using (var negocio = new NEGOCIO_MovimientoCuenta())
            {
                var resNegocios = negocio.NEGOCIO_delete(id);

                //mensaje Http de respuesta del Api
                HttpResponseMessage res = null;

                if (resNegocios)
                {
                    //crear respuesta de ok
                    res = new HttpResponseMessage(HttpStatusCode.OK);

                    //no se puede obtener el Id del nuevo registro pues retorna un bool
                    //var message = Request.CreateResponse(HttpStatusCode.Created, nuevoMovimientoCuenta.IdMovimientoCuenta);
                    //message.Headers.Location = new Uri(Request.RequestUri +
                    //    nuevoMovimientoCuenta.IdMovimientoCuenta.ToString());
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
