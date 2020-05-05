using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_Auxiliar
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<pr_FCCxCAuxiliar> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCAuxiliar> res = bd.pr_FCCxCAuxiliar_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCAuxiliar obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCAuxiliar_Insertar(obj.DscAuxiliar,obj.CodEstado  , new ObjectParameter("iIdTipoDeudor", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCAuxiliar obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCAuxiliar_Actualizar((int)obj.IdAuxiliar , obj.DscAuxiliar, obj.CodEstado , new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCAuxiliar obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCAuxiliar_Eliminar((int)obj.IdAuxiliar , new ObjectParameter("iCodError", "0"));
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
