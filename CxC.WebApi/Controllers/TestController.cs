using CxC.WebApi.Clases;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Results;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace CxC.WebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class TestController : ApiController
    {
        public HttpResponseMessage Get()
        {
            JToken json = JObject.Parse("{ 'msg' : 'GET: Test message' }");
            return new HttpResponseMessage()
            {
                Content = new JsonContent(json)
            };
        }

        public HttpResponseMessage Post()
        {
            //return new JavaScriptSerializer().Serialize(new { Msg = "POST: Test message" });
            //return new JsonResult()
            //{
            //    Data = new { errMsg = "test" },
            //    JsonRequestBehavior = JsonRequestBehavior.AllowGet
            //};

            JToken json = JObject.Parse("{ 'msg' : 'POST: Test message' }");
            return new HttpResponseMessage()
            {
                Content = new JsonContent(json)
            };
        }

        public HttpResponseMessage Put()
        {
            return new HttpResponseMessage()
            {
                Content = new StringContent("PUT: Test message")
            };
        }
    }
}
