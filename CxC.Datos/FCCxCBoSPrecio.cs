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
    
    public partial class FCCxCBoSPrecio
    {
        public int IdBoSPrecio { get; set; }
        public int IdBoS { get; set; }
        public decimal MonPrecio { get; set; }
        public decimal MonCosto { get; set; }
        public int NumPeriodo { get; set; }
        public System.DateTime FecCreacion { get; set; }
        public string UsrCreacion { get; set; }
        public System.DateTime FecUltModif { get; set; }
        public string UsrUltModif { get; set; }
        public Nullable<int> IdMoneda { get; set; }
    
        public virtual FCCxCBienoServicio FCCxCBienoServicio { get; set; }
        public virtual FCCxCPeriodo FCCxCPeriodo { get; set; }
    }
}
