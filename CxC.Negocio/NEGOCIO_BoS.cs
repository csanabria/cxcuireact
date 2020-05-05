using CxC.Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    //OJO: muy mala práctica, el nombre de la clase debería ser igual al nombre del archivo
    public class NEGOCIO_BienoServicio : IDisposable
    {
        FCCxCBienoServicio BoS = new FCCxCBienoServicio();

        public List<FCCxCBienoServicio> NEGOCIO_SelectAll()
        {
            try
            {
                var resTemp = new DATOS_BienoServicio().DATOS_selectAll();
                /*TODO*/
                List<FCCxCBienoServicio> res = new List<FCCxCBienoServicio>();
                foreach (var r in resTemp)
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

        public FCCxCBienoServicio NEGOCIO_Select(int id)
        {
            try
            {
                var res = new DATOS_BienoServicio().DATOS_Select(id);

                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }

        public bool NEGOCIO_insertar(FCCxCBienoServicio obj)
        {
            try
            {
                var resultado = new DATOS_BienoServicio().DATOS_insertar(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool NEGOCIO_update(FCCxCBienoServicio obj)
        {
            try
            {
                var resultado = new DATOS_BienoServicio().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool NEGOCIO_delete(int id)
        {
            try
            {
                var resultado = new DATOS_BienoServicio().DATOS_delete(id);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }

        public void Dispose()
        {
        }
    }
}
