using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    class DATOS_Estado
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCEstado> DATOS_SelectAll()
        {
            try
            {
                var resTemp = bd.pr_FCCxCEstado_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                List<FCCxCEstado> res = new List<FCCxCEstado>();
                foreach (var r in resTemp)
                {
                    FCCxCEstado n = new FCCxCEstado()
                    {
                        IdEstado = r.IdEstado,
                        DscEstado = r.DscEstado,
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

        public bool DATOS_insertar(FCCxCEstado obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCEstado_Insertar(obj.DscEstado, new ObjectParameter("iIdEstado", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCEstado obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCEstado_Actualizar((int)obj.IdEstado, obj.DscEstado, new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_delete(FCCxCEstado obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCEstado_Eliminar((int)obj.IdEstado, new ObjectParameter("iCodError", "0"));
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
