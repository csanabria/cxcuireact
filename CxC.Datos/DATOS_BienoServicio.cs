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
        public List<FCCxCBienoServicio> DATOS_selectAll()
        {
            try
            {
                var resTemo = bd.pr_FCCxCBienoServicio_SeleccionarTodos(new ObjectParameter("iCodError", "0"));
                List<FCCxCBienoServicio> res = new List<FCCxCBienoServicio>();
                foreach (var r in resTemo)
                {
                    FCCxCBienoServicio n = new FCCxCBienoServicio()
                    {
                        IdBoS = r.IdBoS,
                        DscBoS = r.DscBoS,
                        IdAuxiliar = r.IdAuxiliar,
                        IdConcepto = r.IdConcepto,
                        FecCreacion = r.FecCreacion,
                        UsrCreacion = r.UsrCreacion,
                        FecUltModif = r.FecUltModif,
                        UsrUltModif = r.UsrUltModif,
                        Id_SP = r.Id_SP
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

        public FCCxCBienoServicio DATOS_Select(int id)
        {
            try
            {
                var resTemo = bd.pr_FCCxCBienoServicio_SeleccionarUno(id, new ObjectParameter("iCodError", "0"));
                FCCxCBienoServicio res = new FCCxCBienoServicio();
                foreach (var r in resTemo)
                {
                    FCCxCBienoServicio n = new FCCxCBienoServicio()
                    {
                        IdBoS = r.IdBoS,
                        DscBoS = r.DscBoS,
                        IdAuxiliar = r.IdAuxiliar,
                        IdConcepto = r.IdConcepto,
                        FecCreacion = r.FecCreacion,
                        UsrCreacion = r.UsrCreacion,
                        FecUltModif = r.FecUltModif,
                        UsrUltModif = r.UsrUltModif,
                        Id_SP = r.Id_SP
                    };
                }

                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }

        public bool DATOS_insertar(FCCxCBienoServicio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBienoServicio_Insertar( obj.DscBoS,obj.IdAuxiliar ,obj.IdConcepto ,
                        obj.IndTipo, obj.IndFacturar, obj.IndDescuento, obj.IndPagaImpuesto, obj.CodPartidaArancelaria,
                        obj.IdMedida, obj.FecCreacion , obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, obj.Id_SP, new ObjectParameter("iIdBoS", "0"),  new ObjectParameter("iCodError", "0"));
                    if (resultado == 1) { return true; } else { return false; }
            }
                catch (Exception ex)
                {
                    var msgError = ex.Message;
                    return false;
                }
            }
            public bool DATOS_update(FCCxCBienoServicio obj)
            {
                try
                {
                    var resultado = bd.pr_FCCxCBienoServicio_Actualizar((int)obj.IdBoS, obj.DscBoS,obj.IdAuxiliar, obj.IdConcepto,
                        obj.IndTipo, obj.IndFacturar, obj.IndDescuento, obj.IndPagaImpuesto, obj.CodPartidaArancelaria, obj.IdMedida,
                        obj.FecCreacion, obj.UsrCreacion, obj.FecUltModif, obj.UsrUltModif, obj.Id_SP ,  new ObjectParameter("iCodError", "0"));
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
                    var resultado = bd.pr_FCCxCBienoServicio_Eliminar(id, new ObjectParameter("iCodError", "0"));
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
