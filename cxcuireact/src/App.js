import React, {useState, useEffect} from 'react';
import {BrowserRouter as Router, Switch, Route, Redirect, Link, useHistory, withRouter} from 'react-router-dom'

//Componentes de terceros
import LoadingOverlay from 'react-loading-overlay';

//Componentes generales
import AppContext, {estadoAppInicial} from './Context/AppContext';
import Encabezado from './components/Encabezado';
import PiePagina from './components/PiePagina'
import Login from './components/Login';

//Componentes propios de la aplicacion
import Aplicacion from './components/Aplicacion/Aplicacion';
import 'bootstrap/dist/css/bootstrap.min.css';
import MantPeriodos from './components/Aplicacion/Mantenimientos/MantPeriodos'
import MantAuxiliares from './components/Aplicacion/Mantenimientos/MantAuxiliares'
import MantEstadosCuentaMaestro from './components/Aplicacion/Mantenimientos/MantEstadosCuentaMaestro'
import MantConceptos from './components/Aplicacion/Mantenimientos/MantConceptos'
import MantImpuestos from './components/Aplicacion/Mantenimientos/MantImpuestos'
import MantUnidadesMedida from './components/Aplicacion/Mantenimientos/MantUnidadesMedida'
import MantBienesoServicios from './components/Aplicacion/Mantenimientos/MantBienesoServicios'
import MantPrecios from './components/Aplicacion/Mantenimientos/MantPrecios'
import MantFormasPago from './components/Aplicacion/Mantenimientos/MantFormasPago'
import MantTiposSocio from './components/Aplicacion/Mantenimientos/MantTiposSocio'
import MantTiposIdentificacionSocio from './components/Aplicacion/Mantenimientos/MantTiposIdentificacionSocio'
import MantSociosNegocio from './components/Aplicacion/Mantenimientos/MantSociosNegocio'
import './App.css';


function App() {
  //ESTADO LOCAL
  const [loading, setLoading] = useState(true); //variable de estado que determina si se muestran los overlay de esperay carga o no

  // ESTADO APP
  const [estadoApp, setEstadoApp] = useState(estadoAppInicial)

  //debugger; //ANTES
  
  //probar meterlo en el useeffect
  //prueba de cambios en el estado
  // setEstadoApp(
  //   ...estadoApp,
  //   {
  //     usuarioValido : true,
  //     nombreUsuario : 'prueba'
  //   }
  // )
  // debugger; //DESPUES

  //destructurar elementos necesarios del estaadoApp
  const {urlInstalacion, usuarioValido} = estadoApp;
  //debugger;
  useEffect( () =>
    {
        //produce una espera de X milisegundos donde sea llamado
      setTimeout(() => {
        //debugger;
        setLoading(false)
      },
      2000)
    },
    []
  );

  return (
    <AppContext.Provider value={{estadoApp, setEstadoApp}}>
      <LoadingOverlay className="center-div-login" active={loading} spinner text='Cargando...'>
        <div className="App">
          <Router>
            <Encabezado />
            <Link to="/inicio">Home</Link>
              <div className="Contenido">
                {(usuarioValido) 
                ?
                    (<Switch>
                      {/* <Route exact path="/" component={Login} /> */}
                      <Route exact path="/inicio" component={Aplicacion} />
                      <Route exact path="/Mantenimientos/Periodos" component={MantPeriodos} />
                      <Route exact path="/Mantenimientos/Auxiliares" component={MantAuxiliares} />
                      <Route exact path="/Mantenimientos/EstadosCuentaMaestro" component={MantEstadosCuentaMaestro} />
                      <Route exact path="/Mantenimientos/Conceptos" component={MantConceptos} />
                      <Route exact path="/Mantenimientos/Impuestos" component={MantImpuestos} />
                      <Route exact path="/Mantenimientos/UnidadesMedida" component={MantUnidadesMedida} />
                      <Route exact path="/Mantenimientos/BienesoServicios" component={MantBienesoServicios} />
                      <Route exact path="/Mantenimientos/Precios" component={MantPrecios} />
                      <Route exact path="/Mantenimientos/FormasPago" component={MantFormasPago} />
                      <Route exact path="/Mantenimientos/TiposSocio" component={MantTiposSocio} />
                      <Route exact path="/Mantenimientos/TiposIdentificacionSocio" component={MantTiposIdentificacionSocio} />
                      <Route exact path="/Mantenimientos/SociosNegocio" component={MantSociosNegocio} />

                      {/* <Route render={() => <Redirect to="/" />} />  */}
                      {/* Si ninguna ruta hace match redirecciona a raiz (login) haciendo refresh para reiniciar todos los objetos de estado de la aplicación */}
                    </Switch>
                    )
                    : (
                      <Login/>
                    )
                    }
              </div>
            <PiePagina />
          </Router>
        </div>
      </LoadingOverlay>
    </AppContext.Provider>
  );
  return (
    <div className="App">
      <AppContext.Provider value={[estadoApp, setEstadoApp]}>
        <LoadingOverlay className="center-div-login" active={loading} spinner text='Cargando...'>
          <Encabezado />
          <div className="Contenido">
            <Router>
              <Switch>
                <Route exact path="/" component={Login} />
                <Route exact path="/inicio" component={null/*Aplicacion*/} />
                <Route render={() => <Redirect to="/" />} /> {/* Si ninguna ruta hace match redirecciona a raiz (login) */}
              </Switch>
            </Router>
          </div>
          <PiePagina />
        </LoadingOverlay>
      </AppContext.Provider>
    </div>
  );
}

export default App;
