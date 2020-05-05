using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_SocioTipo
    {
        public static List<FCCxCSocioTipo> NEGOCIO_SelectAll()
        {
            try
            {
                var res = new DATOS_SocioTipo().DATOS_SelectAll().ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCSocioTipo obj)
        {
            try
            {
                var resultado = new DATOS_SocioTipo().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCSocioTipo obj)
        {
            try
            {
                var resultado = new DATOS_SocioTipo().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCSocioTipo obj)
        {
            try
            {
                var resultado = new DATOS_SocioTipo().DATOS_delete(obj.IdTipoDeudor);
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
