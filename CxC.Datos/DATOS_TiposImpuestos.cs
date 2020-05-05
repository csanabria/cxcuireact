using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CxC.Datos
{
    class DATOS_TiposImpuestos
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCTipoImpuesto> DATOS_SelectAll()
        {
            try
            {
                var resTemp = bd.pr_FCCxCTipoImpuesto_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                List<FCCxCTipoImpuesto> res = new List<FCCxCTipoImpuesto>();
                foreach (var r in resTemp)
                {
                    FCCxCTipoImpuesto n = new FCCxCTipoImpuesto()
                    {
                        IdTipoImpuesto = r.IdTipoImpuesto,
                        DscImpuesto = r.DscImpuesto,
                        PorImpuesto = r.PorImpuesto,
                        ForCalculo = r.ForCalculo,
                        FecCreacion = r.FecCreacion,
                        UsrCreacion = r.UsrCreacion
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

        public bool DATOS_insertar(FCCxCTipoImpuesto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCTipoImpuesto_Insertar(obj.DscImpuesto, obj.PorImpuesto, 
                        obj.ForCalculo, obj.FecCreacion, obj.UsrCreacion,
                        new ObjectParameter("iIdTipoImpuesto", "0"), 
                        new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCTipoImpuesto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCTipoImpuesto_Actualizar((short)obj.IdTipoImpuesto,
                    obj.DscImpuesto, obj.PorImpuesto,
                    obj.ForCalculo, obj.FecCreacion, obj.UsrCreacion,
                    new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_delete(FCCxCTipoImpuesto obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCTipoImpuesto_Eliminar((short)obj.IdTipoImpuesto, new ObjectParameter("iCodError", "0"));
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
