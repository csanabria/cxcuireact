using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CxC.Datos;
using CxC.WebApi.Controllers;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http;



namespace CxC.Pruebas
{
    [TestClass]
    public class PruebasConcepto
    {
        /*------------------Concepto -----------------*/
        [TestMethod]
        public void Concepto_Get_DebeRetornarMismaCantidadCapaDatos()
        {
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_Concepto obj = new DATOS_Concepto();
            var resCapaDatos = obj.DATOS_SelectAll();

            //registros retornados por el API
            var controller = new ConceptoController();

            var resApi = controller.Get() as List<FCCxCConcepto>;
            if (resApi == null && resCapaDatos == null)
            {
                Assert.AreEqual(0, 0, "Ambos son null");
            }
            else
            {
                Assert.AreEqual(resCapaDatos.Count, resApi.Count, "Cantidad es igual en ambos");
            }
        }

        [TestMethod]
        public void Concepto_Get_id_DebeRetonarUnRegistro()
        {
            //throw new NotImplementedException();
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_Concepto obj = new DATOS_Concepto();
            var resCapaDatos = obj.DATOS_Select(1);

            //registros retornados por el API
            var controller = new ConceptoController();

            var resApi = controller.Get(1) as FCCxCConcepto;
            if (resApi == null && resCapaDatos == null)
            {
                Assert.AreEqual(0, 0, "Ambos son null");
            }
            else
            {
                Assert.IsTrue(resApi.IdConcepto == resCapaDatos.IdConcepto, "Retornan valores diferentes");
                Assert.AreNotEqual(resApi, null, "no retornan una fila, retornan null");
            }
        }

        [TestMethod]
        public void Concepto_Post_DebeInsertarCorretamente()
        {
            // arrange

            var conceptoNuevo = new FCCxCConcepto()
            {
                DscTipo = "Nuevo concepto csanabria",
                CodEstado = "A",
                CtaFinancieraDebito = "1",
                UsarExpiracion = "N",
                NumDiasExpira = 0,
                EnviaNotificacion = "N"
            };

            var ctrl = new ConceptoController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(conceptoNuevo);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void Concepto_Put_DebeModificarCorretamente()
        {
            // arrange

            var conceptoModif = new FCCxCConcepto()
            {
                IdConcepto = 20,
                DscTipo = "Modif " + DateTime.Now.ToShortTimeString(),
                CodEstado = "A",
                CtaFinancieraDebito = "1",
                UsarExpiracion = "N",
                NumDiasExpira = 0,
                EnviaNotificacion = "N"
            };

            var ctrl = new ConceptoController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el put del controlador Api
            HttpResponseMessage result = ctrl.Put(conceptoModif);

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void Concepto_Delete_DebeEliminarCorretamente()
        {
            // arrange

            var idBorrar = 18;

            var ctrl = new ConceptoController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Delete(idBorrar);

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

    }
}
