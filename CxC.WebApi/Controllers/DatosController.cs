using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CxC.WebApi.Controllers
{
    //[Authorize]
    [RoutePrefix("api/datos")]
    public class DatosController : ApiController
    {
        //solo este método está protegido por el token
        [Authorize]
        [HttpGet]
        // GET: api/Datos
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Datos/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Datos
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Datos/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Datos/5
        public void Delete(int id)
        {
        }
    }
}
