using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_Maestro
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        //public List<pr_FCCxCMaestro> DATOS_SelectAll()
        //{
        //    try
        //    {
        //        //obtener el resultado del procedimiento
        //        var resTemp1 = bd.pr_FCCxCMaestro_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
        //        //TODO: convertir
        //        List<pr_FCCxCMaestro> res = new List<pr_FCCxCMaestro>();
        //        return res;
        //    }

        //    catch (Exception ex)
        //    {
        //        var msgError = ex.Message;
        //    }
        //    return null;
        //}

        //public bool DATOS_insertar(pr_FCCxCMaestro obj)
        //{
        //    try
        //    {
        //        var resultado = bd.pr_FCCxCMaestro_Insertar(obj.IdAuxiliar, obj.IdBoS, obj.Cantidad, obj.TipMovimiento, obj.IdSocio,
        //            obj.FecRegistro, obj.FecInicioMorosidad, obj.FecExpiracion, obj.IdEstado, obj.EstCobro, obj.IdLlaveExterna, obj.IdCuentaAnterior,
        //            obj.IdCuentaAnterior, obj.UsrCreacion, obj.UsrUltModif, new ObjectParameter("iIdCuenta", "0"), new ObjectParameter("iCodError", "0"));

        //        if (resultado == 1) { return true; } else { return false; }
        //    }
        //    catch (Exception ex)
        //    {
        //        var msgError = ex.Message;
        //        return false;
        //    }
        //}
        //public bool DATOS_update(DATOS_Maestro obj)
        //{
        //    try
        //    {
        //        var resultado = bd.DATOS_Maestro_Actualizar((int)obj.IdAuxiliar , obj.DscAuxiliar, obj.CodEstado , new ObjectParameter("iCodError", "0"));
        //        if (resultado == 1) { return true; } else { return false; }
        //    }
        //    catch (Exception ex)
        //    {
        //        var msgError = ex.Message;
        //        return false;
        //    }

        //}
        //public bool DATOS_delete(DATOS_Maestro obj)
        //{
        //    try
        //    {
        //        var resultado = bd.DATOS_Maestro_Eliminar((int)obj.IdAuxiliar , new ObjectParameter("iCodError", "0"));
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        var msgError = ex.Message;
        //        return false;
        //    }

        //}
    }
}
