import {createContext} from 'react';
import uuidV4 from 'uuid/v4'

//debugger; //#1
const AppContext = createContext();

export const estadoInicialGlobal = {
    //valores configurados globalmente, fuera del código, en public\config.js importado en el encabezado de index.html
    // ...configGlobal,
    //propiedades globales
    loginUsuario: '',
    JWToken : '',
    usuarioValido: false,
    idSesion : uuidV4(),
    permisos : {},
    urlInstalacion : process.env.PUBLIC_URL,
    modoDesarrollo: 0,
    permisosApp :{
      RenovarLicencia: 125,
      ModificarLicencia: 126,
      DetalleLicencia: 127,
      NuevaLicencia: 130,
      ConsultarLicencias: 122,
      Inicio: 119,
      Licencias: 120
    }
  };

export default AppContext;