import React, {useContext} from 'react';
import { Form } from 'react-bootstrap';
import './Encabezado.css';
import Menu from './Menu'
//contexto global de la aplicación
import AppContext from '../context/AppContext';

const Encabezado = (props) => {
    ////debugger; //#5
    //estado global
    const estadoGlobal = useContext(AppContext);
    //destructurar el estado global en los valores necesarios para el componente
    const { loginUsuario, nombreAplicacion} = estadoGlobal;

    const rutaRaiz = process.env.PUBLIC_URL;
    const urlInstalacion = process.env.PUBLIC_URL;
    //función para logout viene en las props
    const salir = props.salir;
    //debugger;
        return (
        <div className="encabezado">
            <div className="Cabeceraheader">
                <div className="container">
                    {/*<!-- Logo TEC -->*/}

                    <div className="navbar-header">
                        <a className="img-responsive ImagenCabecera" href="#">
                            <img src={ urlInstalacion + "/Content/img/logotec_blanco.png"} alt=""/>
                        </a>
                    </div>
                </div>
                    {/* -- Fin Logo TEC -->*/}
            </div>
            {loginUsuario
                ?
                <div className="CabeceraSistema">
                    <label className="fuenteTituloSistema"> { nombreAplicacion}</label>
                        <Form inline className="float-right mr-3">
                        {/* Usuario: {loginUsuario}*/}
                        {/* <FormControl type="text" placeholder="Buscar" className="mr-sm-2" />
                        <Button variant="outline-success">Buscar</Button> */}
                        {/* <button onClick={salir}>Salir</button>*/}
                            <div><a href={rutaRaiz}><span onClick={salir} className="NombreUsuario"><img className="" src={ urlInstalacion + "/Content/img/signout.png"} height="20" width="20"/> Cerrar sesión</span></a>
                            {/* <span onClick={salir} className="NombreUsuario"><img className="" src="../Content/img/signout.png" height="20" width="20"/> Cerrar sesión</span>*/}
                        </div>
                    </Form>

                </div>
                :
                        null
            }

        </div>
    );
}

export default Encabezado;