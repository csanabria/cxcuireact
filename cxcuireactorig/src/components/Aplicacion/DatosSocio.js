import React, {useContext} from 'react'

import AppContext from '../../Context/AppContext';

import "./DatosSocio.css"

const DatosSocio = () => {
    const {estadoApp, setEstadoApp} = useContext(AppContext);
    //debugger;
    //destructurar valores que se utilizarán en el componente
    const {identificacionUsuario, nombreUsuario, campusCentroAcademicoUsuario, tesoreriaUsuario, cajaUsuario} = estadoApp;
    //debugger;
    return (
        <div className="datosSocio">
            <h2>Datos del socio</h2>
            <hr/>
            <div className="row">
                <div className="col-md-4">Identificación</div>
                <div className="col-md-8">{identificacionUsuario}</div>
            </div>
            <div className="row">
                <div className="col-md-4">Nombre</div>
                <div className="col-md-8">{nombreUsuario}</div>
            </div>
            <div className="row">
                <div className="col-md-4">Campus o C. Acad.</div>
                <div className="col-md-8">{campusCentroAcademicoUsuario}</div>
            </div>
            <div className="row">
                <div className="col-md-4">Tesorería</div>
                <div className="col-md-8">{tesoreriaUsuario}</div>
            </div>
            <div className="row">
                <div className="col-md-4">Caja</div>
                <div className="col-md-8">{cajaUsuario}</div>
            </div>
        </div>
    )
}

export default DatosSocio
