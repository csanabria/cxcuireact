import React, { useState, useEffect, useCallback, useContext } from 'react';
import {BrowserRouter as Router, Route, Switch, Redirect, useHistory } from 'react-router-dom';

//componentes propios
import Encabezado from './components/Encabezado';
import NavBar from './components/NavBar';
//contexto global de la aplicación
import AppContext, {estadoInicialGlobal} from './context/AppContext';
//css
//Hojas de estilo
//import './Content/bootstrap.min.css';
import './App.css';


function App() {
  const urlInstalacion = process.env.PUBLIC_URL;
  var estadoGlobal = estadoInicialGlobal;
  debugger;
  return (
    <div className="App">
      <AppContext.Provider value={estadoInicialGlobal}>
          <Encabezado />
          <p>
            Aplicación funcionando
          </p>
          <p>
            Ruta: {urlInstalacion}
          </p>
          <p>
            Aplicacion: {estadoInicialGlobal.nombreAplicacion}
          </p>
          
          {/* <p>
            Estado Global: {JSON.parse(estadoInicialGlobal)}
          </p> */}
      </AppContext.Provider>
    </div>

  );
}

export default App;
