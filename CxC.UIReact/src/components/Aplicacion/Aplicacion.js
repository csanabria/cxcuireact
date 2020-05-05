import React, {useContext} from 'react'
import AppContext from '../../context/AppContext'
import VisorEstado from '../../components/VisorEstado'
import './aplicacion.css'
import { Redirect } from 'react-router'
import MyRouter from './MyRouter';
import ResponsiveNavigation from './components/ResponsiveNavigation'
import logo from './Content/img/logo.svg';

import Menu from '../Menu'

const Aplicacion = () => {
    const navLinks = [
		{
			text: 'Home',
			path: '/',
			icon: 'ion-ios-home'
		},
		{
			text: 'Contact',
			path: '/contact',
			icon: 'ion-ios-megaphone'
		},
		{
			text: 'About',
			path: '/about',
			icon: 'ion-ios-business'
		},
		{
			text: 'Blog',
			path: '/blog',
			icon: 'ion-ios-bonfire'
		},
		{
			text: 'Portfolio',
			path: '/portfolio',
			icon: 'ion-ios-briefcase'
		}
	]

    const estadoGlobal = useContext(AppContext)
    debugger;
    //destructurar items necesarios
    const {loginUsuario, idAplicacion, nombreAplicacion, idSesion, modoDesarrollo} = estadoGlobal;

    const estadoLocal = {};

    return (
        <div className="aplicacion">
            {
                loginUsuario || true ?
                    <>
                    <ResponsiveNavigation
                        navLinks={ navLinks }
                        logo={ logo }
                        background="#fff"
                        hoverBackground="#ddd"
                        linkColor="#777"
                    />
                    <MyRouter/>
                    </>
                :
                    <Redirect to="/"/>
            }
            {/* {modoDesarrollo 
            ?
                <VisorEstado estado={estadoLocal} titulo="Estado Local" estilo="fijoDerechaBottom"/> */}
        </div>
        
    )
}

export default Aplicacion
