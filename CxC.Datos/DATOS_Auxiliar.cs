using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Core.Objects;


namespace CxC.Datos
{
    public class DATOS_Auxiliar
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();

        public List<FCCxCAuxiliar> DATOS_SelectAll()
        {
            try
            {
                var resTemp = bd.pr_FCCxCAuxiliar_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                List<FCCxCAuxiliar> res = new List<FCCxCAuxiliar>();
                foreach (var r in resTemp)
                {
                    FCCxCAuxiliar n = new FCCxCAuxiliar()
                    {
                        IdAuxiliar = r.IdAuxiliar,
                        DscAuxiliar = r.DscAuxiliar,
                        CodEstado = r.CodEstado
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

        public FCCxCAuxiliar DATOS_Select(int id)
        {
            try
            {
                FCCxCAuxiliar res = null;       //inicialmente nulo
                var resTemp1 = bd.pr_FCCxCAuxiliar_SeleccionarUno(id, new ObjectParameter("iCodError", "0")).ToList();
                if (resTemp1 != null)
                {
                    res = new FCCxCAuxiliar();  //si lo encontró lo asigna al resultado
                    var n = new FCCxCConcepto()
                    {
                        IdConcepto = res.IdAuxiliar,
                        DscTipo = res.DscAuxiliar
                    };
                }
                return res;                     //retorna el resultado
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool DATOS_insertar(FCCxCAuxiliar obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCAuxiliar_Insertar(obj.DscAuxiliar, obj.CodEstado, new ObjectParameter("iIdAuxiliar", "0"), new ObjectParameter("iCodError", "0"));
                return resultado == 1; //lo mismo que decir: if resultado == 1 { return true } else { return false } 
            }
            catch (Exception ex)
            {
                //evaluar la opción mejor de hacer un throw de la excepción y que las capas superiores la manejen
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(FCCxCAuxiliar obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCAuxiliar_Actualizar((int)obj.IdAuxiliar, obj.DscAuxiliar, obj.CodEstado, new ObjectParameter("iCodError", "0"));
                return resultado == 1; //lo mismo que decir: if resultado == 1 { return true } else { return false } 
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
                var resultado = bd.pr_FCCxCAuxiliar_Eliminar(id, new ObjectParameter("iCodError", "0"));
                //return true; //¿por que?
                return resultado >= 0; //lo mismo que decir: if resultado == 1 { return true } else { return false } 
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
    }
}
