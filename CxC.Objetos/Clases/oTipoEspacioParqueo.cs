using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace CxC.Objetos.Clases
{
    [DataContract]
    public class oTipoEspacioParqueo
    {
        [DataMember]
        public int IdTipoEspacioParqueo { get; set; }
        [DataMember]
        public string NombreEspacioParqueo { get; set; }
        [DataMember]
        public int IdUsuario { get; set; }
        [DataMember]
        public DateTime FechaCreacion { get; set; }
       
    }
}
