using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_IdentificacionTipo
    {
            bdFCCxCEntities bd = new bdFCCxCEntities();
            public List<pr_FCCxCIdentificacionTipo> DATOS_SelectAll()
            {
                try
                {
                List<pr_FCCxCIdentificacionTipo> res = bd.pr_FCCxCIdentificacionTipo_SeleccionarTodos((new ObjectParameter("iCodError", "0"))).ToList();
                    return res;
                }

                catch (Exception ex)
                {
                    var msgError = ex.Message;
                }
                return null;
            }
            public bool DATOS_insertar(pr_FCCxCIdentificacionTipo obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCIdentificacionTipo_Insertar( obj.Dsc_TipoIdentif, new ObjectParameter("iId_TipoIdentif", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
                }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }
            }
            public bool DATOS_update(pr_FCCxCIdentificacionTipo obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCIdentificacionTipo_Actualizar((int)obj.Id_TipoIdentif , obj.Dsc_TipoIdentif  , new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }

            }
            public bool DATOS_delete(pr_FCCxCIdentificacionTipo obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCIdentificacionTipo_Eliminar ((int)obj.Id_TipoIdentif , new ObjectParameter("iCodError", "0"));
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
