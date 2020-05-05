using CxC.Datos;
using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Negocio
{
    public class NEGOCIO_StoreProc
    {
        public List<FCCxCStoreProc> NEGOCIO_SelectAll()
        {
            try
            {
                var resTemp = new DATOS_StoreProc().DATOS_SelectAll().ToList();
                List<FCCxCStoreProc> res = new List<FCCxCStoreProc>();
                foreach (var r in resTemp)
                {
                    FCCxCStoreProc n = new FCCxCStoreProc()
                    {
                        Id_SP = r.Id_SP,
                        Nom_SP = r.Nom_SP,
                        Dsc_SP = r.Dsc_SP
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
        public bool NEGOCIO_insertar(FCCxCStoreProc obj)
        {
            try
            {
                var resultado = new DATOS_StoreProc().DATOS_insertar(obj);
                return resultado ;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool NEGOCIO_update(FCCxCStoreProc obj)
        {
            try
            {
                var resultado = new DATOS_StoreProc().DATOS_update(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool NEGOCIO_delete(FCCxCStoreProc obj)
        {
            try
            {
                var resultado = new DATOS_StoreProc().DATOS_delete(obj);
                return resultado;
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
    }
}
