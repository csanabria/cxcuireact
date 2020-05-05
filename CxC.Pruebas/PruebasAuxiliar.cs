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
    public class PruebasAuxiliar
    {

        /*------------------ Auxiliar -----------------*/
        [TestMethod]
        public void Auxiliar_Get_DebeRetornarMismaCantidadCapaDatos()
        {
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_Auxiliar obj = new DATOS_Auxiliar();
            var resCapaDatos = obj.DATOS_SelectAll();

            //registros retornados por el API
            var controller = new AuxiliarController();

            var resApi = controller.Get() as List<FCCxCAuxiliar>;
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
        public void Auxiliar_Get_id_DebeRetonarUnRegistro()
        {
            //throw new NotImplementedException();
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_Auxiliar obj = new DATOS_Auxiliar();
            var resCapaDatos = obj.DATOS_Select(1);

            //registros retornados por el API
            var controller = new AuxiliarController();

            var resApi = controller.Get(1) as FCCxCAuxiliar;
            if (resApi == null && resCapaDatos == null)
            {
                Assert.AreEqual(0, 0, "Ambos son null");
            }
            else
            {
                Assert.IsTrue(resApi.IdAuxiliar == resCapaDatos.IdAuxiliar, "Retornan valores diferentes");
                Assert.AreNotEqual(resApi, null, "no retornan una fila, retornan null");
            }
        }

        [TestMethod]
        public void Auxiliar_Post_DebeInsertarCorretamente()
        {
            // arrange

            var auxiliarNuevo = new FCCxCAuxiliar()
            {
                DscAuxiliar = "Nuevo auxiliar csanabria",
                CodEstado = "?"
            };

            var ctrl = new AuxiliarController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(auxiliarNuevo);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void Auxiliar_Put_DebeModificarCorretamente()
        {
            // arrange

            var auxiliarModif = new FCCxCAuxiliar()
            {
                IdAuxiliar = 16,
                DscAuxiliar = "Modif " + DateTime.Now.ToShortTimeString(),
                CodEstado = "A"
            };

            var ctrl = new AuxiliarController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Put(auxiliarModif);

            //notas: 1. reporte de errores es pobre, negocios y datos solo retornan false si hubo error
            //en el api detecto error y genero un mensaje de tipo InternalServerError, pero no tengo más detalles, 
            //no hay excepciones en las capas de datos y negocios, tuve que depurar para ver que era null exception
            //2. idealmente por buen diseño el api debería devolver un StatusCode.OK con el Id del nuevo registro creado, pero
            //la implementación de las capas no lo permiten

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void Auxiliar_Delete_DebeEliminarCorretamente()
        {
            //temporalmente comentado 21/4/2020 ya funciona
            Assert.AreEqual(0, 0, "fallo");
            return;
            //la línea anterior evita el borrado constante de registros
            // arrange

            var idBorrar = 12;

            var ctrl = new AuxiliarController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Delete(idBorrar);

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }
    } //class
} //namespace
