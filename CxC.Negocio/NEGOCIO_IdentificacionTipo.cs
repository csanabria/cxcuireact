using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_IdentificacionTipo
    {
        public static List<FCCxCIdentificacionTipo> NEGOCIO_SelectAll()
        {
            try
            {
                var res = new DATOS_IdentificacionTipo().DATOS_SelectAll().ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCIdentificacionTipo obj)
        {
            try
            {
                var resultado = new DATOS_IdentificacionTipo().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCIdentificacionTipo obj)
        {
            try
            {
                var resultado = new DATOS_IdentificacionTipo().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCIdentificacionTipo obj)
        {
            try
            {
                var resultado = new DATOS_IdentificacionTipo().DATOS_delete(obj.Id_TipoIdentif);
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
