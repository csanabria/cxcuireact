import React, {useState} from 'react'
import {Nav} from 'react-bootstrap'
import {House} from 'react-bootstrap-icons'
import {Link} from 'react-router-dom'
import TablaGeneralMant from './TablaGeneralMant'
import DetalleMantAuxiliares from './DetalleMantAuxiliares'
import VisorEstado from '../../VisorEstado'

import './MantAuxiliares.css'

const MantAuxiliares = () => {
    const datos = [
        {"id" : 1, nombre : "Auxiliar 1"},
        {"id" : 2, nombre : "Auxiliar 2"}
    ]
    const [Registro, setRegistro] = useState({"id" : 1, nombre : "Auxiliar 1"})
    const estadoLocal = {datos}
    const modoDesarrollo = true;
    return (
        <>
            {(modoDesarrollo)
                ?
                    (
                        <>
                        <VisorEstado estado={estadoLocal} titulo="Estado Local" estilo="fijoIzquierdaBottom"/>
                        </>
                    )
                :
                    (null)
            }
            <div>
                <Nav className="botonInicio"><Link to="/inicio"><House /></Link></Nav>
                <h2>Mantenimiento de Auxiliares</h2>
                <TablaGeneralMant datos={datos} setRegistro={setRegistro}/>
                <DetalleMantAuxiliares registro={Registro}/>
            </div>
        </>
    )
}

export default MantAuxiliares
