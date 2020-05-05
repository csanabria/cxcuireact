using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_Socio
    {
        public static List<FCCxCSocio> NEGOCIO_SelectAll()
        {
            try
            {
                var res = new DATOS_Socio().DATOS_SelectAll().ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCSocio obj)
        {
            try
            {
                var resultado = new DATOS_Socio().DATOS_insertar(obj);
                return resultado ;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCSocio obj)
        {
            try
            {
                var resultado = new DATOS_Socio().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCSocio obj)
        {
            try
            {
                var resultado = new DATOS_Socio().DATOS_delete(obj);
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
