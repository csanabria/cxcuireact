
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using CxC.Objetos.Interfaces;

namespace CxC.Objetos.Objetos
{
    public class TEC_Mensaje<TipoGenerico> : IMensaje<TipoGenerico>
    {
        [DataMember]
        public int CodigoRespuesta { get; set; }
        [DataMember]
        public string DescripcionRespuesta { get; set; }
        [DataMember]
        public TipoGenerico ObjetoRespuesta { get; set; }
    }
}
