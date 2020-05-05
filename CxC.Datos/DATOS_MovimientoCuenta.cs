using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CxC.Datos
{
    public class DATOS_MovimientoCuenta
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCMovimientoCuenta> DATOS_SelectAll()
        {
            try
            {
                //obtener el resultado del procedimiento
                var resTemp1 = bd.pr_FCCxCMovimientoCuenta_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                //TODO: convertir
                List<FCCxCMovimientoCuenta> res = new List<FCCxCMovimientoCuenta>();
                foreach (var r in resTemp1)
                {
                    FCCxCMovimientoCuenta n = new FCCxCMovimientoCuenta()
                    {
                        IdMovimiento = r.IdMovimiento,
                        IdCuenta = r.IdCuenta,
                        Monto = r.Monto,
                        FechaRegistroMovimiento = r.FechaRegistroMovimiento,
                        IdFormaPago = r.IdFormaPago,
                        IdEstadoPago = r.IdEstadoPago,
                        Num_Documento = r.Num_Documento,
                        IdAuxiliar = r.IdAuxiliar,
                        Dsc_Detalle = r.Dsc_Detalle,
                        UsrCreacion = r.UsrCreacion,
                        UsrUltModif = r.UsrUltModif,
                        FecUltModif = r.FecUltModif
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

        public FCCxCMovimientoCuenta DATOS_Select(int id)
        {
            try
            {
                FCCxCMovimientoCuenta res = null;       //inicialmente nulo
                //obtener el resultado del procedimiento
                var resTemp1 = bd.pr_FCCxCMovimientoCuenta_SeleccionarUno(id, new ObjectParameter("iCodError", "0")).ToList();
                //convertir
                if (resTemp1 != null)
                {
                    FCCxCMovimientoCuenta nuevo = new FCCxCMovimientoCuenta()
                    {
                        IdMovimiento = resTemp1[0].IdMovimiento,
                        IdCuenta = resTemp1[0].IdCuenta,
                        Monto = resTemp1[0].Monto,
                        FechaRegistroMovimiento = resTemp1[0].FechaRegistroMovimiento,
                        IdFormaPago = resTemp1[0].IdFormaPago,
                        IdEstadoPago = resTemp1[0].IdEstadoPago,
                        Num_Documento = resTemp1[0].Num_Documento,
                        IdAuxiliar = resTemp1[0].IdAuxiliar,
                        Dsc_Detalle = resTemp1[0].Dsc_Detalle,
                        UsrCreacion = resTemp1[0].UsrCreacion,
                        UsrUltModif = resTemp1[0].UsrUltModif,
                        FecUltModif = resTemp1[0].FecUltModif
                    };
                    res = nuevo;
                }
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }

        public bool DATOS_insertar(FCCxCMovimientoCuenta obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCMovimientoCuenta_Insertar(obj.IdCuenta, obj.Monto, obj.FechaRegistroMovimiento, obj.IdFormaPago, obj.IdEstadoPago, 
                    obj.Num_Documento, obj.IdAuxiliar, obj.Dsc_Detalle, obj.UsrCreacion, obj.UsrUltModif, obj.FecUltModif, 
                    new ObjectParameter("iIdMovimiento", "0"), new ObjectParameter("iCodError", "0"));

                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCMovimientoCuenta obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCMovimientoCuenta_Actualizar(obj.IdMovimiento, obj.IdCuenta, obj.Monto, obj.FechaRegistroMovimiento, obj.IdFormaPago, obj.IdEstadoPago,
                    obj.Num_Documento, obj.IdAuxiliar, obj.Dsc_Detalle, obj.UsrCreacion, obj.UsrUltModif, obj.FecUltModif,
                    new ObjectParameter("iCodError", "0"));
                if (resultado >= 0) { return true; } else { return false; }
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
                var resultado = bd.pr_FCCxCMovimientoCuenta_Eliminar(id, new ObjectParameter("iCodError", "0"));
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
