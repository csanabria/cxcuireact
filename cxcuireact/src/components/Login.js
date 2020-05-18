import React, { useState, useContext, useEffect } from 'react';
import { withRouter, useHistory } from 'react-router-dom';
																
import LoadingOverlay from 'react-loading-overlay';
import Button from 'react-bootstrap/Button';
import AppContext from '../Context/AppContext';
import VisorEstado from './VisorEstado';
import LogoTEC from '../Content/img/logotec_blanco.png'
import ImgLogin from '../Content/img/banner-logueo.png'
import '../Content/css/Site.css';
import './Login.css';

const Login = (props) => {
    const history = useHistory();
    // ESTADO APP
    const {estadoApp, setEstadoApp} = useContext(AppContext);
//    debugger;
    //useEffect(() => setEstadoApp({...estadoApp, JWToken: '2', nombreUsuario:"Prueba Nombre"}), []);
    //debugger;
    //destructurar el estado global en los valores necesarios para el componente
    const { rutaApi, nombreAplicacion, modoDesarrollo, usarApi } = estadoApp;

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
    //const history = useHistory();
    const urlInstalacion = process.env.PUBLIC_URL;

    const estadoGlobal = estadoApp;
    const estadoLocal = {
        usuario,
        clave,
        validando,
        exitoMensajes,
        formErrors
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
        event.preventDefault();
        setValidando(true)
		
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
        //delay o esperar?? ambas están definidas, hay que ver cual versión sirve mejor
        delay(5000);
        esperar(5000);
        //debugger;
        var resAutenticar = await autenticar()
        
        if (resAutenticar)
        {
            setExitoMensajes({
                ...exitoMensajes,
                exitoLogin : 'usuario valido!',
                loginUsuario : usuario
            });
            //debugger;
            setEstadoApp(
                {
                    ...estadoApp, 
                    ...resAutenticar
                }
            );
            //limpiar cualquier error que se hubiera dado antes
            setFormErrors({
                errorUsuario : '',
                errorClave : '',
                errorCredenciales : '',
                errorGeneral : ''
            });
            //quitar errores del estado, si los había
            setFormErrors({
                ...formErrors, 
                errorCredenciales : '',
            })
            setValidando(false);
            //temp
            
            history.push(urlInstalacion + "/inicio")
        }

        //quitar el indicador de "validando..."
        setValidando(false);
    }

    const autenticar = async () => {
        var res = null;
        //debugger;
        const requestOptions = {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
                "usuario": usuario,
                "clave" : clave
            }
        };
        //debugger;
        if (usarApi)
        {
            await fetch(rutaApi + "/login", requestOptions)
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
                    if (resFetch.statusText === "Not Found") {
                        setFormErrors({
                            ...formErrors, 
                            errorCredenciales : 'Servicio de autenticación no encontrado',
                        })
                    }
                    else
                    {
                        setFormErrors({
                            ...formErrors, 
                            errorCredenciales : 'Credenciales incorrectas',
                        })
                    }
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
        } //if usarAPI
        else
        {
            res = {
                usuarioValido : true,
                idUsuario : usuario,
                idTipoUsuario : 1,
                loginUsuario : usuario,
                identificacionUsuario : '102340567',
                correoUsuario : 'usuario@itcr.ac.cr',
                nombreUsuario : 'Nombre completo del Usuario',
                campusCentroAcademicoUsuario : 'Nombre del Campus o CA',
                tesoreriaUsuario : 'Nombre de la tesorería',
                cajaUsuario : 99,
                JWToken : "3",
                usuarioValido: true,
                permisos : {}
            };
        }


        return res;
    } //autenticar
    return(
        <>
            {modoDesarrollo || true 
            ?
                <>
                    <VisorEstado estado={estadoApp} titulo="Estado Global" estilo="fijoDerechaBottom"/>
                    <VisorEstado estado={estadoLocal} titulo="Estado Local" estilo="fijoIzquierdaBottom"/>
                </>
            : null}
            <div className="center-div-login">
                
                <div className="styleLogo">
                    <img src={ImgLogin} alt="logo" />
                    <div id="datosLogueo" className="">
                            <div>                    
                                <div className="row bordesTitulo">
                                    <div id="nombreAppPortal" className="col-sm-12 text-center nombreAppPortal">
                                        <h3>{nombreAplicacion}</h3>
                                    </div>
                                </div>
                                <form name="formAutenticarUsuario" className="formAutenticarUsuario">
                                    <div className="componente_input input-group">                                
                                        <div className="col-sm-1 nopadding"><img className="ImagenIcono" alt="" src={ urlInstalacion + "/Content/img/icon_user.png"} height="30" width="30"/></div>
                                        <div className="col-sm-11 nopadding"><input type="text" name="usuario" placeholder="Nombre" className="form-control" autoFocus onKeyPress={keyPressHandler} onChange={changeHandler} /></div>
                                    </div>
                                    <div className="componente_input input-group">
                                        <div className="col-sm-1 nopadding"><img className="ImagenIcono" alt="" src={ urlInstalacion + "/Content/img/icon_lock.png"} height="30" width="30"/></div>
                                        <div className="col-sm-11 nopadding"><input type="password" name="clave" placeholder="Contraseña" className="form-control" onKeyPress={keyPressHandler} onChange={changeHandler}/></div>
                                    </div>
                                    <div className="componente_button">
                                        <br/>
                                        <Button variant="primary" className="btn btn-primary btn btn-generadoNew hoverShadowBuscar" onClick={submitForm}>Ingresar</Button>
                                    </div>
                                    <ul>
                                    {
                                        Object.values(formErrors).map((item, key) => {
                                            if (item)
                                                return <li key={key} className="text-danger">{item}</li>  
                                            else
                                                return null  
                                        })
                                    }
                                    </ul>
                                    <div className="text-danger"></div>                    
                                </form>
                            </div>
                        </div>
                </div>
            </div>
        </>
    ); 
    return (
        <AppContext.Consumer>
            {(context) => (
                <LoadingOverlay className="center-div-login" active={validando} spinner text='Validando...'>
                    <div className="center-div-login">
                        <div id="imgLogTec" className="styleLogo" />
                        <img src={LogoTEC} alt="logo" />
                        <div id="datosLogueo" className="">
                            <div>                    
                                <div className="row bordesTitulo">
                                    <div id="nombreAppPortal" className="col-sm-12 text-center nombreAppPortal">
                                        <h3>{context.nombreAplicacion}</h3>
                                    </div>
                                </div>
                                <form name="formAutenticarUsuario" className="formAutenticarUsuario">
                                    <div className="componente_input input-group">                                
                                        <div className="col-sm-1 nopadding"><img className="ImagenIcono" alt="" src={ urlInstalacion + "/Content/img/icon_user.png"} height="30" width="30"/></div>
                                        <div className="col-sm-11 nopadding"><input type="text" name="usuario" placeholder="Nombre" className="form-control" autoFocus onKeyPress={keyPressHandler} onChange={changeHandler} /></div>
                                    </div>
                                    <div className="componente_input input-group">
                                        <div className="col-sm-1 nopadding"><img className="ImagenIcono" alt="" src={ urlInstalacion + "/Content/img/icon_lock.png"} height="30" width="30"/></div>
                                        <div className="col-sm-11 nopadding"><input type="password" name="clave" placeholder="Contraseña" className="form-control" onKeyPress={keyPressHandler} onChange={changeHandler}/></div>
                                    </div>
                                    temp
                                    <div className="componente_button">
                                        <br/>
                                        <Button variant="primary" className="btn btn-primary btn btn-generadoNew hoverShadowBuscar" onClick={() => {submitForm(() => {
                                                                                            //callback luego de la ejecucion
                                                                                            //eliminado pues dentro de submitForm lo hace
                                                                                            //history.push(urlInstalacion + "/inicio")
                                                                                        })}}>Ingresar1</Button>
                                    </div>
                                    <ul>
                                    {
                                        Object.values(formErrors).map((item, key) => {
                                            if (item)
                                                return <li key={key} className="text-danger">{item}</li>  
                                            else
                                                return null  
                                        })
                                    }
                                    </ul>
                                    <div className="text-danger"></div>  
                                </form>
                            </div>
                        </div>
                    </div>
                    
                </LoadingOverlay>
            )}  //fin del uso del estadoGlobal
        </AppContext.Consumer>
    );										
}


export default Login;// withRouter(Login);