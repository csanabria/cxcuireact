using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_BoSPrecio
    {
        FCCxCBoSPrecio BoSPrecio = new FCCxCBoSPrecio();

        public static List<FCCxCBoSPrecio> NEGOCIO_SelectAll()
        {
            try
            {
                var res = new CxC.Datos.DATOS_BoSPrecio().SelectAll().ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCBoSPrecio obj)
        {
            try
            {
                var resultado = new DATOS_BoSPrecio().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCBoSPrecio obj)
        {
            try
            {
                var resultado = new DATOS_BoSPrecio().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCBoSPrecio obj)
        {
            try
            {
                var resultado = new DATOS_BoSPrecio().DATOS_delete(obj.IdBoSPrecio);
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
