import React, { useState, useContext, useEffect } from 'react';
import { Link, withRouter, Redirect, useHistory } from 'react-router-dom';
																
import LoadingOverlay from 'react-loading-overlay';
import Button from 'react-bootstrap/Button';
import AppContext from '../context/AppContext';
import VisorEstado from './VisorEstado';
import Aplicacion from './Aplicacion/Aplicacion';
import '../Content/Site.css';
import './Login.css';
import { useLocalStorage } from './hooks/UseLocalStorage';
//import { Glyphicon } from 'react-bootstrap';

//import auth from '../utils/auth';

const Login = (props) => {
										   
    const [a, seta] = useLocalStorage("key_a", 'CxC')
    //estado global
    const estadoGlobal = useContext(AppContext);
    //debugger;
    //destructurar el estado global en los valores necesarios para el componente
    const { rutaApi, loginUsuario, nombreAplicacion, modoDesarrollo } = estadoGlobal;
    
    //estado local
    const [validando, setValidando] = useState(false);
    const [exitoMensajes, setExitoMensajes] = useState({
                                            exitoLogin : '',
                                            exitoOtro : ''
    });
    const [usuario, setUsuario] = useState("")
    const [clave, setClave] = useState("")
    const [formErrors, setFormErrors] = useState({
                                            errorUsuario : '',
                                            errorClave : '',
                                            errorCredenciales : '',
                                            errorGeneral : ''
    });

    //history para redireccionar al loguearse
    const history = useHistory();
    const urlInstalacion = process.env.PUBLIC_URL;

    const state = {
        estadoLocal : {
            usuario,
            clave,
            validando,
            exitoMensajes,
            formErrors
        },
    }


    const keyPressHandler = (evt) => {
        if (evt.key === "Enter") {
            submitForm(() => {
                //callback luego de la ejecucion
                //eliminado pues dentro de submitForm lo hace
                //history.push(urlInstalacion + "/inicio")
            })
        }
    };
    
    //en el evento actualiza el valor de la propiedad en el estado con el value del input correspondiente
    const changeHandler = (evt) => {
        ////debugger;
        //destructurar el objeto evt en variables individuales
        let {name, value} = evt.target;
        //alert(name);
        // alert(value);
        //obtener la referencia al objeto lista del estado local para colocar mensajes de error
        //let {formErrors} = state.estadoLocal;
        switch(name) {
            case 'usuario':    //validaciones del nombre de usuario
                if (!value || value.length === 0) {
                    //validación de requerido
                    formErrors.errorUsuario = 'Debe indicar su nombre de usuario';
                }
                else
                {
                    //no hay problema
                    formErrors.errorUsuario = '';
                    setUsuario(value)
                }
                break;
            case 'clave':    //validaciones de la clave
						   
                if (!value || value.length === 0) {
                    //validación de requerido
                    formErrors.errorClave = 'Debe indicar su contraseña';
                }
                else
                {
                    //no hay problema
                    formErrors.errorClave = '';
                    setClave(value)
                }
                break;
            default:
                break;
        }
        setFormErrors(formErrors);
    }

    const delay = ms => new Promise(res => setTimeout(res, ms));

    const esperar = (ms) => {
        //produce una espera de X milisegundos donde sea llamado
        setTimeout(() => {
        //setValidando(false)
        },
        ms)
    }
    const submitForm = async (event) => {
        //event.preventDefault();
        
        debugger;
        history.push('/Inicio');
        return
		
        if (!usuario){
            setFormErrors({
                ...formErrors,
                errorUsuario : "Debe indicar su nombre de usuario"
            })
            return;
        }
        if (!clave){
            setFormErrors({
                ...formErrors,
                errorClave : "Debe indicar su contraseña"
            })
            return;
        }
        setValidando(true)
        esperar(5000);
        var resAutenticar = await autenticar()
        if (resAutenticar)
        {
            setExitoMensajes({
                ...exitoMensajes,
                exitoLogin : 'usuario valido!',
                loginUsuario : usuario
            });
            //limpiar cualquier error que se hubiera dado antes
            setFormErrors({
                errorUsuario : '',
                errorClave : '',
                errorCredenciales : '',
                errorGeneral : ''
            });
            ////debugger;
            // setEstadoGlobal({
            //     ...EstadoGlobal,
            //     usuarioValido : true,
            //     idUsuario : resAutenticar.datosUsuario.IdUsuario,
            //     idTipoUsuario : resAutenticar.datosUsuario.IdTipoUsuario,
            //     loginUsuario : usuario,
            //     correoUsuario : resAutenticar.datosUsuario.CorreoElectronicoPrincipal,
            //     nombreUsuario : resAutenticar.datosUsuario.NombreCompleto,
            //     JWToken : resAutenticar.datosUsuario.JWToken,
            //     permisos : resAutenticar.datosPermisos,
            // })
            //quitar errores del estado, si los había
            setFormErrors({
                ...formErrors, 
                errorCredenciales : '',
            })
            ////debugger;
            setValidando(false);
            
            ////debugger;
            //guardar el estado global (item 0 que es el contenido)
            //estadoGlobal.guardarEstadoGlobalLocalStorage(estadoGlobal);
            
            debugger;
            //redireccionar al componente raíz DE LA APLICACION (no el de app)
            history.push(urlInstalacion + '/inicio')
        }

        //quitar el indicador de "validando..."
        setValidando(false);
    }

    const autenticar = async () => {
        var res = null;
        debugger;

        

        const requestOptions = {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
                "usuario": usuario,
                "clave" : clave
            }
        };
        //await fetch("http://localhost:60000/api/login", {
        ////debugger;
        await fetch(rutaApi + "/login", requestOptions)/*{
            method: "post",
            mode: "cors",
            headers: {
                "Content-Type": "application/json",
                "usuario": usuario,
                "clave" : clave
            }
        })*/
        .then(async resFetch => {
            if (resFetch.ok) {
                var resFetchJson = await resFetch.json();

                //calcular nombre completo y token

                //en datosRespuesta ya quedarán datosUsuario y datosPermisos
                var datosRespuesta = JSON.parse(resFetchJson.ObjetoRespuesta);
                res = datosRespuesta;
            }
            else
            {
                setFormErrors({
                    ...formErrors, 
                    errorCredenciales : 'Credenciales incorrectas',
                })
                res = null
            }
        })
        .catch (resFetch => {
            ////debugger;
            if (resFetch.message.includes("Failed to fetch"))
            {
                setFormErrors({
                    ...formErrors, 
                    errorCredenciales : 'Servicio de autenticación no encontrado',
                })
            }
            else {
                setFormErrors({
                    ...formErrors, 
                    errorCredenciales : 'Credenciales incorrectas',
                })
            }

            
            res = null
        })


        return res;
    }
    
    return (
        <LoadingOverlay className="center-div-login" active={validando} spinner text='Validando...'>
            <div className="center-div-login">
                <div id="imgLogTec" className="styleLogo">
                    {/* <img src="Content/img/banner-logueo1.png" alt="Ingresar"></img> */}
                </div>
                <div id="datosLogueo" className="">
                    <div>                    
                        <div className="row bordesTitulo">
                            <div id="nombreAppPortal" className="col-sm-12 text-center nombreAppPortal">
                                <h3>{nombreAplicacion}</h3>
                            </div>
                        </div>
                        <form role="form" name="formAutenticarUsuario" className="formAutenticarUsuario">
                            <div className="componente_input input-group">                                
                                <div className="col-sm-1 nopadding"><img className="ImagenIcono" src={ urlInstalacion + "/Content/img/icon_user.svg"} height="30" width="30"/></div>
                                <div className="col-sm-11 nopadding"><input type="text" name="usuario" placeholder="Nombre" className="form-control" autoFocus onKeyPress={keyPressHandler} onChange={changeHandler} /></div>
                            </div>
                            <div className="componente_input input-group">
                                <div className="col-sm-1 nopadding"><img className="ImagenIcono" src={ urlInstalacion + "/Content/img/icon_lock.svg"} height="30" width="30"/></div>
                                <div className="col-sm-11 nopadding"><input type="password" name="clave" placeholder="Contraseña" className="form-control" onKeyPress={keyPressHandler} onChange={changeHandler}/></div>
                            </div>
                            <div className="componente_button">
                                <br/>
                                <Button variant="primary" className="btn btn-primary btn btn-generadoNew hoverShadowBuscar" onClick={() => {submitForm(() => {
                                                                                    //callback luego de la ejecucion
                                                                                    //eliminado pues dentro de submitForm lo hace
                                                                                    //history.push(urlInstalacion + "/inicio")
                                                                                })}}>Ingresar</Button>
                            </div>
                            <ul>
                            {
                                Object.values(formErrors).map((item, key) => {
                                    if (item)
                                        return <li key={key} className="text-danger">{item}</li>    
                                })
                            }
                            </ul>
                            <div className="text-danger"></div>                    
                        </form>
                    </div>                

                </div>
            </div>
            {modoDesarrollo ?
                <VisorEstado estado={state.estadoLocal} titulo="Estado Local" estilo="fijoDerechaBottom"/>
            : null}
        </LoadingOverlay>
    )
											
}


export default withRouter(Login);