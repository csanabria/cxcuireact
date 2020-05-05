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
    public class PruebasApiMovimientoCuenta
    {
        /*------------------MovimientoCuenta -----------------*/
        [TestMethod]
        public void MovimientoCuenta_Get_DebeRetornarMismaCantidadCapaDatos()
        {
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_MovimientoCuenta obj = new DATOS_MovimientoCuenta();
            var resCapaDatos = obj.DATOS_SelectAll();

            //registros retornados por el API
            var controller = new MovimientoCuentaController();

            var resApi = controller.Get() as List<FCCxCMovimientoCuenta>;
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
        public void MovimientoCuenta_Get_id_DebeRetonarUnRegistro()
        {
            //throw new NotImplementedException();
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_MovimientoCuenta obj = new DATOS_MovimientoCuenta();
            var resCapaDatos = obj.DATOS_Select(1);

            //registros retornados por el API
            var controller = new MovimientoCuentaController();

            var resApi = controller.Get(1) as FCCxCMovimientoCuenta;
            if (resApi == null && resCapaDatos == null)
            {
                Assert.AreEqual(0, 0, "Ambos son null");
            }
            else
            {
                Assert.IsTrue(resApi.IdMovimiento == resCapaDatos.IdMovimiento, "Retornan valores diferentes");
                Assert.AreNotEqual(resApi, null, "no retornan una fila, retornan null");
            }
        }

        [TestMethod]
        public void MovimientoCuenta_Post_DebeInsertarCorretamente()
        {
            // arrange

            var MovimientoCuentaNuevo = new FCCxCMovimientoCuenta()
            {
                IdCuenta = 27,  //verificar que exista
                Monto = 100,
                FechaRegistroMovimiento = DateTime.Now,
                IdFormaPago = 1,    //indefinida
                IdEstadoPago = 1,   //activo
                IdAuxiliar = 1,     //Auxiliar1
                Dsc_Detalle = "Prueba Unit",
                UsrCreacion = "pruebasunit",
                UsrUltModif = "pruebasunit",
                FecUltModif = DateTime.Now
            };

            var ctrl = new MovimientoCuentaController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(MovimientoCuentaNuevo);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void MovimientoCuenta_Put_DebeModificarCorretamente()
        {
            // arrange

            var MovimientoCuentaModif = new FCCxCMovimientoCuenta()
            {
                IdMovimiento = 1,
                IdCuenta = 5,
                Monto = 2,
                FechaRegistroMovimiento = DateTime.Now,
                IdFormaPago = 1,
                IdEstadoPago = 1,
                IdAuxiliar = 1,
                Dsc_Detalle = "Prueba Unit",
                UsrCreacion = "pruebasunit",
                UsrUltModif = "pruebasunit",
                FecUltModif = DateTime.Now
            };

            var ctrl = new MovimientoCuentaController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el put del controlador Api
            HttpResponseMessage result = ctrl.Put(MovimientoCuentaModif);

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void MovimientoCuenta_Delete_DebeEliminarCorretamente()
        {
            // arrange

            var idBorrar = 18;

            var ctrl = new MovimientoCuentaController();
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
