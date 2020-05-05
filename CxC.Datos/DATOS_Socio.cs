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
        public List<FCCxCSocio> DATOS_SelectAll()
        {
            try
            {
                var resTemp1 = bd.pr_FCCxCSocio_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                //TODO
                List<FCCxCSocio> res = new List<FCCxCSocio>();
                foreach (var r in resTemp1)
                {
                    FCCxCSocio n = new FCCxCSocio()
                    {
                        Id_Socio = r.Id_Socio,
                        Num_Identificacion = r.Num_Identificacion,
                        Id_TipoIdentif = r.Id_TipoIdentif,
                        Num_Identificacion2 = r.Num_Identificacion2,
                        Dsc_NombreSocio = r.Dsc_NombreSocio,
                        Dsc_NombreSocio2 = r.Dsc_NombreSocio2,
                        Id_TipoSocio = r.Id_TipoSocio,
                        Email_Socio = r.Email_Socio,
                        num_CelularSocio = r.num_CelularSocio,
                        num_TelefonoSocio = r.num_TelefonoSocio,
                        Dsc_Info1Socio = r.Dsc_Info1Socio,
                        Dsc_Info2Socio = r.Dsc_Info2Socio,
                        Fec_Creacion = r.Fec_Creacion,
                        Usr_Creacion = r.Usr_Creacion,
                        Fec_UltModif = r.Fec_UltModif,
                        Usr_UltModif = r.Usr_UltModif
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
        public bool DATOS_insertar(FCCxCSocio obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCSocio_Insertar(obj.Num_Identificacion,obj.Id_TipoIdentif, 
                    obj.Num_Identificacion2,obj.Dsc_NombreSocio,obj.Dsc_NombreSocio2,obj.Id_TipoSocio,
                    obj.Email_Socio,obj.num_CelularSocio,obj.num_TelefonoSocio,obj.Dsc_Info1Socio,
                    obj.Dsc_Info2Socio,obj.Fec_Creacion,obj.Usr_Creacion,obj.Fec_UltModif,
                    obj.Usr_UltModif, new ObjectParameter("iId_Socio", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCSocio obj)
        {
            try
            {
                
                var resultado = bd.pr_FCCxCSocio_Actualizar((int)obj.Id_Socio,
                    obj.Num_Identificacion, obj.Id_TipoIdentif,
                    obj.Num_Identificacion2, obj.Dsc_NombreSocio, obj.Dsc_NombreSocio2, obj.Id_TipoSocio,
                    obj.Email_Socio, obj.num_CelularSocio, obj.num_TelefonoSocio, obj.Dsc_Info1Socio,
                    obj.Dsc_Info2Socio, obj.Fec_Creacion, obj.Usr_Creacion, obj.Fec_UltModif,
                    obj.Usr_UltModif,  new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(FCCxCSocio obj)
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
