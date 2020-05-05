using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_FormaPago
    {
        public static List<FCCxCFormaPago> NEGOCIO_SelectAll()
        {
            try
            {
                var resTemp = new DATOS_FormaPago().DATOS_SelectAll().ToList();
                List<FCCxCFormaPago> res = new List<FCCxCFormaPago>();
                foreach (var r in resTemp)
                {
                    FCCxCFormaPago n = new FCCxCFormaPago()
                    {
                        IdFormaPago = r.IdFormaPago,
                        DscFormaPago = r.DscFormaPago,
                        CodEstado = r.CodEstado
                    };
                    res.Add(n);
                }
                
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public static bool NEGOCIO_insertar(FCCxCFormaPago obj)
        {
            try
            {
                var resultado = new DATOS_FormaPago().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public static bool NEGOCIO_update(FCCxCFormaPago obj)
        {
            try
            {
                var resultado = new DATOS_FormaPago().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public static bool NEGOCIO_delete(FCCxCFormaPago obj)
        {
            try
            {
                var resultado = new DATOS_FormaPago().DATOS_delete(obj);
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
