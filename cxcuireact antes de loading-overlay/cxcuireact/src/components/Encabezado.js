import React, {useContext} from 'react';
import {Navbar, Nav, NavDropdown, Button} from 'react-bootstrap'
import LogoTEC from '../Content/img/logotec_blanco.png'
import './Encabezado.css';
//contexto global de la aplicación
import AppContext from '../Context/AppContext';

const Encabezado = (props) => {
    //const {nombreAplicacion} = AppContext;
    const estadoGlobal = useContext(AppContext);
    debugger;
    return (
        <div className="encabezado">
            <div className='row encabezadoLinea1'>
                <img src={LogoTEC} alt="logo" />
                <div className="nombreAplicacion">{estadoGlobal.nombreAplicacion}</div>
            </div>
            {   //Revisa si muestra o no el menu
            (estadoGlobal.usuarioValido /*|| true*/)
                ?
                    (<div className='row'>
                        <Navbar bg="light" expand="lg">
                            <Navbar.Toggle aria-controls="basic-navbar-nav" />
                            <Navbar.Collapse id="basic-navbar-nav">
                                <Nav className="mr-auto">
                                    <NavDropdown title="Inicio" id="basic-nav-dropdown">
                                        <NavDropdown.Item href="#action/3.4">Salir</NavDropdown.Item>
                                    </NavDropdown>
                                    <NavDropdown title="Cuentas por Cobrar" id="basic-nav-dropdown">
                                        <NavDropdown.Item href="#action/3.1">Consulta</NavDropdown.Item>
                                        <NavDropdown.Divider />
                                        <NavDropdown.Item href="#action/3.2">Cobro</NavDropdown.Item>
                                    </NavDropdown>
                                    <NavDropdown title="Facturación Electrónica" id="basic-nav-dropdown">
                                        <NavDropdown.Item href="#action/3.1">Facturar</NavDropdown.Item>
                                        <NavDropdown.Divider />
                                        <NavDropdown.Item href="#action/3.2">Consulta</NavDropdown.Item>
                                    </NavDropdown>
                                </Nav>
                                <Nav>
                                    <Button variant="outline-success btn btn-danger text-white">Salir</Button>
                                </Nav>
                            </Navbar.Collapse>
                        </Navbar>
                    </div>)
            : null}
        </div>
    )
}

export default Encabezado

