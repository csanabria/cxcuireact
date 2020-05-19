import React from 'react'
import {Table, Dropdown} from 'react-bootstrap'

import './TablaCuentasSocio.css'

const TablaCuentasSocio = (props) => {
    return (
        <>
            <div className="row">
                <Dropdown>
                    <Dropdown.Toggle variant="success" id="dropdown-basic">
                        Ver todas
                    </Dropdown.Toggle>

                    <Dropdown.Menu>
                        <Dropdown.Item href="#/action-1">Pendientes</Dropdown.Item>
                        <Dropdown.Item href="#/action-2">En proceso</Dropdown.Item>
                        <Dropdown.Item href="#/action-3">Canceladas</Dropdown.Item>
                    </Dropdown.Menu>
                </Dropdown>
            </div>
            <div className="row">
                <Table striped bordered hover>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Monto</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>99</td>
                            <td>Matrícula X Semestre 20XX</td>
                            <td>$55000</td>
                            <td>Pendiente</td>
                            <td></td>
                        </tr>
                    </tbody>
                </Table>
            </div>
        </>
    )
}

export default TablaCuentasSocio
