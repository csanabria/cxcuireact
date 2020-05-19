import React, {useState, useContext, useHistory} from 'react'
import {BrowserRouter as Router, Switch, Route, Link} from 'react-router-dom'
import {Navbar, Nav, NavDropdown, Button} from 'react-bootstrap'
import { House } from 'react-bootstrap-icons';
import AppContext, {estadoAppInicial} from '../../Context/AppContext'
import Dashboard from './Dashboard'
import VisorEstado from '../VisorEstado'
import IdleTimeContainer from './IdleTimeContainer';
import Login from '../Login';

import './Aplicacion.css';
import { Breadcrumb } from 'react-bootstrap';

const Aplicacion = (props) => {
    //const history = useHistory();


    const {estadoApp, setEstadoApp} = useContext(AppContext);

    const {usuarioValido, modoDesarrollo} = estadoApp;


    const estadoLocal = {}

    //TODO: moverla a app y pasarla como prop acá y a encabezado
    //función para salir
    const salir = () => {
        setEstadoApp({
            estadoAppInicial
        })
        //no va a funcionar hasta eliminarla y pasarla en props
        //history.push("/");
    }

    //debugger;
    return (
        <div className="estiloAplicacion">
            <IdleTimeContainer salir={salir} />
            {(modoDesarrollo)
            ?
                (
                    <>
                    <VisorEstado estado={estadoApp} titulo="Estado Global" estilo="fijoDerechaBottom"/>
                    <VisorEstado estado={estadoLocal} titulo="Estado Local" estilo="fijoIzquierdaBottom"/>
                    </>
                )
            :
                (null)
            }
            
            <Dashboard/>

        </div>
    )
}

export default Aplicacion;