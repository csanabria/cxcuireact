import React from 'react'
import { BrowserRouter, Route } from 'react-router-dom'
import Formulario from './Formulario';
import Consulta from './InicioSocio';
class MyRouter extends React.Component {
  render () {
    const urlInstalacion = process.env.PUBLIC_URL;
    console.log('en myRouter url:' + urlInstalacion)
    return (
      <BrowserRouter>
        <Route exact
          path = {urlInstalacion + '/inicio' }
          render={ props => <Consulta {...props} />}
        />
        <Route exact
          path={urlInstalacion + '/inicio/nueva' }
          render={ props => <Formulario {...props} />}
        />
        <Route exact
          path={urlInstalacion + '/inicio/consultar' }
          render={ props => <Formulario {...props} />}
        />
        <Route exact
          path={urlInstalacion + '/inicio/renovar' }
          render={ props => <Formulario {...props} />}
        />
        <Route exact
          path={urlInstalacion + '/inicio/editar' }
          render={ props => <Formulario {...props}/>}
        />
      </BrowserRouter>
    )
  }
}

export default MyRouter;