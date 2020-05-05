using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_Concepto : IDisposable
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<FCCxCConcepto> DATOS_SelectAll()
        {
            try
            {
                using (bd = new bdFCCxCEntities())
                {
                    var resTemp1 = bd.pr_FCCxCConcepto_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                    List<FCCxCConcepto> res = new List<FCCxCConcepto>();
                    foreach (var t in resTemp1)
                    {
                        var n = new FCCxCConcepto()
                        {
                            IdConcepto = t.IdConcepto,
                            DscTipo = t.DscTipo
                        };
                        res.Add(n);
                    }
                    return res;
                }
            }
            catch (Exception ex)
            {
                //var msgError = ex.Message;
                throw ex;
            }
            //return null;
        }

        public FCCxCConcepto DATOS_Select(int id)
        {
            try
            {
                FCCxCConcepto res = null;       //inicialmente nulo
                var resTemp1 = bd.pr_FCCxCConcepto_SeleccionarUno(id, new ObjectParameter("iCodError", "0")).ToList();
                if (resTemp1 != null)
                {
                    res = new FCCxCConcepto();  //si lo encontró lo asigna al resultado
                    var n = new FCCxCConcepto()
                    {
                        IdConcepto = resTemp1[0].IdConcepto,
                        DscTipo = resTemp1[0].DscTipo
                    };
                }
                return res;                     //retorna el resultado
            }
            catch (Exception ex)
            {
                //var msgError = ex.Message;
                throw ex;
            }
            //return null;
        }

        public bool DATOS_insertar(FCCxCConcepto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCConcepto_Insertar(obj.DscTipo, obj.CodEstado, obj.CtaFinancieraDebito, obj.CtaFinancieraCredito, obj.UsarExpiracion, 
                    obj.NumDiasExpira , obj.EnviaNotificacion , new ObjectParameter("iIdConcepto", "0"), new ObjectParameter("iCodError", "0"));
                return resultado == 1; //lo mismo que decir: if resultado == 1 { return true } else { return false } 
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCConcepto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCConcepto_Actualizar((int)obj.IdConcepto ,
                    obj.DscTipo, obj.CodEstado, obj.CtaFinancieraDebito, obj.CtaFinancieraCredito, obj.UsarExpiracion,
                    obj.NumDiasExpira, obj.EnviaNotificacion, new ObjectParameter("iCodError", "0"));
                return resultado == 1; //lo mismo que decir: if resultado == 1 { return true } else { return false } 
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(int id)
        {
            try
            {
                var resultado = bd.pr_FCCxCConcepto_Eliminar(id, new ObjectParameter("iCodError", "0"));
                //return true; //¿por que?
                return resultado >= 0; //numero de filas
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }

        public void Dispose()
        {
            //todo ya se abre y cierra en cada método, no requiere liberar nada más
            bd.Dispose();
        }
    }
}
