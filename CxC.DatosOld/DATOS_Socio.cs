using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_Socio
    {
        bdFCCxCEntities   bd = new bdFCCxCEntities();
        public List<pr_FCCxCSocio> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCSocio> res = bd.pr_FCCxCSocio_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCSocio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCSocio_Insertar(obj.Num_Identificacion,obj.Id_TipoIdentif, 
                    obj.Num_Identificacion2,obj.Dsc_NombreSocio,obj.Dsc_NombreSocio2,obj.Id_TipoSocio,
                    obj.Email_Socio,obj.num_CelularSocio,obj.num_TelefonoSocio,obj.Dsc_Info1Socio,
                    obj.Dsc_Info2Socio,obj.Fec_Creacion,obj.Usr_Creo,obj.Fec_UltModif,
                    obj.Usr_UltModif, new ObjectParameter("iId_Socio", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCSocio obj)
        {
            try
            {
                
                var resultado = bd.pr_FCCxCSocio_Actualizar((int)obj.Id_Socio,
                    obj.Num_Identificacion, obj.Id_TipoIdentif,
                    obj.Num_Identificacion2, obj.Dsc_NombreSocio, obj.Dsc_NombreSocio2, obj.Id_TipoSocio,
                    obj.Email_Socio, obj.num_CelularSocio, obj.num_TelefonoSocio, obj.Dsc_Info1Socio,
                    obj.Dsc_Info2Socio, obj.Fec_Creacion, obj.Usr_Creo, obj.Fec_UltModif,
                    obj.Usr_UltModif,  new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCSocio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCSocio_Eliminar((int)obj.Id_Socio, new ObjectParameter("iCodError", "0"));
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
