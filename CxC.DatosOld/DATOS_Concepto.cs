using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_Concepto
    {
        bdFCCxCEntities   bd = new bdFCCxCEntities();
        public List<pr_FCCxCConcepto> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCConcepto> res = bd.pr_FCCxCConcepto_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCConcepto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCConcepto_Insertar(obj.DscTipo, obj.CodEstado, obj.CtaContable,obj.UsarExpiracion , 
                    obj.NumDiasExpira , obj.EnviaNotificacion , new ObjectParameter("iIdConcepto", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCConcepto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCConcepto_Actualizar((int)obj.IdConcepto ,
                    obj.DscTipo, obj.CodEstado, obj.CtaContable, obj.UsarExpiracion,
                    obj.NumDiasExpira, obj.EnviaNotificacion, new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCConcepto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCConcepto_Eliminar((int)obj.IdConcepto , new ObjectParameter("iCodError", "0"));
                return true;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
    }
}
