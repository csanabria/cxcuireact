using CxC.Datos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CxC.Datos
{
    class DATOS_ActiEconomica
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCActiEconomica> DATOS_SelectAll()
        {
            try
            {
                var resTemp = bd.pr_FCCxCActiEconomica_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                List<FCCxCActiEconomica> res = new List<FCCxCActiEconomica>();
                foreach (var r in resTemp)
                {
                    FCCxCActiEconomica n = new FCCxCActiEconomica()
                    {
                        IdActiEconomica = r.IdActiEconomica,
                        CodMdH = r.CodMdH,
                        DscActividad = r.DscActividad,
                        IndDevuelveIVA = r.IndDevuelveIVA,
                        IndActiPrincipal = r.IndActiPrincipal,
                        IdImporteIVA = r.IdImporteIVA,
                        FecCreacion = r.FecCreacion,
                        UsrCreacion = r.UsrCreacion,
                        FecUltModif = r.FecUltModif,
                        UsrUltModif = r.UsrUltModif
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

        public bool DATOS_insertar(FCCxCActiEconomica obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCActiEconomica_Insertar(obj.CodMdH, obj.DscActividad, obj.IndDevuelveIVA, obj.IndActiPrincipal, obj.IdImporteIVA, obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, new ObjectParameter("iIdActiEconomica", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCActiEconomica obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCActiEconomica_Actualizar((int)obj.IdActiEconomica, obj.CodMdH, obj.DscActividad, obj.IndDevuelveIVA, obj.IndActiPrincipal, obj.IdImporteIVA, obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_delete(int id)
        {
            try
            {
                var resultado = bd.pr_FCCxCActiEconomica_Eliminar(id, new ObjectParameter("iCodError", "0"));
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
