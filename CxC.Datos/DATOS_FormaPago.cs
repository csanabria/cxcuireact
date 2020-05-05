using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CxC.Datos
{
    public class DATOS_FormaPago
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<FCCxCFormaPago> DATOS_SelectAll()
        {
            try
            {
                var resTemp1 = bd.pr_FCCxCFormaPago_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                //TODO
                List<FCCxCFormaPago> res = new List<FCCxCFormaPago>();
                foreach (var r in resTemp1)
                {
                    FCCxCFormaPago n = new FCCxCFormaPago()
                    {

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
        public bool DATOS_insertar(FCCxCFormaPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCFormaPago_Insertar(obj.DscFormaPago,obj.CodEstado  , new ObjectParameter("iIdFormaPago", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCFormaPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCFormaPago_Actualizar((int)obj.IdFormaPago , obj.DscFormaPago, obj.CodEstado , new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(FCCxCFormaPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCFormaPago_Eliminar((int)obj.IdFormaPago , new ObjectParameter("iCodError", "0"));
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
