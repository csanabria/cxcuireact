using CxC.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_MovimientoCuenta : IDisposable
    {
        public List<FCCxCMovimientoCuenta> NEGOCIO_SelectAll()
        {
            try
            {
                var res = new DATOS_MovimientoCuenta().DATOS_SelectAll().ToList();
                return res;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public FCCxCMovimientoCuenta NEGOCIO_Select(int id)
        {
            try
            {
                FCCxCMovimientoCuenta res = null;               //inicialmente es nulo
                var resTemp = new DATOS_MovimientoCuenta().DATOS_Select(id);
                //if (resTemp != null)
                //{
                res = resTemp;
                return res;                             //lo retorna, sea nulo o el valor retornado por DAL
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool NEGOCIO_insertar(FCCxCMovimientoCuenta obj)
        {
            try
            {
                var resultado = new DATOS_MovimientoCuenta().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool NEGOCIO_update(FCCxCMovimientoCuenta obj)
        {
            try
            {
                var resultado = new DATOS_MovimientoCuenta().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool NEGOCIO_delete(int id)
        {
            try
            {
                var resultado = new DATOS_MovimientoCuenta().DATOS_delete(id);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }

        public void Dispose()
        {
            //no requiere cerrar nada pues todo se abre y cierra en cada método
        }
    }
}
