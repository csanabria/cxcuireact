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

        public List<FCCxCMaestro> DATOS_SelectAll()
        {
            try
            {
                //obtener el resultado del procedimiento
                var resTemp1 = bd.pr_FCCxCMaestro_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                //TODO: convertir
                List<FCCxCMaestro> res = new List<FCCxCMaestro>();
                foreach (var r in resTemp1)
                {
                    FCCxCMaestro n = new FCCxCMaestro()
                    { 
                        IdCuenta = r.IdCuenta,
                        IdAuxiliar = r.IdAuxiliar,
                        IdBoS = r.IdBoS,
                        Cantidad = r.Cantidad,
                        TipMovimiento = r.TipMovimiento,
                        IdSocio = r.IdSocio,
                        FecRegistro = r.FecRegistro,
                        FecInicioMorosidad = r.FecInicioMorosidad,
                        FecExpiracion = r.FecExpiracion,
                        IdEstado = r.IdEstado,
                        
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

        public FCCxCMaestro DATOS_Select(int id)
        {
            try
            {
                FCCxCMaestro res = null;       //inicialmente nulo
                //obtener el resultado del procedimiento
                var resTemp1 = bd.pr_FCCxCMaestro_SeleccionarUno(id, new ObjectParameter("iCodError", "0")).ToList();
                //convertir
                if (resTemp1 != null)
                {
                    FCCxCMaestro nuevo = new FCCxCMaestro()
                    {
                        IdCuenta = resTemp1[0].IdCuenta,
                        IdAuxiliar = resTemp1[0].IdAuxiliar,
                        IdBoS = resTemp1[0].IdBoS,
                        Cantidad = resTemp1[0].Cantidad,
                        TipMovimiento = resTemp1[0].TipMovimiento,
                        IdSocio = resTemp1[0].IdSocio,
                        FecRegistro = resTemp1[0].FecRegistro,
                        FecInicioMorosidad = resTemp1[0].FecInicioMorosidad,
                        FecExpiracion = resTemp1[0].FecExpiracion,
                        IdEstado = resTemp1[0].IdEstado,
                        EstadoCobro = resTemp1[0].EstadoCobro,
                        IdLlaveExterna = resTemp1[0].IdLlaveExterna,
                        DscCargo = resTemp1[0].DscCargo,
                        IdCuentaAnterior = resTemp1[0].IdCuentaAnterior,
                        UsrCreacion = resTemp1[0].UsrCreacion,
                        UsrUltModif = resTemp1[0].UsrUltModif
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

        public bool DATOS_insertar(FCCxCMaestro obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCMaestro_Insertar(obj.IdAuxiliar, obj.IdBoS, obj.Cantidad, obj.TipMovimiento, obj.IdSocio,
                    obj.FecRegistro, obj.FecInicioMorosidad, obj.FecExpiracion, obj.IdEstado, obj.EstadoCobro, obj.IdLlaveExterna, obj.DscCargo,
                    obj.IdCuentaAnterior, obj.UsrCreacion, obj.UsrUltModif, new ObjectParameter("iIdCuenta", "0"), new ObjectParameter("iCodError", "0"));

                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCMaestro obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCMaestro_Actualizar((int)obj.IdAuxiliar, obj.IdAuxiliar, obj.IdBoS, obj.Cantidad,obj.TipMovimiento,
                    obj.IdSocio, obj.FecRegistro, obj.FecInicioMorosidad, obj.FecExpiracion, obj.IdEstado, obj.EstadoCobro, obj.IdLlaveExterna, 
                    obj.DscCargo, obj.IdCuentaAnterior, obj.UsrCreacion, obj.UsrUltModif, new ObjectParameter("iCodError", "0"));
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
                var resultado = bd.pr_FCCxCMaestro_Eliminar(id, new ObjectParameter("iCodError", "0"));
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
