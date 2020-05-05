using CxC.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_Concepto : IDisposable
    {
        public List<FCCxCConcepto> NEGOCIO_SelectAll()
        {
            try
            {
                var resTemo = new DATOS_Concepto().DATOS_SelectAll().ToList();
                List<FCCxCConcepto> res = new List<FCCxCConcepto>();
                foreach (var r in resTemo)
                {
                    FCCxCConcepto n = new FCCxCConcepto()
                    {
                        IdConcepto = r.IdConcepto,
                        DscTipo = r.DscTipo,
                        CodEstado = r.CodEstado,
                        CtaFinancieraDebito = r.CtaFinancieraDebito,
                        CtaFinancieraCredito = r.CtaFinancieraCredito,
                        UsarExpiracion = r.UsarExpiracion,
                        NumDiasExpira = r.NumDiasExpira,
                        EnviaNotificacion = r.EnviaNotificacion
                    };
                    res.Add(n);
                }
                return res;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public FCCxCConcepto NEGOCIO_Select(int id)
        {
            try
            {
                FCCxCConcepto res = null;               //inicialmente es nulo
                var resTemp = new DATOS_Concepto().DATOS_Select(id);
                if (resTemp != null)
                {
                    res = new FCCxCConcepto()           //lo instancia y asigna los valores
                    {
                        IdConcepto = resTemp.IdConcepto,
                        DscTipo = resTemp.DscTipo,
                        CodEstado = resTemp.CodEstado,
                        CtaFinancieraDebito = resTemp.CtaFinancieraDebito,
                        CtaFinancieraCredito = resTemp.CtaFinancieraCredito,
                        UsarExpiracion = resTemp.UsarExpiracion,
                        NumDiasExpira = resTemp.NumDiasExpira,
                        EnviaNotificacion = resTemp.EnviaNotificacion
                    };
                }
                return res;                             //lo retorna, sea nulo o el valor retornado por DAL
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool NEGOCIO_insertar(FCCxCConcepto obj)
        {
            try
            {
                var res = new DATOS_Concepto().DATOS_insertar(obj);
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool NEGOCIO_update(FCCxCConcepto obj)
        {
            try
            {
                var res = new DATOS_Concepto().DATOS_update(obj);
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        public bool NEGOCIO_delete(int id)
        {
            try
            {
                using (var datos = new DATOS_Concepto())
                {
                    var res = datos.DATOS_delete(id);
                    return res;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void Dispose()
        {
            //no requiere cerrar nada pues todo se abre y cierra en cada método
        }
    }
}
