using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_StoreProc
    {
        bdFCCxCEntities   bd = new bdFCCxCEntities();
        public List<pr_FCCxCStoreProc> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCStoreProc> res = bd.pr_FCCxCStoreProc_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCStoreProc obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCStoreProc_Insertar(obj.Nom_SP ,obj.Dsc_SP , new ObjectParameter("iId_SP", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCStoreProc obj)
        {
            try
            {
                
                var resultado = bd.pr_FCCxCStoreProc_Actualizar((int)obj.Id_SP , obj.Nom_SP, obj.Dsc_SP, new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCStoreProc obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCStoreProc_Eliminar((int)obj.Id_SP    , new ObjectParameter("iCodError", "0"));
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
