using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CxC.Datos
{
    class DATOS_ImporteIVA
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCImporteIVA> DATOS_SelectAll()
        {
            try
            {
                var resTemp = bd.pr_FCCxCImporteIVA_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                List<FCCxCImporteIVA> res = new List<FCCxCImporteIVA>();
                foreach (var r in resTemp)
                {
                    FCCxCImporteIVA n = new FCCxCImporteIVA()
                    {
                        IdImporteIVA = r.IdImporteIVA,
                        PorTarifa = r.PorTarifa,
                        DscTarifaria = r.DscTarifaria,
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

        public bool DATOS_insertar(FCCxCImporteIVA obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCImporteIVA_Insertar(obj.DscTarifaria, obj.PorTarifa, new ObjectParameter("iIdTarifa", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        //public bool DATOS_update(FCCxCImporteIVA obj)
        //{
        //    try
        //    {
        //        var resultado = bd.pr_FCCxCImporteIVA_Actualizar((int)obj.IdTarifa, obj.DscTarifaria, obj.PorTarifa, new ObjectParameter("iCodError", "0"));
        //        if (resultado == 1) { return true; } else { return false; }
        //    }
        //    catch (Exception ex)
        //    {
        //        var msgError = ex.Message;
        //        return false;
        //    }
        //}
        //public bool DATOS_delete(FCCxCImporteIVA obj)
        //{
        //    try
        //    {
        //        var resultado = bd.pr_FCCxCImporteIVA_Eliminar((int)obj.IdTarifa, new ObjectParameter("iCodError", "0"));
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
