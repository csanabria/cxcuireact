using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_FormaPago
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<pr_FCCxCFormaPago> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCFormaPago> res = bd.pr_FCCxCFormaPago_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCFormaPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCFormaPago_Insertar(obj.DscFormaPago,obj.CodEstado  , new ObjectParameter("iIdFormaPago", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCFormaPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCFormaPago_Actualizar((int)obj.IdFormaPago , obj.DscFormaPago, obj.CodEstado , new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCFormaPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCFormaPago_Eliminar((int)obj.IdFormaPago , new ObjectParameter("iCodError", "0"));
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
