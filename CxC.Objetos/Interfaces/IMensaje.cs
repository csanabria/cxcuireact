using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CxC.Objetos.Interfaces
{
    interface IMensaje<TipoGenerico>
    {
        int CodigoRespuesta { get; set; }
        string DescripcionRespuesta { get; set; }
        TipoGenerico ObjetoRespuesta { get; set; }
    }
}
