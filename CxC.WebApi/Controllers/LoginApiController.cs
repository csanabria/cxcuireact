using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using CxC.WebApi.Models;
using CxC.WebApi.Clases;

/*
 * Fuente: https://enmilocalfunciona.io/construyendo-una-web-api-rest-segura-con-json-web-token-en-net-parte-ii/
 */

namespace CxC.UI.Controllers
{
    //controlador para que la ui react obtenga el token para interactuar
    //con el resto del api

    public class LoginApiController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            //TODO: Validate credentials Correctly, this code is only for demo !!
            bool isCredentialValid = (login.Password == "123456");
            if (isCredentialValid)
            {
                var token = TokenGenerator.GenerateTokenJwt(login.Username);
                return Ok(token);
            }
            else
            {
                return Unauthorized();
            }
        }


        //[System.Web.Mvc.HttpPost]
        //string PostAnterior()
        //{
        //    var header = new
        //    {
        //        alg = "HS256",
        //        typ = "JWT"
        //    };

        //    var headerPart = Base64UrlEncoder.Encode(JsonConvert.SerializeObject(header));

        //    var payload = new
        //    {
        //        userId = "1",
        //        userEmail = "cxc@itcr.ac.cr",
        //        userName = "csanabria"
        //    };

        //    var payloadPart = Base64UrlEncoder.Encode(JsonConvert.SerializeObject(payload));

        //    var secret = "my-secret";
        //    var sha256 = new HMACSHA256(Encoding.UTF8.GetBytes(secret));
        //    var hashBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes($"{headerPart}.{payloadPart}"));
        //    var hash = Base64UrlEncoder.Encode(hashBytes);

        //    var jwt = $"{headerPart}.{payloadPart}.{hash}";

        //    return jwt;
        //}
    }
}
