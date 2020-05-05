import React, { useState, useEffect, useCallback, useContext } from 'react';
import {BrowserRouter as Router, Route, Switch, Redirect, useHistory } from 'react-router-dom';
import uuidV4 from 'uuid/v4'
import config from './config';

//contexto global de la aplicación
import AppContext from './context/AppContext';

//hook para guardar estado en local storage
import {useLocalStorage} from './components/hooks/UseLocalStorage';

//Componentes de terceros
import ReactLoading from "react-loading";

//Componentes de la aplicación
import Encabezado from './components/Encabezado'
import PiePagina from './components/PiePagina'
//import Menu from './components/Menu'
import Login from './components/Login'
import Aplicacion from './components/Aplicacion/Aplicacion'
import VisorEstado from './components/VisorEstado'

//temp: menu
import ResponsiveNavigation from './components/Aplicacion/components/ResponsiveNavigation'
import logo from './components/Content/img/logo.svg'

//Hojas de estilo
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';

const App = (props) => {
  ////debugger; #2
  var configGlobal = window["configEnJs"];
  var uuid = uuidV4;
  var history = useHistory();

  //temp: menu
  const navLinks = [
    {
      text: 'Login',
      path: '/',
      icon: 'ion-ios-home'
    },
    {
      text: 'Inicio',
      path: '/Inicio',
      icon: 'ion-ios-megaphone'
    },
    // {
    //   text: 'About',
    //   path: '/about',
    //   icon: 'ion-ios-business'
    // },
    // {
    //   text: 'Blog',
    //   path: '/blog',
    //   icon: 'ion-ios-bonfire'
    // },
    // {
    //   text: 'Portfolio',
    //   path: '/portfolio',
    //   icon: 'ion-ios-briefcase'
    // }
  ]
  //recibe el contexto actual y el permiso que se desea verificar, retorna true o false
  const TienePermiso = async (contexto, idPermiso) => {
    var res = false;
    //obtener los permisos
    let permisos = contexto.permisos;
    //recorrerlo a pie pues con forEach no sirvio
    for (var i=0;i<permisos.length; i++)
    {
      if (permisos[i].IdPermiso === idPermiso)
      {
        res = true;
      }
    }
    return res;
  }

  //métodos para guardar y leer el estado global de localstorage y que no se pierda al refrescar
  const GuardarEstadoGlobalLocalStorage = () => {
    //debugger;
    localStorage.setItem("estadoGlobalApp", JSON.stringify(estadoGlobal))
  }

  const LeerEstadoGlobalLocalStorage = () => {
    //debugger;
    estadoGlobal = JSON.parse(localStorage.getItem("estadoGlobalApp"));
  }

  ////debugger; #3
  let estadoGlobal = useContext(AppContext);
  estadoGlobal = 
  {
    //valores configurados globalmente, fuera del código, en public\config.js importado en el encabezado de index.html
    ...configGlobal,
    //propiedades globales
    loginUsuario: '',
    JWToken : '',
    usuarioValido: false,
    idSesion : uuid(),
    permisos : {},
    urlInstalacion : process.env.PUBLIC_URL,
    permisosApp :{
      RenovarLicencia: 125,
      ModificarLicencia: 126,
      DetalleLicencia: 127,
      NuevaLicencia: 130,
      ConsultarLicencias: 122,
      Inicio: 119,
      Licencias: 120
      },
    //funciones globales
    TienePermiso,
    GuardarEstadoGlobalLocalStorage,
    LeerEstadoGlobalLocalStorage,
  };
  
  //debugger; //#4
  estadoGlobal.GuardarEstadoGlobalLocalStorage();

  //ESTADO GLOBAL destructurado en items sencillos para usar en la vista
  //con esta sintaxis estado es un arreglo de 2 elementos: el estado y la funcion para actualizarlo
  const {nombreAplicacion, loginUsuario, usuarioValido, idAplicacion, modoDesarrollo} = estadoGlobal;

  //ESTADO LOCAL
  const [loading, setLoading] = useState(true); //variable de estado que determina si se muestran los overlay de esperay carga o no

  useEffect( () =>
    {
        //produce una espera de X milisegundos donde sea llamado
      setTimeout(() => {
        setLoading(false)
      },
      2000)
    },
    []
  );

  // Cosas necesarias para botón de SALIR de la aplicación y redirecccionar a Login
  //forceUpdate método 1 //importar useReducer arriba
  // const [, forceUpdate] = useReducer(x => {
  //                                     x + 1
  //                                   }, 0);
  //forceUpdate método 2 //importar useCallback arriba
  const [, updateState] = React.useState();
  //const forceUpdate = useCallback(() => updateState({}), []);

  const salir = () => {
    // setEstadoGlobal({
    //   ...estadoGlobal[0],
    //   loginUsuario : '',
    //   usuarioValido: false,
    //   JWToken : '',
    //   idSesion : '',
    //   idUsuario : 0,
    //   correoUsuario : '',
    //   nombreUsuario : '',
    //   permisos : {}
    // })
  }

  const urlInstalacion = process.env.PUBLIC_URL;
  //alert(urlInstalacion);
  //var us = loginUsuario;
  debugger;
    return (
    <AppContext.Provider value={estadoGlobal}>
    {loading ?
      <div className="center-div"><ReactLoading type={"bars"} color={"navy"} /></div>
    :
      (
        <div className="center-div-aplicacion">
          {/* Esta es la parte que usa el React Routing */}
          <ResponsiveNavigation
                        navLinks={ navLinks }
                        logo={ logo }
                        background="#fff"
                        hoverBackground="#ddd"
                        linkColor="#777"
                    />
          <Router>
            <Encabezado salir={salir}/>
            {true/* {usuarioValido  */}
            ?
              <div>
                <Switch>
                  <Route exact path="/" component={Login} />
                  <Route exact path="/inicio" component={Aplicacion} />
                  <Route render={() => <Redirect to="/" />} /> {/* Si ninguna ruta hace match redirecciona a raiz (login) */}
                </Switch>
              </div>
            :
              {/* <Login /> */}
            }
          </Router>
          <PiePagina />
        </div>
      )
    }
    {modoDesarrollo
    ?
        <VisorEstado estado={estadoGlobal[0]} titulo="Estado Global" estilo="fijoIzquierdaBottom" />
    :
      null
    }
    </AppContext.Provider>
  );
}
const NotFound = () => {
      return (
          <div>
              <span>Not Found</span>
          </div>
      )
};
export default App;
