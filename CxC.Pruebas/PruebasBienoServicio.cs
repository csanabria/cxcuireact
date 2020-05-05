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
    public class PruebasBienoServicio
    {
        /*------------------ BienoServicio -----------------*/
        [TestMethod]
        public void BienoServicio_Get_DebeRetornarMismaCantidadCapaDatos()
        {
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_BienoServicio obj = new DATOS_BienoServicio();
            var resCapaDatos = obj.DATOS_selectAll();

            //registros retornados por el API
            var controller = new BienoServicioController();

            var resApi = controller.Get() as List<FCCxCBienoServicio>;
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
        public void BienoServicio_Get_id_DebeRetonarUnRegistro()
        {
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_BienoServicio obj = new DATOS_BienoServicio();
            var resCapaDatos = obj.DATOS_Select(1);

            //registros retornados por el API
            var controller = new BienoServicioController();

            var resApi = controller.Get(1) as FCCxCBienoServicio;
            if (resApi == null && resCapaDatos == null)
            {
                Assert.AreEqual(0, 0, "Ambos son null");
            }
            else
            {
                Assert.IsTrue(resApi.IdBoS == resCapaDatos.IdAuxiliar, "Retornan valores diferentes");
                Assert.AreNotEqual(resApi, null, "no retornan una fila, retornan null");
            }
        }

        [TestMethod]
        public void BienoServicio_Post_DebeInsertarCorretamente()
        {
            // arrange

            var bienoServicioNuevo = new FCCxCBienoServicio()
            {
                DscBoS = "Nuevo bien o servicio csanabria",
                IdAuxiliar = 1,
                IdConcepto = 1,
                FecCreacion = DateTime.Now,
                UsrCreacion = "pruebaUnit",
                FecUltModif = DateTime.Now,
                UsrUltModif = "pruebaunit"
            };

            var ctrl = new BienoServicioController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(bienoServicioNuevo);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void BienoServicio_Post_Debe_FALLAR_IdAuxiliarInvalido()
        {
            // arrange

            var bienoServicioNuevo = new FCCxCBienoServicio()
            {
                DscBoS = "Nuevo bien o servicio csanabria",
                IdAuxiliar = 100,   //verificar que el registro no exista en FCCxCAuxiliar
                IdConcepto = 1,
                FecCreacion = DateTime.Now,
                UsrCreacion = "pruebaUnit",
                FecUltModif = DateTime.Now,
                UsrUltModif = "pruebaunit"
            };

            var ctrl = new BienoServicioController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(bienoServicioNuevo);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert, debe retornar internal server error
            Assert.AreEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Debía retornar internal server error y no lo hizo"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void BienoServicio_Post_Debe_FALLAR_IdConceptoInvalido()
        {
            // arrange

            var bienoServicioNuevo = new FCCxCBienoServicio()
            {
                DscBoS = "Nuevo bien o servicio csanabria",
                IdAuxiliar = 1,   //verificar que el registro no exista en FCCxCAuxiliar
                IdConcepto = 100,
                FecCreacion = DateTime.Now,
                UsrCreacion = "pruebaUnit",
                FecUltModif = DateTime.Now,
                UsrUltModif = "pruebaunit"
            };

            var ctrl = new BienoServicioController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(bienoServicioNuevo);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert, debe retornar internal server error
            Assert.AreEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Debía retornar internal server error y no lo hizo"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void BienoServicio_Put_DebeModificarCorretamente()
        {
            // arrange

            var bienoServicioModif = new FCCxCBienoServicio()
            {
                IdBoS = 1,
                DscBoS = "Modif prueba unit" + DateTime.Now.ToShortTimeString(),
                IdAuxiliar = 1,
                IdConcepto = 1,
                FecCreacion = DateTime.Now,
                UsrCreacion = "pruebaUnit",
                FecUltModif = DateTime.Now,
                UsrUltModif = "pruebaunit"
            };

            var ctrl = new BienoServicioController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Put(bienoServicioModif);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void BienoServicio_Delete_DebeEliminarCorretamente()
        {
            // arrange

            var idBorrar = 9;

            var ctrl = new BienoServicioController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Delete(idBorrar);

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void BienoServicio_Delete_Debe_FUNCIONAR_IdInvalido()
        {
            // arrange

            var idBorrar = 99;  //revisar en BD que no exista el registro

            var ctrl = new BienoServicioController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Delete(idBorrar);

            // assert
            Assert.AreEqual(result.StatusCode, System.Net.HttpStatusCode.OK, "Esta fallando y debe funcionar bien"); //TODO: validar que sea OK
        }

    } //class
} //namespace
