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
    
    public partial class FCCXCDetalles
    {
        public int IdDetalleDocumento { get; set; }
        public Nullable<int> IdDocumentoElectronico { get; set; }
        public Nullable<int> NumLinea { get; set; }
        public Nullable<float> CanBienoServicio { get; set; }
        public Nullable<int> IdBoS { get; set; }
        public Nullable<decimal> MonPrecio { get; set; }
        public Nullable<decimal> MonDescuento { get; set; }
        public Nullable<decimal> MonImpuesto { get; set; }
    
        public virtual FCCxCBienoServicio FCCxCBienoServicio { get; set; }
        public virtual FCCXCDocumentoElectronico FCCXCDocumentoElectronico { get; set; }
    }
}
