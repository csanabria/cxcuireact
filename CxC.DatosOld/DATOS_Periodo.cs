using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_Periodo
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<pr_FCCxCPeriodo> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCPeriodo> res = bd.pr_FCCxCPeriodo_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCPeriodo obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCPeriodo_Insertar( obj.IdAuxiliar ,obj.DscPeriodo, obj.FecInicio, obj.FecFinal, new ObjectParameter("iIdPeriodo", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCPeriodo obj)
        {
            try
            {

                var resultado = bd.pr_FCCxCPeriodo_Actualizar((int)obj.IdPeriodo, obj.IdAuxiliar,obj.DscPeriodo, obj.FecInicio, obj.FecFinal, new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCPeriodo obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCPeriodo_Eliminar((int)obj.IdPeriodo , new ObjectParameter("iCodError", "0"));
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
