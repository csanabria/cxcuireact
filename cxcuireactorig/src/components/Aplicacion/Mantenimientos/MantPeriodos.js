import React from 'react'
import {Link} from 'react-router-dom'
import {Nav} from 'react-bootstrap'
import {House} from 'react-bootstrap-icons'

const MantPeriodos = (props) => {
    return (
        <div>
            <Nav className="botonInicio"><Link to="/inicio"><House /></Link></Nav>
            <h2>Mantenimiento de Periodos</h2>
        </div>
    )
}

export default MantPeriodos