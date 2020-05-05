using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_EstadoPago
    {
        public static List<FCCxCEstadoPago> NEGOCIO_SelectAll()
        {
            try
            {
                var resTemp = new DATOS_EstadoPago().DATOS_SelectAll().ToList();
                List<FCCxCEstadoPago> res = new List<FCCxCEstadoPago>();
                foreach(var r in resTemp)
                {
                    FCCxCEstadoPago n = new FCCxCEstadoPago()
                    {
                        IdEstadoPago = r.IdEstadoPago,
                        DscEstadoPago = r.DscEstadoPago
                    };
                }
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCEstadoPago obj)
        {
            try
            {
                var resultado = new DATOS_EstadoPago().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCEstadoPago obj)
        {
            try
            {
                var resultado = new DATOS_EstadoPago().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCEstadoPago obj)
        {
            try
            {
                var resultado = new DATOS_EstadoPago().DATOS_delete(obj.IdEstadoPago);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
    }
}
