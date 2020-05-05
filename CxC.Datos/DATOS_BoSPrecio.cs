using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CxC.Datos;

namespace CxC.Datos
{
    public class DATOS_BoSPrecio
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<FCCxCBoSPrecio> SelectAll()
        {
            try
            {
                var resTemo = bd.pr_FCCxCBoSPrecio_SeleccionarTodos(new ObjectParameter("iCodError", "0"));
                List<FCCxCBoSPrecio> res = new List<FCCxCBoSPrecio>();
                foreach (var r in resTemo)
                {
                    FCCxCBoSPrecio n = new FCCxCBoSPrecio()
                    {
                        IdBoSPrecio = r.IdBoSPrecio,
                        IdBoS = r.IdBoS,
                        MonPrecio = r.MonPrecio,
                        MonCosto = r.MonCosto,
                        NumPeriodo = r.NumPeriodo,
                        FecCreacion = r.FecCreacion,
                        UsrCreacion = r.UsrCreacion,
                        FecUltModif = r.FecUltModif,
                        UsrUltModif = r.UsrUltModif,
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
        public bool DATOS_insertar(FCCxCBoSPrecio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCBoSPrecio_Insertar(obj.IdBoS, obj.MonPrecio, obj.MonCosto, obj.NumPeriodo, obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif,
                    new ObjectParameter("iIdBoSPrecio", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCBoSPrecio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCBoSPrecio_Actualizar(obj.IdBoSPrecio, obj.IdBoS, obj.MonPrecio, obj.MonCosto, obj.NumPeriodo, obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, 
                    obj.UsrUltModif, new ObjectParameter("iCodError", "0"));
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
                var resultado = bd.pr_FCCxCBoSPrecio_Eliminar(id, new ObjectParameter("iCodError", "0"));
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

