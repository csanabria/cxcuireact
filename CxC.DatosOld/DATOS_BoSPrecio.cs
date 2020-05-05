using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_BoSPrecio
    {
            bdFCCxCEntities bd = new bdFCCxCEntities();
            public List<pr_FCCxCBoSPrecio> DATOS_SelectAll()
            {
                try
                {
                    List<pr_FCCxCBoSPrecio> res = bd.pr_FCCxCBoSPrecio_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                    return res;
                }

                catch (Exception ex)
                {
                    var msgError = ex.Message;
                }
                return null;
            }
            public bool DATOS_insertar(pr_FCCxCBoSPrecio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBoSPrecio_Insertar( obj.IdBoS,obj.MonPrecio,obj.MonCosto,
                        obj.NumPeriodo,obj.FecCreacion , obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, new ObjectParameter("iIdBoSPrecio", "0"), new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }
            }
            public bool DATOS_update(pr_FCCxCBoSPrecio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBoSPrecio_Actualizar((int)obj.IdBoSPrecio , obj.IdBoS, obj.MonPrecio, obj.MonCosto,
                        obj.NumPeriodo, obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }

            }
            public bool DATOS_delete(pr_FCCxCBoSPrecio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBoSPrecio_Eliminar((int)obj.IdBoSPrecio , new ObjectParameter("iCodError", "0"));
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
