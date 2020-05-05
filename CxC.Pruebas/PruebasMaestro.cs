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
    public class PruebasMaestro
    {
        /*------------------ Mestro -----------------*/
        [TestMethod]
        public void Maestro_Get_DebeRetornarMismaCantidadCapaDatos()
        {
            //registros retornados por la capa de datos
            CxC.Datos.DATOS_Maestro obj = new DATOS_Maestro();
            var resCapaDatos = obj.DATOS_SelectAll();

            //registros retornados por el API
            var controller = new MaestroController();

            var resApi = controller.Get() as List<FCCxCMaestro>;
            if (resApi == null && resCapaDatos == null)
            {
                Assert.AreEqual(0, 0, "Ambos son null");
            }
            else
            {
                Assert.AreEqual(resCapaDatos.Count, resApi.Count, "Cantidad NO es igual en ambos");
            }
        }

        [TestMethod]
        public void Maestro_Get_id_DebeRetonarUnRegistro()
        {
            //registros retornados por el API
            var controller = new MaestroController();

            var resApi = controller.Get(27) as FCCxCMaestro;
            Assert.AreNotEqual(resApi, null, "No retorna nada");
        }

        [TestMethod]
        public void Maestro_Post_DebeInsertarCorretamente()
        {
            // arrange

            var maestroNuevo = new FCCxCMaestro()
            {
                //datos requeridos
                IdAuxiliar = 1,
                IdBoS = 1,
                TipMovimiento = "C", //Indica si es por cantidad o por monto
                FecRegistro = DateTime.Now,
                FecInicioMorosidad = DateTime.Now.AddDays(1),
                IdEstado = 1,
                EstadoCobro = "P",  //P pendiente, C cancelado, CO contabilizado, EX exonerado
                UsrCreacion = "pruebasUnit"

            };

            var ctrl = new MaestroController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Post(maestroNuevo);

            // assert
            Assert.AreNotEqual(result.StatusCode, System.Net.HttpStatusCode.InternalServerError, "Error en la inserción"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void Maestro_Delete_DebeEliminarCorretamente()
        {
            // arrange

            var idBorrar = 35;

            var ctrl = new MaestroController();
            ctrl.Request = new HttpRequestMessage();
            ctrl.Configuration = new HttpConfiguration();

            // act

            //invocar el post del controlador Api
            HttpResponseMessage result = ctrl.Delete(idBorrar);

            // assert
            Assert.AreEqual(result.StatusCode, System.Net.HttpStatusCode.OK, "Error en el borrado"); //TODO: validar que sea OK
        }

        [TestMethod]
        public void Maestro_Delete_Debe_FUNCIONAR_IdInvalido()
        {
            // arrange

            var idBorrar = 144;  //revisar en BD que no exista el registro

            var ctrl = new MaestroController();
            //se inicializan pues dentro del controlador se usan
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
