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
    
    public partial class FCCXCRazonExoneracion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FCCXCRazonExoneracion()
        {
            this.FCCXCDocumentoElectronico = new HashSet<FCCXCDocumentoElectronico>();
        }
    
        public int IdRazonExoneracion { get; set; }
        public string DscExoneracion { get; set; }
        public Nullable<float> PorExoneracion { get; set; }
        public Nullable<System.DateTime> FecCreacion { get; set; }
        public string UsrCreacion { get; set; }
        public Nullable<System.DateTime> FecUltModif { get; set; }
        public string UsrUltModif { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FCCXCDocumentoElectronico> FCCXCDocumentoElectronico { get; set; }
    }
}
