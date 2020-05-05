using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_SocioTipo
    {
            bdFCCxCEntities bd = new bdFCCxCEntities();
            public List<pr_FCCxCSocioTipo> DATOS_SelectAll()
            {
                try
                {
                    List<pr_FCCxCSocioTipo> res = bd.pr_FCCxCSocioTipo_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                    return res;
                }

                catch (Exception ex)
                {
                    var msgError = ex.Message;
                }
                return null;
            }
            public bool DATOS_insertar(pr_FCCxCSocioTipo obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCSocioTipo_Insertar( obj.DscTipoDeudor, new ObjectParameter("iIdTipoDeudor", "0"), new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }
            }
            public bool DATOS_update(pr_FCCxCSocioTipo obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCSocioTipo_Actualizar((int)obj.IdTipoDeudor, obj.DscTipoDeudor , new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }

            }
            public bool DATOS_delete(pr_FCCxCSocioTipo obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCSocioTipo_Eliminar((int)obj.IdTipoDeudor, new ObjectParameter("iCodError", "0"));
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
