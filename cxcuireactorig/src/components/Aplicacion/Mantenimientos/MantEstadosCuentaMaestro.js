import React from 'react'
import {Nav} from 'react-bootstrap'
import {House} from 'react-bootstrap-icons'
import {Link} from 'react-router-dom'

const MantEstadosCuentaMaestro = () => {
    return (
        <div>
            <Nav className="botonInicio"><Link to="/inicio"><House /></Link></Nav>
            Mantenimiento de Estados de Cuenta Maestro
        </div>
    )
}

export default MantEstadosCuentaMaestro
