import React, {useContext} from 'react';
import {useHistory, Link} from 'react-router-dom';
import {Navbar, Nav, NavDropdown, Button} from 'react-bootstrap'
import LogoTEC from '../Content/img/logotec_blanco.png'
import './Encabezado.css';
//contexto global de la aplicación
import AppContext, {estadoAppInicial} from '../Context/AppContext';

const Encabezado = (props) => {

    const history = useHistory();
    
    //debugger;
    const {estadoApp, setEstadoApp} = useContext(AppContext);
    
    //función para salir
    const salir = () => {
        setEstadoApp({
            estadoAppInicial
        })
        history.push("/");
    }
    //componente que maneja el logout
//   const Salir = () => {
//     //debugger
//     alert('salir local');
//     setEstadoApp({
//       ...estadoApp,
//       usuarioValido: false
//     })
//     //no retorna nada, el cambio de estadoApp debería causar la renderización de nuevo
//     //return <Redirect to="/"></Redirect>
//   };

    //destructurar valores que se utilizarán en el componente
    const {nombreAplicacion, usuarioValido} = estadoApp;
    //alert("Encabezado:" + JSON.stringify(estadoApp));
    return (
        <div className="encabezado">
            <div className='row encabezadoLinea1'>
                <img src={LogoTEC} alt="logo" />
                <div className="nombreAplicacion">{nombreAplicacion}</div>
            </div>
            <div className='row encabezadoLinea1'>&nbsp;</div>
            {   //Revisa si muestra o no el menu
            (usuarioValido || true)
                ?
                    (<div className='row'>
                        <Navbar expand="sm" className="menu">
                            <Navbar.Toggle aria-controls="basic-navbar-nav" />
                            <Navbar.Collapse id="basic-navbar-nav">
                                <Nav>
                                    <Link to="/inicio">Inicio</Link>
                                </Nav>
                                <Nav className="mr-auto">
                                    <NavDropdown title="General" id="basic-nav-dropdown">
                                        <NavDropdown.Item className="itemMenu" onClick={salir}>Salir</NavDropdown.Item>
                                    </NavDropdown>
                                    <NavDropdown title="Cuentas por Cobrar" id="basic-nav-dropdown">
                                        <NavDropdown.Item className="itemMenu" href="/GenerarCuenta">Generar Cuenta por Cobrar</NavDropdown.Item>
                                        <NavDropdown.Item className="itemMenu" href="/PagoCuenta">Pago de Cuenta por Cobrar</NavDropdown.Item>
                                        <NavDropdown title="Datos Cuentas por Cobrar" id="basic-nav-dropdown">
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/Periodos">Periodos</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/Auxiliares">Auxiliares</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/Auxiliares">Auxiliares</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/EstadosCuentaMaestro">Estados de cuenta maestro</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/Conceptos">Conteptos</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/Impuestos">Impuestos para bienes y servicios (IVA)</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/UnidadesMedida">Unidades de medida</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/BienesoServicios">Bienes o servicios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/Precios">Precios de bienes y servicios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/FormasPago">Formas de pago</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/TiposSocio">Tipos de socios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/TiposIdentificacionSocio">Tipos de identificación de socios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" as={Link} to="/Mantenimientos/SociosNegocio">Socios de negocios</NavDropdown.Item>
                                        </NavDropdown>
                                    </NavDropdown>
                                    <NavDropdown title="Facturación Electrónica" id="basic-nav-dropdown">
                                        <NavDropdown.Item className="itemMenu" href="/Facturar">Facturar</NavDropdown.Item>
                                        <NavDropdown.Divider />
                                        <NavDropdown.Item className="itemMenu" href="/NotaCredito">Nota de crédito</NavDropdown.Item>
                                        <NavDropdown.Item className="itemMenu" href="/NotaDebito">Nota de débito</NavDropdown.Item>
                                        <NavDropdown title="Datos de facturación electrónica" id="basic-nav-dropdown">
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Periodos</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Estados de cuenta maestro</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos"></NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Auxiliares</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Conteptos</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Impuestos para bienes y servicios (IVA)</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Unidades de medida</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Bienes o servicios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Precios de bienes y servicios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Formas de pago</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Tipos de socios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Tipos de identificación de socios</NavDropdown.Item>
                                            <NavDropdown.Item className="itemMenu" href="/CxC/Periodos">Socios de negocios</NavDropdown.Item>
                                        </NavDropdown>
                                    </NavDropdown>
                                </Nav>
                                <Nav>
                                    <Button variant="outline-success btn btn-danger text-white" onClick={salir}>Salir</Button>
                                </Nav>
                            </Navbar.Collapse>
                        </Navbar>
                    </div>)
            : null}
        </div>
    )
}

export default Encabezado

