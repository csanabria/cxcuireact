﻿using CxC.Objetos;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Datos
{
    public class DATOS_EstadoPago
    {
        bdFCCxCEntities bd = new bdFCCxCEntities();
        public List<pr_FCCxCEstadoPago> DATOS_SelectAll()
        {
            try
            {
                List<pr_FCCxCEstadoPago> res = bd.pr_FCCxCEstadoPago_SeleccionarTodos(new ObjectParameter("iCodError", "0")).ToList();
                return res;
            }

            catch (Exception ex)
            {
                var msgError = ex.Message;
            }
            return null;
        }
        public bool DATOS_insertar(pr_FCCxCEstadoPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCEstadoPago_Insertar(obj.DscEstadoPago,  new ObjectParameter("iIdEstadoPago", "0"), new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }
        }
        public bool DATOS_update(pr_FCCxCEstadoPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCEstadoPago_Actualizar((int)obj.IdEstadoPago , obj.DscEstadoPago , new ObjectParameter("iCodError", "0"));
                if (resultado == 1) { return true; } else { return false; }
            }
            catch (Exception ex)
            {
                var msgError = ex.Message;
                return false;
            }

        }
        public bool DATOS_delete(pr_FCCxCEstadoPago obj)
        {
            try
            {
                var resultado = bd.pr_FCCxCEstadoPago_Eliminar((int)obj.IdEstadoPago , new ObjectParameter("iCodError", "0"));
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
