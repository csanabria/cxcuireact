using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CxC.Datos
{
    class DATOS_TipoCambio
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCTipoCambio> DATOS_SelectAll()
        {
            try
            {
                var resTemp = bd.pr_FCCxCTipoCambio_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                List<FCCxCTipoCambio> res = new List<FCCxCTipoCambio>();
                foreach (var r in resTemp)
                {
                    FCCxCTipoCambio n = new FCCxCTipoCambio()
                    {
                        IdTipoCambio = r.IdTipoCambio,
                        IdMoneda = r.IdMoneda,
                        MonCompra = r.MonCompra,
                        MonVenta = r.MonVenta,
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

        public bool DATOS_insertar(FCCxCTipoCambio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCTipoCambio_Insertar(obj.IdMoneda, obj.MonCompra, 
                                            obj.MonVenta, obj.FecCreacion, obj.UsrCreacion, 
                                            new ObjectParameter("iIdEstado", "0"), 
                                            new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCTipoCambio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCTipoCambio_Actualizar((int)obj.IdTipoCambio, obj.IdMoneda, obj.MonCompra,
                                            obj.MonVenta, obj.FecCreacion, obj.UsrCreacion,
                                            new ObjectParameter("iCodError", "0"));
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
                var resultado = bd.pr_FCCxCTipoCambio_Eliminar(id, new ObjectParameter("iCodError", "0"));
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
