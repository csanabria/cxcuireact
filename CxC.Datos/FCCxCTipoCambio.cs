//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CxC.Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class FCCxCTipoCambio
    {
        public int IdTipoCambio { get; set; }
        public Nullable<int> IdMoneda { get; set; }
        public Nullable<decimal> MonCompra { get; set; }
        public Nullable<decimal> MonVenta { get; set; }
        public Nullable<System.DateTime> FecCreacion { get; set; }
        public string UsrCreacion { get; set; }
    
        public virtual FCCxCMonedas FCCxCMonedas { get; set; }
    }
}
