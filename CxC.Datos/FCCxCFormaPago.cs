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
    
    public partial class FCCxCFormaPago
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FCCxCFormaPago()
        {
            this.FCCXCDocumentoElectronico = new HashSet<FCCXCDocumentoElectronico>();
            this.FCCxCMovimientoCuenta = new HashSet<FCCxCMovimientoCuenta>();
        }
    
        public int IdFormaPago { get; set; }
        public string DscFormaPago { get; set; }
        public string CodEstado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FCCXCDocumentoElectronico> FCCXCDocumentoElectronico { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FCCxCMovimientoCuenta> FCCxCMovimientoCuenta { get; set; }
    }
}
