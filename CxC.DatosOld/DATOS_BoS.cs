using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_BienoServicio
    {
            bdFCCxCEntities bd = new bdFCCxCEntities();
            public List<pr_FCCxCBienoServicio> DATOS_SelectAll()
            {
                try
                {
                    List<pr_FCCxCBienoServicio> res = bd.pr_FCCxCBienoServicio_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                    return res;
                }

                catch (Exception ex)
                {
                    var msgError = ex.Message;
                }
                return null;
            }
            public bool DATOS_insertar(pr_FCCxCBienoServicio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBienoServicio_Insertar( obj.DscBoS,obj.IdAuxiliar ,obj.IdConcepto ,
                        obj.FecCreacion , obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, obj.Id_SP, new ObjectParameter("iIdBoS", "0"),  new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }
            }
            public bool DATOS_update(pr_FCCxCBienoServicio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBienoServicio_Actualizar((int)obj.IdBoS, obj.DscBoS,obj.IdAuxiliar, obj.IdConcepto,
                        obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, obj.Id_SP ,  new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }

            }
            public bool DATOS_delete(pr_FCCxCBienoServicio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBienoServicio_Eliminar((int)obj.IdBoS  , new ObjectParameter("iCodError", "0"));
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
