using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_Periodo
    {
        public static List<FCCxCPeriodo> NEGOCIO_SelectAll()
        {
            try
            {
                var res = new DATOS_Periodo().DATOS_SelectAll().ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCPeriodo obj)
        {
            try
            {
                var resultado = new DATOS_Periodo().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCPeriodo obj)
        {
            try
            {
                var resultado = new DATOS_Periodo().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCPeriodo obj)
        {
            try
            {
                var resultado = new DATOS_Periodo().DATOS_delete(obj.IdPeriodo);
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
