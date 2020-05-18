import React from 'react';
import {BrowserRouter as Router, Switch, Route, Redirect} from 'react-router-dom'

import AppContext, {estadoInicialGlobal} from './Context/AppContext';
import Encabezado from './components/Encabezado';
import PiePagina from './components/PiePagina'
import Login from './components/Login';

import './App.css';

function App() {
  return (
    <div className="App">
      <AppContext.Provider value={estadoInicialGlobal}>
        <Encabezado />
        <div className="Contenido">
          <Router>
            <Switch>
              <Route exact path="/" component={null/*Login*/} />
              <Route exact path="/inicio" component={null/*Aplicacion*/} />
              <Route render={() => <Redirect to="/" />} /> {/* Si ninguna ruta hace match redirecciona a raiz (login) */}
            </Switch>
          </Router>
          <PiePagina />
        </div>
        </AppContext.Provider>
    </div>
  );
}

export default App;
