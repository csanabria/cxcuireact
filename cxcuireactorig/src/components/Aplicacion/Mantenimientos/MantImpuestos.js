import React from 'react'
import {Nav} from 'react-bootstrap'
import {House} from 'react-bootstrap-icons'
import {Link} from 'react-router-dom'

const MantImpuestos = (props) => {
    return (
        <div>
            <Nav className="botonInicio"><Link to="/inicio"><House /></Link></Nav>
            <h2>Mantenimiento de Impuestos</h2>
        </div>
    )
}

export default MantImpuestos