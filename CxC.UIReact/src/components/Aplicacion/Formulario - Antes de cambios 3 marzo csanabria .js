import React,{Component} from 'react';
import {Button} from 'react-bootstrap';
import VisorEstado from '../VisorEstado';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.min.js';
import Listados from './components/Listados.js'
import PiePagina from '../PiePagina';
import './Formulario.css';
import '../Encabezado.css';
import './Modal.css'
import Modal from 'react-modal';
import Table from 'react-bootstrap/Table'
import {Redirect} from "react-router-dom";
//contexto global de la aplicación
import AppContext from '../../context/AppContext';
//import CurrencyInput from 'react-currency-masked-input'
import CurrencyInput from 'react-currency-input';


// Referencia:
    // Evitar renderizar: https://es.reactjs.org/docs/faq-functions.html

    //Nota: Evaluar el uso de Props para pasar datos entre pantallas
class FormularioOld extends Component {
  
  // Carga el contexto
  static contextType = AppContext;

  // Constructor del Formulario
  constructor (props, context) {

    // Validacion de Permisos
    super(props, context)
    const [E2stadoGlobal] = this.context;
    this.estadoGlobal = context[0];
    const {modoDesarrollo, permisosApp, rutaApi, urlInstalacion} = this.estadoGlobal;

    //ponerlo a nivel de clase para accederlo en el render()
    this.modoDesarrollo = modoDesarrollo;
    this.urlInstalacion = urlInstalacion;
    
    const contexto = this.estadoGlobal;

    if (this.props.location.state.pidAccion === "1") {
      //llamada a la función TienePermiso de ambito global
      let promise = new Promise(function(resolve, reject) {
        resolve(contexto.TienePermiso(contexto,permisosApp.DetalleLicencia));
      }).then( res => {
        if (!res){
          props.history.push('/licencias')
        }
      });

    } else {
      if (this.props.location.state.pidAccion === "2") {
        //llamada a la función TienePermiso de ambito global
        let promise = new Promise(function(resolve, reject) {
          resolve(contexto.TienePermiso(contexto,permisosApp.ModificarLicencia));
        }).then( res => {          
          if (!res){
            props.history.push('/licencias')
          }          
        });

      } else {
          if (this.props.location.state.pidAccion === "3") {
            //llamada a la función TienePermiso de ambito global
            let promise = new Promise(function(resolve, reject) {
              resolve(contexto.TienePermiso(contexto,permisosApp.RenovarLicencia));
            }).then( res => {          
              if (!res){
                props.history.push('/licencias')
              }          
            });

          } else {
              if (this.props.location.state.pidAccion === "4") {
                //llamada a la función TienePermiso de ambito global
                let promise = new Promise(function(resolve, reject) {
                  resolve(contexto.TienePermiso(contexto,permisosApp.NuevaLicencia));
                }).then( res => {
                  if (!res){
                    props.history.push('/licencias')
                  }              
                });
              } 
          }
        }
    }
  
    // Estado
    this.state = {

      //PROPIEDADES

      // Parametros
      PeriodicidadPermanente: 0,
      CodigoPeriodicidadPermanente: 2,
      CodigoLicenciaInactiva: 3,
      EstadoLicenciaInactiva: 8,

      // Datos de la Licencia
        // Api
      DatosLicencia: [],
      GruposLicencia: [],
      FormasLicenciamiento:[],
      ContactosEntidad:[],
      ContactosProveedor:[],
      Entidades:[],
      Estados:[],
      PeriodicidadLicenciamiento:[],
      PrioridadLicenciamiento:[],
      Proveedores:[],
      UsosLicencia:[],

      // Obtiene solo estados de la Licencia
      idTipoEstado: 3,
      // Obtiene solo estados de contactos del proveedor
      idTipoEstadoCProveedor: 4,
      // Obtiene solo estados de contactos de la entidad
      idTipoEstadoCEntidad: 5,

      // Valor para SoloLectura: disabled or ""
      SoloLectura:"", 

      // Indicador si es una renovacion o una edición
      EsRenovacion:false, 
      IdLicenciaRenovada:0,

      // Indicador es nueva licencia
      EsNueva:false, 

      // Indicador es una actualización de licencia
      EsEdicion:false, 

       // Especifico
      IdLicencia:0,
      IdGrupoLicencias:1,
      IdUsoLicencia:1,
      IdFormaLicenciamiento:1,
      IdPeriodicidad:2,
      IdPrioridad:2,
      IdEstado:1,
      FechaRegistro: new Date(),
      FechaDisponible: new Date(),
      FechaVencimiento: new Date(),
      NombreSoftware: "",
      URL: "",
      Descripcion: "",
      Version: "",
      Edicion: "",
      Cantidad: 0,
      Costo: 0,
      NumOrdenCompra: "",
      IdEstadoLicencia: 0,
      OtroGrupo: "",
      MuestraOtro:false,

      // Atributos para Modales
      open: false,
      openEntidad: false,
          
      // Datos de Contactos Proveedor
        // Proveedor
      IdContactoProveedor:0,
      IdProveedor:0,
      NombreContactoProveedor:"",
      CorreoContactoProveedor:"",
      TelefonoContactoProveedor:"",
      EstadoContactoProveedor:1,
      MuestraOtroProveedor:false,
      OtroProveedor:"",
      EsNuevoProveedor:false,
      EstadosCProveedor:[],

        // Entidad
      IdSolicitanteLicencias:0,
      IdEntidad:0,
      Entidad:"",
      Nombre:"",
      NombreEntidad:"",
      Correo:"",
      Telefono:"",
      EstadoContacto:1,
      SolicitudPrimariaChequeada:false,
      EsNuevaEntidad:false,
      EstadosSolicitud:[],
      ObservacionesContactoE:[],
      NumOrdenCompraE:[],
      CantidadE:[],

      // Mensajes
      MuestreMensajes: false,
      Mensajes:"",
      
      // Errores
      MuestreErrores: false,
      Errores:"",

      // Contactos
      MuestreErroresProveedor: false,
      ErroresContactoProveedor:"",
      MuestreErroresEntidad: false,
      ErroresContactoEntidad:"",

      // Ruta del API
      rutaAPI: rutaApi,

      // Redireccionamiento
      redirect: true,

      // Nombre
      TituloAccion: "Actualizar"
      
    }  
      
    // Enlace a Metodos
    this.ModalEntidad = this.ModalEntidad.bind(this);
    this.ModalProveedor = this.ModalProveedor.bind(this);
    this.AcordeonFormulario = this.AcordeonFormulario.bind(this);
    this.ObtieneContactosProveedor = this.ObtieneContactosProveedor.bind(this);
    this.ObtieneContactosEntidad = this.ObtieneContactosEntidad.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleChangeCosto = this.handleChangeCosto.bind(this);
    this.handleChangeGrupo = this.handleChangeGrupo.bind(this);
    this.handleChangeProveedor = this.handleChangeProveedor.bind(this);    
    this.handleButtonGuardarFormulario = this.handleButtonGuardarFormulario.bind(this);
    this.handleButtonGuardarProveedor = this.handleButtonGuardarProveedor.bind(this);    
    this.handleButtonGuardarCliente = this.handleButtonGuardarCliente.bind(this);    
    this.handleChangeSolicitudPrimaria = this.handleChangeSolicitudPrimaria.bind(this);
    this.validateURL = this.validateURL.bind(this);
    this.validateEmail = this.validateEmail.bind(this);    
    this.goBack = this.goBack.bind(this);
  }
 
  // Redirección

  // Acción de refresar
  setRedirectFalse = () => {
    //debugger;
    this.setState({
      redirect: false
    })
  }

  // Regresar
  goBack(){
    //debugger;
    this.props.history.goBack();
  }

  renderRedirect = () => {
    //debugger;
    var ruta = this.urlInstalacion + "/licencias"
    if (!this.state.redirect) {
       return <Redirect to={ruta} />
    }
  }

  /*
  componentWillReceiveProps(nextProps) {
    if (nextProps.state.author === undefined) {
        this.props.author = {
            author: {
                id: '',
                firstName: '',
                lastName: '',

            }
        };
    }
  }
*/
  /// <summary>
    /// componentDidMount: Método que se invoca inmediatamente después del DOM
    ///    Carga los datos de la Licencia en las propiedades del State
    /// Referencia: https://reactjs.org/docs/react-component.html#componentdidmount 
    //     En Español: https://es.reactjs.org/tutorial/tutorial.html
    /// <returns>Actualiza el State</returns>

  componentDidMount() {

    // Valida si se pasaron props
    if (this.props.location.state){    
      /* Obtiene el Id de Licencia selecciona y el tipo de acción*/
      if (this.props.location.state.pidAccion === "1") {
        this.setState({
          SoloLectura: "disabled",
          TituloAccion: "Consultar"
        })
      } else {
        if (this.props.location.state.pidAccion === "3") {
          this.setState({
            EsRenovacion: true,
            IdLicenciaRenovada: this.props.location.state.pidLicencia,
            TituloAccion: "Renovar"
          })
        }  else {
            if (this.props.location.state.pidAccion === "4") {
              this.setState({
                EsNueva: true,
                TituloAccion: "Crear"
              })
            } 
        }
      }
    } 

    // Ejecuta dentro de un control de excepciones
    try {

      // Obtiene Parametros
      // API PRIVADA: http://localhost:60000/api/parametro
      fetch(this.state.rutaAPI + '/parametro',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'codigoParametro':this.state.CodigoPeriodicidadPermanente
          }
       }).then(response =>  response.json())
      .then(resData => {
          if (resData.Datos != null  && typeof(resData.Datos[0]) !== 'undefined') {
            this.setState({ PeriodicidadPermanente: resData.Datos[0].Valor }); //this is an asynchronous function
          }
      })        

      // Obtiene parametro para licencias inactivas
      fetch(this.state.rutaAPI + '/parametro',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'codigoParametro':this.state.CodigoLicenciaInactiva
          }
      }).then(response =>  response.json())
      .then(resData => {
        if (resData.Datos != null  && typeof(resData.Datos[0])) {
          this.setState({ EstadoLicenciaInactiva: resData.Datos[0].Valor }); 
        }
      })        
   
      // Grupos de Licencias

      // https://api.myjson.com/bins/qvfpw
      // API Privada: http://localhost:60000/api/grupolicencias
      
      fetch(this.state.rutaAPI + '/grupolicencias/')
      .then(response =>  response.json())
      .then(resData => {
          //console.log(JSON.stringify(resData))
          this.setState({ GruposLicencia: resData.Datos }); //this is an asynchronous function
      })        

      // Formas Licenciamiento
      //https://api.myjson.com/bins/y0mz8
      //API Privada: http://localhost:60000/api/formalicenciamiento
      fetch(this.state.rutaAPI + '/formalicenciamiento')
      .then(response =>  response.json())
      .then(resData => {
        this.setState({ FormasLicenciamiento: resData.Datos }); //this is an asynchronous function
      })        

      // Contactos Entidad
      // https://api.myjson.com/bins/vtc1g
      // API Privada: http://localhost:60000/api/solicitantelicencia
      fetch(this.state.rutaAPI + '/solicitantelicencia',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idLicencia':this.props.location.state.pidLicencia!== 'undefined'?this.props.location.state.pidLicencia:this.state.IdLicencia
          }
       }).then(response =>  response.json())
      .then(resData => {
        this.setState({ ContactosEntidad: resData.Datos }); //this is an asynchronous function
      })        

      // Contactos Proveedor
      //alert("Obtiene Contactos del Proveedor");
      // https://api.myjson.com/bins/cabec
      // API Privada: http://localhost:60000/api/contactoproveedor
      fetch(this.state.rutaAPI + '/contactoproveedor',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idLicencia':this.props.location.state.pidLicencia!== 'undefined'?this.props.location.state.pidLicencia:this.state.IdLicencia
          }
       }).then(response =>  response.json())
      .then(resData => {
        this.setState({ ContactosProveedor: resData.Datos }); //this is an asynchronous function
      })       

      // Entidades
      //https://api.myjson.com/bins/10p378
      // API Privada: http://localhost:60000/api/wcfexterno
      fetch(this.state.rutaAPI + '/obtieneentidades')
      .then(response =>  response.json())
      .then(resData => {        
        this.setState({ Entidades: resData.Datos }); //this is an asynchronous function
      })        

      // Estados
      //https://api.myjson.com/bins/fj4ni
      // API Privada =  http://localhost:60000/api/estados
      fetch(this.state.rutaAPI + '/estados',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idTipoEstado':this.state.idTipoEstado
          }
       }).then(response =>  response.json())
      .then(resData => {
          this.setState({ Estados: resData.Datos }); //this is an asynchronous function

          if (this.state.EsNueva === true) {
            var IdEstadoNuevo = (resData.Datos!=null && ((typeof(this.state.Estados[0]) !== 'undefined' || this.state.Estados[0] != null))? this.state.Estados[0].IdEstado:this.state.IdEstado);
            this.setState({ IdEstado: IdEstadoNuevo, IdEstadoLicencia: IdEstadoNuevo });
          }      
      })        

      // Estados Solicitudes - SolicitanteEntidad
      //https://api.myjson.com/bins/fj4ni
      // API Privada: http://localhost:60000/api/estados
      fetch(this.state.rutaAPI + '/estados',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idTipoEstado':this.state.idTipoEstadoCEntidad
          }
        }).then(response =>  response.json())
      .then(resData => {
          this.setState({ EstadosSolicitud: resData.Datos }); //this is an asynchronous function
      })        

      // Estados Contactos Proveedor
      //https://api.myjson.com/bins/fj4ni
      // API Privada: http://localhost:60000/api/estados
      fetch(this.state.rutaAPI + '/estados',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idTipoEstado':this.state.idTipoEstadoCProveedor
          }
        }).then(response =>  response.json())
      .then(resData => {
          this.setState({ EstadosCProveedor: resData.Datos }); //this is an asynchronous function
      })        

      // Periodicidades
      // https://api.myjson.com/bins/pzab8
      // API Privada: http://localhost:60000/api/periodicidad

      fetch(this.state.rutaAPI + '/periodicidad')
      .then(response =>  response.json())
      .then(resData => {
        //alert(resData.Datos);
          this.setState({ PeriodicidadLicenciamiento: resData.Datos }); //this is an asynchronous function
      })        

      // Prioridades
      // API Privada: http://localhost:60000/api/prioridad
      
      //https://api.myjson.com/bins/sd0qc
      fetch(this.state.rutaAPI + '/prioridad')
      .then(response =>  response.json())
      .then(resData => {
          this.setState({ PrioridadLicenciamiento: resData.Datos }); //this is an asynchronous function
      })        

      // Proveedores
      //https://api.myjson.com/bins/1hfdas
      // API Privada: http://localhost:60000/api/proveedor
      fetch(this.state.rutaAPI + '/proveedor')
      .then(response =>  response.json())
      .then(resData => {
          this.setState({ Proveedores: resData.Datos }); //this is an asynchronous function
      })        

      // Usos Licencia
      //https://api.myjson.com/bins/lc3sk
      // API Privada: http://localhost:60000/api/usolicencia
      fetch(this.state.rutaAPI + '/usolicencia')
      .then(response =>  response.json())
      .then(resData => {
          this.setState({ UsosLicencia: resData.Datos }); //this is an asynchronous function
      })        

      // Si es un nueva se limpia el estado 
      if ((this.state.EsNueva)||(this.props.location.state && this.props.location.state.pidAccion === "4")) {
        this.setState({ IdLicencia: 0,
          NombreSoftware: "",
          URL: "",
          Descripcion: "",
          Version: "",
          Edicion: "",
          IdUsoLicencia: 1,
          IdFormaLicenciamiento: 1,
          IdPeriodicidad: 1,
          IdPrioridad: 1,
          Cantidad: "",
          Costo: "",
          NumOrdenCompra: "",
          FechaRegistro: new Date(),
          FechaDisponible: new Date(),
          FechaVencimiento: new Date(),
          IdGrupoLicencias: 1,
          IdEstado: 1 })          
      } else {
        // Carga datos desde API
          // Obtiene los datos de la Licencia, desde el API

          // API PRIVADA: http://localhost:60000/api/licencias
          fetch(this.state.rutaAPI + '/licencias', 
          {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'idLicencia':this.props.location.state.pidLicencia!== 'undefined'?this.props.location.state.pidLicencia:this.state.IdLicencia
            }
          }).then(response =>  response.json())
          .then(resData => {

              ////debugger;
              if (resData.Datos != null) {
                  this.setState({ DatosLicencia: resData.Datos[0] }); //this is an asynchronous function
                  this.setState({ IdLicencia: resData.Datos[0].IdLicencia,
                  NombreSoftware: resData.Datos[0].Nombre,
                  URL: resData.Datos[0].Url,
                  Descripcion: resData.Datos[0].Descripcion,
                  Version: resData.Datos[0].Version,
                  Edicion: resData.Datos[0].Edicion,
                  IdUsoLicencia: resData.Datos[0].IdUsoLicencia,
                  IdFormaLicenciamiento: resData.Datos[0].IdFormaLicenciamiento,
                  IdPeriodicidad: resData.Datos[0].IdPeriodicidad,
                  IdPrioridad: resData.Datos[0].IdPrioridad,
                  Cantidad: resData.Datos[0].Cantidad,
                  Costo: resData.Datos[0].Costo,
                  NumOrdenCompra: resData.Datos[0].NumOrdenCompra,
                  FechaRegistro: new Date(resData.Datos[0].FechaRegistro),
                  FechaDisponible: new Date(resData.Datos[0].FechaDisponible),
                  FechaVencimiento: resData.Datos[0].FechaVencimiento!= null?new Date(resData.Datos[0].FechaVencimiento):new Date(resData.Datos[0].FechaDisponible),
                  IdGrupoLicencias: resData.Datos[0].IdGrupoLicencias,
                  IdEstado: resData.Datos[0].IdEstado })   
              }       
            })             

          // Si es una Renovación se reinician las fechas
          if (this.state.EsRenovacion){
            this.setState({ 
              FechaRegistro: new Date(),
              FechaDisponible: new Date(),
              FechaVencimiento: new Date() })        
          }
      } // Fin del Else  

    // Catch para el manejo de errores
    } catch (error) {
      this.setState({ Errores: this.state.Errores + error.message, MuestreErrores: true, MuestreMensajes: false });
    }
 } // Fin de Método componentDidMount

  cargaLicencia(pidLicencia){
    try {

      // Grupos de Licencias
      // API Privada: http://localhost:60000/api/grupolicencias
      fetch(this.state.rutaAPI + '/grupolicencias/')
      .then(response =>  response.json())
      .then(resData => {
          //console.log(JSON.stringify(resData))
          this.setState({ GruposLicencia: resData.Datos }); //this is an asynchronous function
      })        

      // Obtiene los datos de la Licencia, desde el API
      // API PRIVADA: http://localhost:60000/api/licencias
      fetch(this.state.rutaAPI + '/licencias', 
      {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'idLicencia':pidLicencia
        }
        }).then(response =>  response.json())
        .then(resData => {
          //debugger;
          // Si no hay datos refiere a un error, no se cargaron datos
          if (resData.Status !== -1 && resData.Datos !== null){
            this.setState({ DatosLicencia: resData.Datos[0] }); //this is an asynchronous function
            this.setState({ IdLicencia: resData.Datos[0].IdLicencia,
            NombreSoftware: resData.Datos[0].Nombre,
            URL: resData.Datos[0].Url,
            Descripcion: resData.Datos[0].Descripcion,
            Version: resData.Datos[0].Version,
            Edicion: resData.Datos[0].Edicion,
            IdUsoLicencia: resData.Datos[0].IdUsoLicencia,
            IdFormaLicenciamiento: resData.Datos[0].IdFormaLicenciamiento,
            IdPeriodicidad: resData.Datos[0].IdPeriodicidad,
            IdPrioridad: resData.Datos[0].IdPrioridad,
            Cantidad: resData.Datos[0].Cantidad,
            Costo: resData.Datos[0].Costo,
            NumOrdenCompra: resData.Datos[0].NumOrdenCompra,
            FechaRegistro: new Date(resData.Datos[0].FechaRegistro),
            FechaDisponible: new Date(resData.Datos[0].FechaDisponible),
            FechaVencimiento: resData.Datos[0].FechaVencimiento!= null?new Date(resData.Datos[0].FechaVencimiento):new Date(resData.Datos[0].FechaDisponible),
            IdGrupoLicencias: resData.Datos[0].IdGrupoLicencias,
            IdEstado: resData.Datos[0].IdEstado })                     
          }
        })             
    } catch (error) {
        this.setState({ Errores: error.message, MuestreErrores: true, MuestreMensajes: false });
    }    
  }  

  /// <summary>
  /// validateURL: Este metodo valida un URL
  validateURL(valorURL) {
    //var pattern = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
    var pattern =  /^(?:(?:https?|ftp):\/\/)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/\S*)?$/;

    if (pattern.test(valorURL)) {
        //alert("Url es Válida");
        return true;
    } else  {
        //alert("Url no es válida!");
        return false;
    }
  } 

  /// validateEmail: Este metodo valida un email
  validateEmail (email) {
    var pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (pattern.test(email)) {
        //alert("Email Válido");
        return true;
    } else  {
        //alert("Email no es válido!");
        return false;
    }
  }  

  handleChangeCosto(event, maskedvalue, floatvalue){
    this.setState({Costo: maskedvalue});
  }

  // Valida valores numerales
  handleChange (evt) {
    // check it out: we get the evt.target.name
    let {name, value} = evt.target;

    if (name === "Cantidad"){ 
      // Valida que sean solo numeros en el input
      const valor = (evt.target.validity.valid) ? evt.target.value : this.state.Cantidad;
      this.setState({ [name]: valor });
    } else { 
      this.setState({ [name]: value });
    }

    if (name === "IdEntidad"){ 
      // Obtiene Nombre
      var index = evt.nativeEvent.target.selectedIndex;
      const nombreEntidad = evt.nativeEvent.target[index].text;

      this.setState({ NombreEntidad: nombreEntidad });
    }

    if (name === "Costo"){ 
      // Valida que sean solo numeros en el input
      if (value !=="" && !Number(value)) {
        this.setState({ [name]: this.state.Costo });
      } else { 
        this.setState({ [name]: value });
      } 
    }      

    if (name === "IdPeriodicidad"){ 
      // Valida que sean solo numeros en el input
      //alert("Periodicidad");
    }          
  }

  // Cambia el valor del indicador de Solicitud Primaria
  handleChangeSolicitudPrimaria() {
    this.setState({
      SolicitudPrimariaChequeada: !this.state.SolicitudPrimariaChequeada
    })
  }

  handleChangeGrupo (evt) {
    // check it out: we get the evt.target.name
    this.setState({ [evt.target.name]: evt.target.value });

    // Si selecciona la opcion de Otro (value 0) se habilita componente
    if (evt.target.value === "0"){
      this.setState({ MuestraOtro:true });
    } else {
      this.setState({ MuestraOtro:false });
    }
  }

  handleChangeProveedor (evt) {
    // check it out: we get the evt.target.name
    this.setState({ [evt.target.name]: evt.target.value });

    // Si selecciona la opcion de Otro (value 0) se habilita componente
    if (evt.target.value === 0){
      this.setState({ MuestraOtroProveedor:true });
    } else {
      this.setState({ MuestraOtroProveedor:false });
    }
  }

  // Carga los Contactos del Proveedor actualizados
  cargaContactos(){
    try {

      // Contactos Proveedor
      // https://api.myjson.com/bins/cabec
      // API Privada: http://localhost:60000/api/contactoproveedor
      fetch(this.state.rutaAPI + '/contactoproveedor',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idLicencia':this.props.location.state.pidLicencia!== 'undefined'?this.props.location.state.pidLicencia:this.state.IdLicencia
          }
       }).then(response =>  response.json())
      .then(resData => {
          this.setState({ ContactosProveedor: resData.Datos }); //this is an asynchronous function
      })       

      // Proveedores

      // API Privada: http://localhost:60000/api/proveedor
      fetch(this.state.rutaAPI + '/proveedor')
      .then(response =>  response.json())
      .then(resData => {
          this.setState({ Proveedores: resData.Datos }); //this is an asynchronous function
      })        

    } catch (error) {
      this.setState({ Errores: error.message, MuestreErrores: true, MuestreMensajes: false });
    }
  }

  // Boton de Guardar - Modal Proveedor
  handleButtonGuardarProveedor (evt) {
    evt.preventDefault();
    this.setState({ ErroresContactoProveedor: "" });
    var bHayErrores = false;
    var msgErrores = "";

    //alert("Id: " + this.state.IdContactoProveedor + "IdProveedor: " + this.state.IdProveedor + " Nombre: " + this.state.NombreContactoProveedor + " Otro P:" + this.state.OtroProveedor+ " Estado:" + this.state.EstadoContactoProveedor + " Otro:" + this.state.OtroProveedor);
 
    const bProveedorExiste = Array.isArray(this.state.Proveedores) && this.state.Proveedores.find(item => item.Nombre ===this.state.OtroProveedor);
    //this.setState({ showInOption: type ? type.name : null });
    if (bProveedorExiste) {
      msgErrores += " El Proveedor ya existe registrado.";
      bHayErrores = true;      
    }

    // Valida si email es valida
    if (this.validateEmail(this.state.CorreoContactoProveedor)=== false)
    {
      msgErrores += " El Correo Electrónico es Inválido.";
      bHayErrores = true;      

    } 
    
    if (bHayErrores){
      this.setState({ ErroresContactoProveedor: msgErrores });
      this.setState({ MuestreErroresProveedor:true });
    }
    else { // Si no hay errores, ejecuta la accion
      
      this.setState({ MuestreErroresProveedor:false });
    
        // Actualiza los datos del Contacto
        try {
          //https://api.myjson.com/bins/fj4ni

          //debugger;

          if (this.state.MuestraOtroProveedor) {
            // Verifica si se desea incluir un nuevo proveedor
            fetch(this.state.rutaAPI + '/insertaproveedor',
            {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    'nombre' : this.state.OtroProveedor,
                    'usuarioCreacion' : "pgamboa"
                }
            }).then(response =>  response.json())
              .then(resData => {
                  //debugger;
                  if (resData.Status=== -1)
                  {
                    this.setState({ ErroresContactoProveedor: "Se producto un error al ingresar el nuevo proveedor." });
                    this.setState({ MuestreErroresProveedor:true });
                  } else {
                      // Actualiza los contactos del proveedor
                      if (this.state.EsNuevoProveedor) {
                        //API Privada: http://localhost:60000/api/insertacontactoproveedor
          
                        fetch(this.state.rutaAPI + '/insertacontactoproveedor',
                          {
                              method: 'POST',
                              headers: {
                                  'Accept': 'application/json',
                                  'Content-Type': 'application/json',
                                  'idLicencia' : this.state.IdLicencia,
                                  'idProveedor' : resData.Datos[0],
                                  'nombre' : this.state.NombreContactoProveedor,
                                  'correoElectronico' : this.state.CorreoContactoProveedor,
                                  'telefono' : this.state.TelefonoContactoProveedor,
                                  'idEstado' : this.state.EstadoContactoProveedor,
                                  'usuarioCreacion' : "pgamboa"
                              }
                            }).then(response =>  response.json())
                          .then(resData => {
                            // Si no hay datos refiere a un error, no se cargaron datos
                            if (resData.Status === -1 || resData.Datos === null){
                              this.setState({ ErroresContactoProveedor: "Se producto un error al ingresar el nuevo contacto del proveedor." });
                              this.setState({ MuestreErroresProveedor:true });          
                            } else {
                              // Actualiza los contactos del proveedor
                              this.cargaContactos();
              
                              this.setState({ open: false });
                            }
                          })  
                      } else {
                        //API Privada: http://localhost:60000/api/actualizacontactoproveedor
                          fetch(this.state.rutaAPI + '/actualizacontactoproveedor',
                          {
                              method: 'POST',
                              headers: {
                                  'Accept': 'application/json',
                                  'Content-Type': 'application/json',
                                  'idLicencia' : this.state.IdLicencia,
                                  'idContactoProveedor' : this.state.IdContactoProveedor,
                                  'idProveedor' : resData.Datos[0],
                                  'nombre' : this.state.NombreContactoProveedor,
                                  'correoElectronico' : this.state.CorreoContactoProveedor,
                                  'telefono' : this.state.TelefonoContactoProveedor,
                                  'idEstado' : this.state.EstadoContactoProveedor,
                              }
                            }).then(response =>  response.json())
                          .then(resData => {
                              // Si no hay datos refiere a un error, no se cargaron datos
                              if (resData.Status === -1 || resData.Datos === null){
                                this.setState({ ErroresContactoProveedor: "Se producto un error al actualizar la información del contacto del proveedor." });
                                this.setState({ MuestreErroresProveedor:true });            
                              } else {
                                // Actualiza los contactos del proveedor
                                this.cargaContactos();
              
                                // Cierra el Modal
                                this.setState({ open: false });
                              }
                          })  
                      } 
                  }
            })  
          } 
          else {  
            // Si se selecciono un proveedor existente
            if (this.state.EsNuevoProveedor) {
              //API Privada: http://localhost:60000/api/insertacontactoproveedor

              fetch(this.state.rutaAPI + '/insertacontactoproveedor',
              {
                  method: 'POST',
                  headers: {
                      'Accept': 'application/json',
                      'Content-Type': 'application/json',
                      'idLicencia' : this.state.IdLicencia,
                      'idProveedor' : this.state.IdProveedor,
                      'nombre' : this.state.NombreContactoProveedor,
                      'correoElectronico' : this.state.CorreoContactoProveedor,
                      'telefono' : this.state.TelefonoContactoProveedor,
                      'idEstado' : this.state.EstadoContactoProveedor,
                      'usuarioCreacion' : "pgamboa"
                  }
                }).then(response =>  response.json())
              .then(resData => {
                // Si no hay datos refiere a un error, no se cargaron datos
                if (resData.Status === -1 || resData.Datos === null){
                  this.setState({ ErroresContactoProveedor: "Se producto un error al ingresar el nuevo contacto del proveedor." });
                  this.setState({ MuestreErroresProveedor:true });
                } else {

                  // Actualiza los contactos del proveedor
                  this.cargaContactos();

                  // Cierra el Modal
                  this.setState({ open: false });
                }
              })  
            } else {
              //API Privada: http://localhost:60000/api/actualizacontactoproveedor
              fetch(this.state.rutaAPI + '/actualizacontactoproveedor',
              {
                  method: 'POST',
                  headers: {
                      'Accept': 'application/json',
                      'Content-Type': 'application/json',
                      'idLicencia' : this.state.IdLicencia,
                      'idContactoProveedor' : this.state.IdContactoProveedor,
                      'idProveedor' : this.state.IdProveedor,
                      'nombre' : this.state.NombreContactoProveedor,
                      'correoElectronico' : this.state.CorreoContactoProveedor,
                      'telefono' : this.state.TelefonoContactoProveedor,
                      'idEstado' : this.state.EstadoContactoProveedor,
                  }
                }).then(response =>  response.json())
              .then(resData => {
                  // Si no hay datos refiere a un error, no se cargaron datos
                  if (resData.Status === -1 || resData.Datos === null){
                    this.setState({ ErroresContactoProveedor: "Se producto un error al actualizar el nuevo contacto del proveedor." });
                    this.setState({ MuestreErroresProveedor:true });
                  } else {
                    // Actualiza los contactos del proveedor
                    this.cargaContactos();

                    // Cierra el Modal
                    this.setState({ open: false });
                  }
              })  
            } 
          }
        } catch (error) {
          this.setState({ Errores: error.message, MuestreErrores: true, MuestreMensajes: false });
        }              
    }     
  }

  // Carga los Contactos del Solicitante actualizados
  cargaContactosSolicitante(){
    // Contactos Entidad
    try {

      // https://api.myjson.com/bins/vtc1g
      // API Privada: http://localhost:60000/api/solicitantelicencia
      fetch(this.state.rutaAPI + '/solicitantelicencia',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idLicencia':this.props.location.state.pidLicencia!== 'undefined'?this.props.location.state.pidLicencia:this.state.IdLicencia
          }
       }).then(response =>  response.json())
      .then(resData => {
          this.setState({ ContactosEntidad: resData.Datos }); //this is an asynchronous function
      })        
    } catch (error) {
      this.setState({ Errores: error.message, MuestreErrores: true, MuestreMensajes: false });
    }
  }

  // Boton de Guardar - Modal Cliente
  handleButtonGuardarCliente (evt) {
    evt.preventDefault();
    this.setState({ ErroresContactoEntidad: "" });
    //alert("Id: " + this.state.IdSolicitanteLicencias + "IdEntidad: " + this.state.IdEntidad + " Nombre: " + this.state.Nombre  + " Estado:" + this.state.EstadoContacto);

    // Valida si email es valida
    if (this.validateEmail(this.state.Correo)=== false)
    {
      this.setState({ ErroresContactoEntidad: this.state.ErroresContactoEntidad+ "El Correo Electrónico es Inválido." });
      this.setState({ MuestreErroresEntidad:true });
    } else {
      this.setState({ MuestreErroresEntidad:false });

        // Actualiza los datos del Contacto
        try {
          //https://api.myjson.com/bins/fj4ni

          if (this.state.EsNuevaEntidad) {
            // API Privada: http://localhost:60000/api/insertasolicitantelicencia
            fetch(this.state.rutaAPI + '/insertasolicitantelicencia',
            {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    "idEntidad": this.state.IdEntidad, 
                    "nombre": this.state.NombreEntidad === ""? this.BuscaNombreEntidad(this.state.Entidades, this.state.IdEntidad):this.state.NombreEntidad, 
                    "solicitudPrimaria": this.state.SolicitudPrimariaChequeada, 
                    "idLicencia": this.state.IdLicencia, 
                    "cantidad": this.state.CantidadE, 
                    "numOrdenCompra": this.state.NumOrdenCompraE, 
                    "observaciones": this.state.ObservacionesContactoE, 
                    "idEstado": this.state.EstadoContacto, 
                    "idPersona": this.state.IdPersona, 
                    "nombreContacto": this.state.Nombre, 
                    "correoContacto": this.state.Correo, 
                    "telefonoContacto": this.state.Telefono, 
                    'usuarioCreacion' : "pgamboa"
                }
              }).then(response =>  response.json())
            .then(resData => {
              // Si no hay datos refiere a un error, no se cargaron datos
              if (resData.Status === -1 || resData.Datos === null){
                this.setState({ ErroresContactoEntidad: "Se produjo un error al insertar un nuevo contacto del solicitante." });
                this.setState({ MuestreErroresEntidad:true });          
              } else {

                // Actualiza los contactos del solicitante
                this.cargaContactosSolicitante();

                // Cierra el Modal
                this.setState({ openEntidad: false });
              }
            })  

          } else {
            // API Privada: http://localhost:60000/api/actualizasolicitantelicencia
            fetch(this.state.rutaAPI + '/actualizasolicitantelicencia',
            {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    "idEntidad": this.state.IdEntidad, 
                    "nombre": this.state.NombreEntidad === ""? this.BuscaNombreEntidad(this.state.Entidades, this.state.IdEntidad):this.state.NombreEntidad, 
                    "solicitudPrimaria": this.state.SolicitudPrimariaChequeada, 
                    "idLicencia": this.state.IdLicencia, 
                    "cantidad": this.state.CantidadE, 
                    "numOrdenCompra": this.state.NumOrdenCompraE, 
                    "observaciones": this.state.ObservacionesContactoE, 
                    "idEstado": this.state.EstadoContacto, 
                    "idPersona": this.state.IdPersona, 
                    "nombreContacto": this.state.Nombre, 
                    "correoContacto": this.state.Correo, 
                    "telefonoContacto": this.state.Telefono, 
                    "idSolicitanteLicencias": this.state.IdSolicitanteLicencias,
                }
              }).then(response =>  response.json())
            .then(resData => {
                // Si no hay datos refiere a un error, no se cargaron datos
                if (resData.Status === -1 || resData.Datos === null){
                  this.setState({ ErroresContactoEntidad: "Se produjo un error al actualizar un nuevo contacto del solicitante." });
                  this.setState({ MuestreErroresEntidad:true });            
                } else {

                  // Actualiza los contactos del solicitante
                  this.cargaContactosSolicitante();

                  // Cierra el Modal
                  this.setState({ openEntidad: false });
                }
            })  
          }   
          
          // Carga nuevamente los contactos
          //this.cargaContactos();
          
        } catch (error) {
          this.setState({ Errores: error.message, MuestreErrores: true, MuestreMensajes: false });
        }    
      
    }     
  }
    
  // Boton de Guardar - Formulario
  handleButtonGuardarFormulario (evt) {
    evt.preventDefault();
    var msgErrores = "";
    var bHayErrores = false;

    const pFechaRegistro = this.state.FechaRegistro.getFullYear() + "/" + (this.state.FechaRegistro.getMonth() + 1) + "/" + this.state.FechaRegistro.getDate();
    const pFechaDisponible = this.state.FechaDisponible.getFullYear() + "/" + (this.state.FechaDisponible.getMonth() + 1) + "/" + this.state.FechaDisponible.getDate();
    const pFechaVencimiento = this.state.FechaVencimiento.getFullYear() + "/" + (this.state.FechaVencimiento.getMonth() + 1) + "/" + this.state.FechaVencimiento.getDate();
    var bLicenciaNueva = this.state.EsRenovacion? true:this.state.EsNueva;

    //debugger;

    // Realiza validaciones
    if ((this.state.URL !== "") && this.validateURL(this.state.URL)=== false)
    {
      msgErrores += " La URL es inválida.";
      bHayErrores = true;
    }

    if (this.state.Cantidad === "") 
    {
      msgErrores += " Debe digitar un valor para la Cantidad.";
      bHayErrores = true;
    }

    if (this.state.Costo === "") 
    {
      msgErrores += " Debe digitar un valor para el Costo.";
      bHayErrores = true;
    }

    if (this.state.NombreSoftware === "") 
    {
      msgErrores += " Debe digitar un valor para el Nombre de la licencia.";
      bHayErrores = true;
    }

    // Valida si URL es valida
    if (bHayErrores)
    {
      this.setState({ MuestreMensajes:false, MuestreErrores:true });
    } else {
      this.setState({ MuestreErrores:false });

        // Actualiza o Inserta Licencia 
        try {
          //https://api.myjson.com/bins/fj4ni

          //debugger;

          if (this.state.MuestraOtro) {
            // Verifica si se desea incluir un nuevo proveedor
            fetch(this.state.rutaAPI + '/insertagrupolicencias',
            {
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    'nombre' : this.state.OtroGrupo,
                    'usuarioCreacion' : "pgamboa"
                }
            }).then(response =>  response.json())
            .then(resData => {
                  //debugger;
                  if (resData.Status=== -1)
                  {
                    this.setState({ Errores: "Se producto un error al ingresar el nuevo agrupamiento." });
                    this.setState({ MuestreErrores:true });
                  } else {
                    // Inserta Licencia
                    if (bLicenciaNueva) {
                      // API Privada: http://localhost:60000/api/insertalicencia
          
                      fetch(this.state.rutaAPI + '/insertalicencia',
                        {
                            method: 'POST',
                            headers: {
                                'Accept': 'application/json',
                                'Content-Type': 'application/json',
                                "nombre": this.state.NombreSoftware, 
                                "url": this.state.URL, 
                                "descripcion": this.state.Descripcion, 
                                "version": this.state.Version, 
                                "edicion": this.state.Edicion, 
                                "idUsoLicencia": this.state.IdUsoLicencia, 
                                "idFormaLicenciamiento": this.state.IdFormaLicenciamiento, 
                                "idPeriodicidad": this.state.IdPeriodicidad, 
                                "idPrioridad": this.state.IdPrioridad, 
                                "cantidad": this.state.Cantidad, 
                                "costo": this.state.Costo, 
                                "numOrdenCompra": this.state.NumOrdenCompra, 
                                "fechaRegistro": pFechaRegistro, 
                                "fechaDisponible": pFechaDisponible, 
                                "fechaVencimiento": this.state.IdPeriodicidad !== this.state.PeriodicidadPermanente? pFechaVencimiento:-1, 
                                "idGrupoLicencias": resData.Datos[0], 
                                "idEstado": this.state.IdEstado, 
                                "usuarioCreacion": "pgamboa",
                                "idLicenciaRenovada": this.state.IdLicenciaRenovada,
                                "esRenovacion": this.state.EsRenovacion
                            }
                          }).then(response =>  response.json())
                        .then(resDataLic => {
                          // Si no hay datos refiere a un error, no se cargaron datos
                          if (resData.Status === -1 || resData.Datos === null){                     
                            this.setState({ Errores: "Ocurrió un problema al actualizar los datos de la Licencia. Intente de nuevo, sino comuniquese con el Administrador", MuestreErrores: true, MuestreMensajes: false });
                          } else {
                            this.setState({ IdLicencia: resDataLic.Datos[0], EsNueva:false, MuestraOtro: false, EsRenovacion: false });

                            // Carga Licencia
                            this.cargaLicencia(resDataLic.Datos[0]);
            
                            this.setState({ Mensajes: "¡Los datos fueron almacenados exitósamente!.", MuestreMensajes: true });
                          }
                        })  
                    } else {
                      // Actualiza Licencia
                      // API Privada: http://localhost:60000/api/actualizalicencia
                        fetch(this.state.rutaAPI + '/actualizalicencia',
                        {
                            method: 'POST',
                            headers: {
                                'Accept': 'application/json',
                                'Content-Type': 'application/json',
                                "idLicencia": this.state.IdLicencia, 
                                "nombre": this.state.NombreSoftware, 
                                "url": this.state.URL, 
                                "descripcion": this.state.Descripcion, 
                                "version": this.state.Version, 
                                "edicion": this.state.Edicion, 
                                "idUsoLicencia": this.state.IdUsoLicencia, 
                                "idFormaLicenciamiento": this.state.IdFormaLicenciamiento, 
                                "idPeriodicidad": this.state.IdPeriodicidad, 
                                "idPrioridad": this.state.IdPrioridad, 
                                "cantidad": this.state.Cantidad, 
                                "costo": this.state.Costo, 
                                "numOrdenCompra": this.state.NumOrdenCompra, 
                                "fechaRegistro": pFechaRegistro, 
                                "fechaDisponible": pFechaDisponible, 
                                "fechaVencimiento": this.state.IdPeriodicidad !== this.state.PeriodicidadPermanente? pFechaVencimiento:-1, 
                                "idGrupoLicencias": resData.Datos[0], 
                                "idEstado": this.state.IdEstado, 
                                "usuarioModificacion": "pgamboa"
                            }
                          }).then(response =>  response.json())
                        .then(resData => {
                          // Si no hay datos refiere a un error, no se cargaron datos
                          if (resData.Status === -1 || resData.Datos === null){                     
                            this.setState({ Errores: "Ocurrió un problema al actualizar los datos de la Licencia. Intente de nuevo, sino comuniquese con el Administrador", MuestreErrores: true, MuestreMensajes: false });
                          } else {
                            // Deshabilita componente de Otro
                            this.setState({ MuestraOtro: false });
                            
                            // Carga Licencia
                            this.cargaLicencia(this.state.IdLicencia);

                            this.setState({ Mensajes: "¡Los datos fueron almacenados exitósamente!", MuestreMensajes: true });
                          }
                          
                        }) 
                    }  // fin  if (bLicenciaNueva) { 
                  } // Fin del else
            })  
          } 
          else {  
            if (bLicenciaNueva) {
              // API Privada: http://localhost:60000/api/insertalicencia
  
              fetch(this.state.rutaAPI + '/insertalicencia',
              {
                  method: 'POST',
                  headers: {
                      'Accept': 'application/json',
                      'Content-Type': 'application/json',
                      "nombre": this.state.NombreSoftware, 
                      "url": this.state.URL, 
                      "descripcion": this.state.Descripcion, 
                      "version": this.state.Version, 
                      "edicion": this.state.Edicion, 
                      "idUsoLicencia": this.state.IdUsoLicencia, 
                      "idFormaLicenciamiento": this.state.IdFormaLicenciamiento, 
                      "idPeriodicidad": this.state.IdPeriodicidad, 
                      "idPrioridad": this.state.IdPrioridad, 
                      "cantidad": this.state.Cantidad, 
                      "costo": this.state.Costo, 
                      "numOrdenCompra": this.state.NumOrdenCompra, 
                      "fechaRegistro": pFechaRegistro, 
                      "fechaDisponible": pFechaDisponible, 
                      "fechaVencimiento": this.state.IdPeriodicidad !== this.state.PeriodicidadPermanente? pFechaVencimiento:-1, 
                      "idGrupoLicencias": this.state.IdGrupoLicencias, 
                      "idEstado": this.state.IdEstado, 
                      "usuarioCreacion": "pgamboa",
                      "idLicenciaRenovada": this.state.IdLicenciaRenovada, // pgamboa: Ver esto
                      "esRenovacion": this.state.EsRenovacion
                  }
              }).then(response =>  response.json())
              .then(resDataLic => {
                // Si no hay datos refiere a un error, no se cargaron datos
                if (resDataLic.Status === -1){                      
                  this.setState({ Errores: "Ocurrió un problema al actualizar los datos de la Licencia. Intente de nuevo, sino comuniquese con el Administrador", MuestreErrores: true, MuestreMensajes: false });
                } else {

                  // Actualiza propiedades en el estado
                  this.setState({ IdLicencia: resDataLic.Datos[0], EsNueva:false, EsRenovacion: false });

                  // Carga Licencia
                  this.cargaLicencia(resDataLic.Datos[0]);
                  
                  this.setState({ Mensajes: "¡Los datos fueron almacenados exitósamente!.", MuestreMensajes: true });
                }
              })  
  
            } else {
              // API Privada: http://localhost:60000/api/actualizalicencia
              fetch(this.state.rutaAPI + '/actualizalicencia',
              {
                  method: 'POST',
                  headers: {
                      'Accept': 'application/json',
                      'Content-Type': 'application/json',
                      "idLicencia": this.state.IdLicencia, 
                      "nombre": this.state.NombreSoftware, 
                      "url": this.state.URL, 
                      "descripcion": this.state.Descripcion, 
                      "version": this.state.Version, 
                      "edicion": this.state.Edicion, 
                      "idUsoLicencia": this.state.IdUsoLicencia, 
                      "idFormaLicenciamiento": this.state.IdFormaLicenciamiento, 
                      "idPeriodicidad": this.state.IdPeriodicidad, 
                      "idPrioridad": this.state.IdPrioridad, 
                      "cantidad": this.state.Cantidad, 
                      "costo": this.state.Costo, 
                      "numOrdenCompra": this.state.NumOrdenCompra, 
                      "fechaRegistro": pFechaRegistro, 
                      "fechaDisponible": pFechaDisponible, 
                      "fechaVencimiento": this.state.IdPeriodicidad !== this.state.PeriodicidadPermanente? pFechaVencimiento:-1, 
                      "idGrupoLicencias": this.state.IdGrupoLicencias, 
                      "idEstado": this.state.IdEstado, 
                      "usuarioModificacion": "pgamboa"
                  }
              }).then(response =>  response.json())
              .then(resData => {
                // Si no hay datos refiere a un error, no se cargaron datos
                if (resData.Status === -1 || resData.Datos === null){                       
                  this.setState({ Errores: "Ocurrió un problema al actualizar los datos de la Licencia. Intente de nuevo, sino comuniquese con el Administrador", MuestreErrores: true, MuestreMensajes: false });
                } else {
                  // Muestra mensaje de actualizacion
                  this.setState({ Mensajes: "¡Los datos fueron almacenados exitósamente!", MuestreMensajes: true });
                }
              })  
            }             
          }
          //debugger;

        } catch (error) {
          this.setState({ Errores: error.message, MuestreErrores: true, MuestreMensajes: false });
        } // Fin de Else de validar si es nueva   

    } // Fin de valida URL

    // Asigna los mensajes de error
    this.setState({ Errores: msgErrores });

  }

  // Inicio: Metodos para manejo de las fechas 
  handleChangeRegistro = date => {
    this.setState({
      FechaRegistro: date
    });
  };

  handleChangeDisponible = date => {
    this.setState({
      FechaDisponible: date
    });
  };

  handleChangeVencimiento = date => {
    this.setState({
      FechaVencimiento: date
    });
  };
  // Fin: Manejo de las fechas

  // Inicio: Métodos constructores o destructores de los Modal - Popups
  onOpenModalEntidad = (idContacto,entidad,nombre,correo,telefono,estado,solicPrimaria,esNuevaEntidad,muestreErroresEntidad,observaciones,numOrdenCompra,cantidad) => {
    //alert("Estado"+estado);
    var chequeado = solicPrimaria===1?true:false;
    this.setState({ IdSolicitanteLicencias: idContacto,
                    IdEntidad: entidad,
                    Nombre:nombre,
                    Correo: correo,
                    Telefono: telefono,
                    EstadoContacto:estado,
                    SolicitudPrimariaChequeada:chequeado,
                    EsNuevaEntidad:esNuevaEntidad,
                    MuestreErroresEntidad:muestreErroresEntidad,
                    NumOrdenCompraE:numOrdenCompra,
                    ObservacionesContactoE:observaciones,
                    CantidadE:cantidad
    });

    this.setState({ openEntidad: true
                    });                    
  };

  onCloseModalEntidad = () => {

    this.setState({ openEntidad: false,
                    NombreEntidad: this.BuscaNombreEntidad(this.state.Entidades, this.state.IdEntidad) });
  };

  onOpenModalProveedor = (idContacto,idProveedor,nombre,correo,telefono,estado,esNuevoProveedor,muestreErroresProveedor) => {
    //evt.preventDefault();

    this.setState({ IdContactoProveedor: idContacto,
      IdProveedor: idProveedor,
      NombreContactoProveedor:nombre,
      CorreoContactoProveedor: correo,
      TelefonoContactoProveedor: telefono,
      EstadoContactoProveedor:estado,
      EsNuevoProveedor:esNuevoProveedor,
      MuestreErroresProveedor:muestreErroresProveedor
    });    

    // Si selecciona el valor de Otro (value 0) se habilita componente respectivo
    if (idProveedor === 0){
      this.setState({ MuestraOtroProveedor:true });
    } else {
      this.setState({ MuestraOtroProveedor:false });
    }

    this.setState({ open: true });
  };

  onOpenModal = (e) => {
    e.preventDefault();
    this.setState({ open: true });
  };

  onCloseModal = () => {
    this.setState({ open: false });
  };

  // Fin: Metodos constructores/destructores Modal-PopUps

  /// <summary>
  /// Funcion para obtener un estado en un arreglo de objetos
  /// <returns>Grid</returns>
  BuscaNombreEntidad(array, idEntidad) {
    var elemento = array.find(estado => estado.IdEntidad === idEntidad);
    if (elemento)
      return elemento.Nombre
    else return "";
  }

  /// <summary>
        /// ModalEntidad: Modal de Contactos en Entidad
        ///    para obtener los contactos asociados a la(s) entidad(es) que hicieron solicitudes de licencia
        /// <returns>Formulario</returns>

  ModalEntidad () {
    const { openEntidad } = this.state; 
    const customStyles = {
      content : {
        top                   : '50%',
        left                  : '50%',
        right                 : 'auto',
        bottom                : 'auto',
        marginRight           : '-50%',
        transform             : 'translate(-50%, -50%)'
      }
    };

    return (
      <div className='ModalGeneral'>
          <Modal 
             isOpen={openEntidad}
             contentLabel="onCloseModalEntidad Example"
             onRequestClose={this.onCloseModalEntidad}
             className="Modal"
             overlayClassName="Overlay"
             style={customStyles}
             shouldCloseOnOverlayClick={false}
          >            
            <div className="tituloEncabezado padding---2ENnv">
              <div className="fuenteTitulo">Contacto en Entidad</div>
            </div>
            <div className="ModalBody">
              {this.state.MuestreErroresEntidad===true?
                <div className="msg_error"> {this.state.ErroresContactoEntidad} </div>
              :null}               
              { this.state.EsNuevaEntidad?            
                null
              :
                <div className="form-group bloque_alineado"> 
                  <div className="col-sm-2"><label >ID:</label></div>
                  <div className="col-sm-4 nopadding"><input type = "text" placeholder="Id"  value={ this.state.IdSolicitanteLicencias} name="IdSolicitanteLicencias" onChange={this.handleChange} disabled="disabled"/></div>
                </div>
              }          
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Entidad:</label></div>
                <div className="col-sm-4 nopadding"><Listados campoNombre="Nombre" campoId="IdEntidad"  idSeleccionado={this.state.IdEntidad} catalogoJson={ this.state.Entidades } nombre="IdEntidad" incluyeOtros="" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
                <div className="col-sm-2"><label>Nombre:</label></div>
                <div className="col-sm-4 nopadding"><input type = "text" placeholder="Nombre"  value={ this.state.Nombre} name="Nombre" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
              </div>
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Teléfono:</label></div>
                <div className="col-sm-4 nopadding"><input type = "text" placeholder="Teléfono"  value={ this.state.Telefono} name="Telefono" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
                <div className="col-sm-2"><label>Correo:</label></div>
                <div className="col-sm-4 nopadding"><input type = "text" placeholder="Correo"  value={ this.state.Correo} name="Correo" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
              </div>
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Orden de Compra:</label></div>
                <div className="col-sm-4 nopadding"><input className="" type = "text" placeholder="Orden Compra"  value={ this.state.NumOrdenCompraE} name="NumOrdenCompraE" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
                <div className="col-sm-2"><label>Cantidad:</label></div>
                <div className="col-sm-4 nopadding"><input className="" type = "text" placeholder="Cantidad"  value={ this.state.CantidadE} name="CantidadE" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
              </div>
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Solicitud Primaria:</label></div>
                <div className="col-sm-4 nopadding"><input type = "checkbox" name="SolicitudPrimaria" checked={ this.state.SolicitudPrimariaChequeada } onChange={this.handleChangeSolicitudPrimaria} disabled={this.state.SoloLectura}/> </div>
                <div className="col-sm-2"><label>Estado:</label></div>
                <div className="col-sm-4 nopadding"><Listados campoNombre="Estado" campoId="IdEstado" idSeleccionado={this.state.EstadoContacto} catalogoJson={ this.state.EstadosSolicitud } nombre="EstadoContacto" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
              </div>
              <div className="container">
                <div className="row">
                  <div className="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <label>Observaciones:</label>
                  </div>
                  <div className="nopadding col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <textarea className="fuenteEntrada textareaModal" id="ObservacionesContactoE" value={this.state.ObservacionesContactoE} name="ObservacionesContactoE" onChange={this.handleChange} disabled={this.state.SoloLectura}/>
                  </div>
                </div>
              </div>
            </div>
            <div className="bloque_alineado modalFooter">
              <div className="col-sm-6">  
              </div>
              <div className="col-sm-3">
                  <Button class ="btn-lg btn-dark btn-block" onClick={this.onCloseModalEntidad}>
                    Cancelar
                  </Button>
              </div>
              <div className="col-sm-3">
                {
                  this.state.SoloLectura !=="disabled"
                    ? 
                      <Button class ="btn-lg btn-dark btn-block" onClick={this.handleButtonGuardarCliente}>
                      Guardar
                      </Button>
                      : ""
                }                
              </div>
            </div> 
            <button type="button" className="botonCerrar" onClick={this.onCloseModalEntidad}></button>
          </Modal>
      </div>)
  }

    /// <summary>
        /// ObtieneContactosProveedor: Grid con los contactos asociados al Proveedor
        ///    Crea una tabla con los datos de los contactos de los proveedores de una licencia 
        /// <returns>Grid</returns>

  ObtieneContactosProveedor(){
    //alert(typeof(this.state.ContactosProveedor[0]) === "undefined"? "nada": this.state.ContactosProveedor[0].Estado);
    var filasContactos = "";
    if (this.state.ContactosProveedor !== null) { 
        filasContactos = (
        this.state.ContactosProveedor.map(item => 
                    <tr key={"tr_"+item.IdContactoProveedor}>
                      <td>{item.IdContactoProveedor}</td>
                      <td>{item.NombreProveedor}</td>
                      <td>{item.Nombre}</td>
                      <td>{item.CorreoElectronico}</td>
                      <td>{item.Telefono}</td>
                      <td>{item.Estado}</td>
                      <td>
                        <div>
                          <Button class ="btn-lg btn-dark btn-block" onClick={() => this.onOpenModalProveedor(item.IdContactoProveedor,item.IdProveedor,item.Nombre,item.CorreoElectronico,item.Telefono,item.IdEstado,false,false)}>{this.state.SoloLectura==="disabled"?"Consultar":"Editar"}</Button>
                        </div>
                      </td>            
                    </tr>
          )
        );
    }

    var IdEstadoNuevo = (this.state.EstadosCProveedor != null && (typeof(this.state.EstadosCProveedor[0]) !== 'undefined' || this.state.EstadosCProveedor[0] != null))? this.state.EstadosCProveedor[0].IdEstado:this.state.EstadoContactoProveedor;
    //var IdProveedorNuevo = (this.state.Proveedores != null && (this.state.Proveedores[0] != null || typeof(this.state.Proveedores[0]) !== 'undefined' || this.state.Proveedores != null && this.state.Proveedores[0] != null))? this.state.Proveedores[0].IdProveedor:this.state.IdProveedor;
    var IdProveedorNuevo = (this.state.Proveedores != null && typeof(this.state.Proveedores[0]) !== 'undefined' && this.state.Proveedores[0] != null)? this.state.Proveedores[0].IdProveedor:this.state.IdProveedor;

    //alert("Proveedor:"+ IdProveedorNuevo);
    return (
          <div>
              {
                (this.state.SoloLectura !=="disabled") && (this.state.IdLicencia !== 0)
                  ? 
                  <div className="col-md-2 espaciado">
                    <div>
                      <Button class ="btn-lg btn-dark btn-block" onClick={() => this.onOpenModalProveedor("",IdProveedorNuevo,"","","",IdEstadoNuevo,true,false)}>Nuevo</Button>
                    </div>
                  </div>
                  : ""
              }    
            <div className="container"> 
              <Table striped bordered hover size="sm">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Proveedor</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Telefono</th>
                    <th>Estado</th>
                    <th>Acción</th>
                  </tr>
                </thead>
                <tbody>
                  {this.state.EsNueva===false?filasContactos:""}
                </tbody>
              </Table>
            </div>                    
          </div>
          );
  }

  /// <summary>
      /// Funcion para obtener un estado en un arreglo de objetos
      /// <returns>Grid</returns>
  BuscaEstado(array, value) {
    var elemento = array.find(estado => estado.IdEstado === value);
    if (elemento)
     return elemento.Estado
    else return "";
  }

  /// <summary>
      /// ObtieneContactosEntidad: Grid con los contactos de una Entidad
      ///    Crea una tabla con los datos de los contactos de las entidades que solicitan una licencia 
      /// <returns>Grid</returns>

  ObtieneContactosEntidad(){
    var filasContactos = "";
    if (this.state.ContactosEntidad != null) { 
      filasContactos = (
        this.state.ContactosEntidad.map(item => 
                  <tr  key={"tr_"+item.IdSolicitanteLicencias}>
                    <td>{item.IdSolicitanteLicencias}</td>
                    <td>{item.NombreEntidad}</td>
                    <td>{item.NombreContacto}</td>
                    <td>{item.CorreoContacto}</td>
                    <td>{item.TelefonoContacto}</td>
                    <td>{item.Estado}</td>
                    <td>{item.SolicitudPrimaria?"Si":"No"}</td>
                    <td>
                      <div>
                        <Button class ="btn-lg btn-dark btn-block" onClick={() => this.onOpenModalEntidad(item.IdSolicitanteLicencias,item.IdEntidad,item.NombreContacto,item.CorreoContacto,item.TelefonoContacto,item.IdEstado,item.SolicitudPrimaria,false,false,item.Observaciones,item.NumOrdenCompra,item.Cantidad)}>{this.state.SoloLectura==="disabled"?"Consultar":"Editar"}</Button>
                      </div>
                    </td>            
                  </tr>
        )
      )
    };

    var IdEstadoNuevo = (this.state.EstadosSolicitud  != null && typeof(this.state.EstadosSolicitud[0]) !== 'undefined' && this.state.EstadosSolicitud[0] != null)? this.state.EstadosSolicitud[0].IdEstado:this.state.EstadoContacto;
//var IdEstadoNuevo = (this.state.EstadosSolicitud != null && (typeof(this.state.EstadosSolicitud[0]) !== 'undefined' || this.state.EstadosSolicitud != null && this.state.EstadosSolicitud[0] != null))? this.state.EstadosSolicitud[0].IdEstado:this.state.EstadoContacto;
    return (
          <div>
            {
              (this.state.SoloLectura !=="disabled") && (this.state.IdLicencia !== 0)
                ? 
                <div className="col-md-2 espaciado">
                  <div>
                  <Button class ="btn-lg btn-dark btn-block" onClick={() => this.onOpenModalEntidad("",1,"","","",IdEstadoNuevo,0,true,false,"","",0)}>Nuevo</Button>
                  </div>
                </div>
                : ""
            }                
            <div className="container">            
              <Table striped bordered hover size="sm">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Entidad</th>
                      <th>Nombre</th>
                      <th>Email</th>
                      <th>Telefono</th>
                      <th>Estado</th>
                      <th>Primaria</th>
                      <th>Acción</th>
                    </tr>
                  </thead>
                  <tbody>
                    {this.state.EsNueva===false?filasContactos:""}
                  </tbody>
                </Table>
            </div>
          </div> 
          );
  }

  /// <summary>
      /// ModalProveedor: Modal de Contactos del Proveedor
      ///    para obtener los contactos asociados al Proveedor asociados a una licencia
      /// <returns>Formulario</returns>

  ModalProveedor(){
      const { open } = this.state;    
      const customStyles = {
        content : {
          top                   : '50%',
          left                  : '50%',
          right                 : 'auto',
          bottom                : 'auto',
          marginRight           : '-50%',
          transform             : 'translate(-50%, -50%)'
        }
      };

      return (
        <div>
          <Modal 
             isOpen={open}
             contentLabel="onCloseModal Example"
             onRequestClose={this.onCloseModal}
             className="Modal"
             style={customStyles}
             overlayClassName="Overlay"
             shouldCloseOnOverlayClick={false}
          >         
            <div className="tituloEncabezado padding---2ENnv">
              <div className="fuenteTitulo">Contacto del Proveedor</div>
            </div>
            <div className="ModalBody">
              {this.state.MuestreErroresProveedor===true?
                  <div className="msg_error"> {this.state.ErroresContactoProveedor} </div>
                :null}                  
              { this.state.EsNuevoProveedor?            
                  null
                :
                  <div className="form-group bloque_alineado"> 
                    <label className="col-sm-2">ID:</label>
                    <input className="col-sm-4" type = "text" placeholder="Id" value={ this.state.IdContactoProveedor} name="IdContactoProveedor" onChange={this.handleChange}  disabled="disabled"/>
                  </div>            
              } 
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Proveedor:</label></div>
                <div className="col-sm-4 nopadding"><Listados campoNombre="Nombre" campoId="IdProveedor" idSeleccionado={this.state.IdProveedor} catalogoJson={ this.state.Proveedores } nombre="IdProveedor" incluyeOtros="Si" FunctionPasada={this.handleChangeProveedor} SoloLectura={this.state.SoloLectura}/></div>
                { this.state.MuestraOtroProveedor?            
                    <div className="col-sm-6 nopadding">
                      <input className="col-sm-6" type = "text" placeholder="Otro" name="OtroProveedor" onChange={this.handleChange} disabled={this.state.SoloLectura}/>
                    </div>
                    :null
                }            
              </div>
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Nombre:</label></div>
                <div className="col-sm-4 nopadding"><input type = "text" placeholder="Nombre"  value={ this.state.NombreContactoProveedor} name="NombreContactoProveedor" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
                <div className="col-sm-2"><label>Email:</label></div>
                <div className="col-sm-4 nopadding"><input type = "text" placeholder="Correo"  value={ this.state.CorreoContactoProveedor} name="CorreoContactoProveedor" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
              </div>
              <div className="form-group bloque_alineado"> 
                <div className="col-sm-2"><label>Teléfono:</label></div>
                <div className="col-sm-4 nopadding"><input type = "text" placeholder="Telefono"  value={ this.state.TelefonoContactoProveedor} name="TelefonoContactoProveedor" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
                <div className="col-sm-2"><label>Estado:</label></div>
                <div className="col-sm-4 nopadding"><Listados campoNombre="Estado" campoId="IdEstado" idSeleccionado={this.state.EstadoContactoProveedor} catalogoJson={ this.state.EstadosCProveedor } nombre="EstadoContactoProveedor" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
              </div>
            </div>
            <div className="bloque_alineado modalFooter">
              <div className="col-sm-6">  
              </div>
              <div className="col-sm-3">
                    <Button class ="btn-lg btn-dark btn-block" onClick={this.onCloseModal}>
                      Cancelar
                    </Button>
              </div>
              <div className="col-sm-3">
              {
                this.state.SoloLectura !=="disabled"
                  ? 
                  <Button class ="btn-lg btn-dark btn-block" onClick={this.handleButtonGuardarProveedor}>
                  Guardar
                  </Button>
                  : ""
              }                
              </div>
            </div> 
            <button type="button" className="botonCerrar" onClick={this.onCloseModal}></button>
          </Modal>
        </div>
      );
  
  }

  /// <summary>
      /// AcordeonFormulario: Acordeon para incluir contactos - Clientes y Proveedores
      ///    Crea una acordeon que incluye los contactos de proveedores y solicitantes de la Licencia
      /// <returns>Grid</returns>

  AcordeonFormulario(){
    return (
        <div>
          <div className="accordion" id="accordionExample">
            <div className="card">
              <div className="card-header" id="headingOne">
                <h2 className="mb-0">
                  <button className="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    Contacto(s) Proveedor
                  </button>
                </h2>
              </div>
              <div id="collapseOne" className="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div className="card-body">
                  <div className="container">
                      {this.ObtieneContactosProveedor()}
                  </div>              
                </div>
              </div>
            </div>
            <div className="card">
              <div className="card-header" id="headingTwo">
                <h2 className="mb-0">
                  <button className="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    Contacto(s) Entidad
                  </button>
                </h2>
              </div>
              <div id="collapseTwo" className="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div className="card-body">
                  <div className="container">
                      {this.ObtieneContactosEntidad()}
                    </div>              
                  </div>
              </div>
            </div>
          </div>
        </div>
    );
  }

  /// <summary>
    /// Render del Componente
    ///    Crea el Formulario con la información cargada desde JSON
    /// <returns>Formulario</returns>
    
  CrearFormulario(){
    //var IdEstadoNuevo = (this.state.EsNueva?(typeof(this.state.Estados[0]) !== 'undefined' || this.state.Estados[0] != null)? this.state.Estados[0].IdEstado:this.state.IdEstado:this.state.IdEstado);
    //alert ("Estados:"+this.state.Estados + "Id:"+this.state.IdEstado+ " ID2:"+IdEstadoNuevo);
    return (
        <div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Grupo:</label></div>
            <div className="col-sm-4 nopadding"><Listados campoNombre="Nombre" campoId="IdGrupoLicencias" idSeleccionado={this.state.IdGrupoLicencias} catalogoJson={ this.state.GruposLicencia } nombre="IdGrupoLicencias" incluyeOtros="Si" FunctionPasada={this.handleChangeGrupo} SoloLectura={this.state.SoloLectura}/></div>
            { this.state.MuestraOtro?
                <div className="col-sm-6">
                  <input className="col-sm-6" type = "text" placeholder="Otro" name="OtroGrupo" onChange={this.handleChange} disabled={this.state.SoloLectura}/>
                </div>
                :null
            }
          </div>         
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Sofware:</label></div>
            <div className="col-sm-4 nopadding"><input type = "text" placeholder="Software" value={this.state.NombreSoftware} name="NombreSoftware" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
            <div className="col-sm-2"><label>Enlace:</label></div>
            <div className="col-sm-4 nopadding"><input type = "text" placeholder="Enlace" value={this.state.URL} name="URL" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
          </div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Versión:</label></div>
            <div className="col-sm-4 nopadding"><input type = "text" placeholder="Versión"  value={this.state.Version} name="Version" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
            <div className="col-sm-2"><label>Edición:</label></div>
            <div className="col-sm-4 nopadding"><input type = "text" placeholder="Edición"  value={this.state.Edicion} name="Edicion" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
          </div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Uso Lic.:</label></div>
            <div className="col-sm-4 nopadding"><Listados campoNombre="Descripcion" campoId="IdUsoLicencia" idSeleccionado={this.state.IdUsoLicencia} catalogoJson={ this.state.UsosLicencia } nombre="IdUsoLicencia" incluyeOtros="" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
            <div className="col-sm-2"><label>Forma Lic.:</label></div>
            <div className="col-sm-4 nopadding"><Listados campoNombre="Descripcion" campoId="IdFormaLicenciamiento" idSeleccionado={this.state.IdFormaLicenciamiento} catalogoJson={ this.state.FormasLicenciamiento } nombre="IdFormaLicenciamiento" incluyeOtros="" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
          </div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Periodicidad:</label></div>
            <div className="col-sm-4 nopadding"><Listados campoNombre="Descripcion" campoId="IdPeriodicidad" idSeleccionado={this.state.IdPeriodicidad} catalogoJson={ this.state.PeriodicidadLicenciamiento } nombre="IdPeriodicidad" incluyeOtros="" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
            <div className="col-sm-2"><label>Prioridad:</label></div>
            <div className="col-sm-4 nopadding"><Listados campoNombre="Descripcion" campoId="IdPrioridad" idSeleccionado={this.state.IdPrioridad} catalogoJson={ this.state.PrioridadLicenciamiento } nombre="IdPrioridad" incluyeOtros="" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/></div>
          </div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Cantidad:</label></div>
            <div className="col-sm-4 nopadding"><input type = "text"  pattern="[0-9]*" placeholder="Cantidad" value={this.state.Cantidad} name="Cantidad" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
            <div className="col-sm-2"><label>Costo:</label></div>
            <div className="col-sm-4 nopadding"><CurrencyInput prefix="$" name="Costo" value={this.state.Costo} onChangeEvent={this.handleChangeCosto} disabled={this.state.SoloLectura}/></div>
          </div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Orden Compra:</label></div>
            <div className="col-sm-4 nopadding"><input type = "text" placeholder="Orden Compra" value={this.state.NumOrdenCompra} name="NumOrdenCompra" onChange={this.handleChange} disabled={this.state.SoloLectura}/></div>
            <div className="col-sm-2"><label>Fecha Registro:</label></div>
            <div className="col-sm-4 nopadding"><DatePicker name="FechaRegistro" readOnly={this.state.SoloLectura?true:""}
              selected={this.state.FechaRegistro}
              onChange={this.handleChangeRegistro}/></div>
          </div>
          <div className="form-group bloque_alineado"> 
            <div className="col-sm-2"><label>Fecha Disponible:</label></div>
            <div className="col-sm-4 nopadding"><DatePicker name="FechaDisponible" readOnly={this.state.SoloLectura?true:""}
              selected={this.state.FechaDisponible}
              onChange={this.handleChangeDisponible}/></div>
            <div className="col-sm-2"><label>Fecha Vencimiento:</label></div>
            { this.state.IdPeriodicidad != this.state.PeriodicidadPermanente?
                <div className="col-sm-4 nopadding"><DatePicker  name="FechaVencimiento" readOnly={this.state.SoloLectura?true:""}
                selected={this.state.FechaVencimiento}
                onChange={this.handleChangeVencimiento}/></div>
                :
                <div className="col-sm-4 nopadding"><label>Indefinida</label>  </div>
            }
          </div>
          <div className="container">
            <div className="row">
              <div className="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <label>Descripción:</label>
              </div>
              <div className="nopadding col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <textarea className="fuenteEntrada textareaFormulario" id="descripcion" value={this.state.Descripcion} name="Descripcion" onChange={this.handleChange} disabled={this.state.SoloLectura}/>
              </div>
              <div className="nopadding col-xs-4 col-sm-4 col-md-4 col-lg-4" id="myinnercontainer">
                <p className="etiquetaFormulario">Estado:</p>
                <Listados campoNombre="Estado" campoId="IdEstado" idSeleccionado={this.state.IdEstado} catalogoJson={ this.state.Estados } nombre="IdEstado" incluyeOtros="" FunctionPasada={this.handleChange} SoloLectura={this.state.SoloLectura}/>
              </div>
            </div>
          </div>
        </div>
    );
  }

  /// <summary>
    /// Render del Componente
    ///    Crea el Formulario con los grids y acordeones planteados
    /// <returns>Formulario</returns>
  
  render (){
    //const { open } = this.state;
    //const { DatosLicencia } = this.state;
    //alert("Licencia:" + this.state.DatosLicencia.IdLicencia);
        
    return (
      <React.Fragment>
        <div className="content">
          <div>            
              {this.ModalEntidad()}          
              {this.ModalProveedor()}    
          </div>
          <div className="Formulario">   
              <nav className="BarraNavegacionFormulario navbar navbar-default" role="navigation">
                  <div className="navbar-header">
                      <a className="navbar-brand">{this.state.TituloAccion} Licencia</a>
                  </div>                      
              </nav>                  
              {this.state.MuestreMensajes?
                  <div className="stickyMsg"> 
                    <div>{this.state.Mensajes} </div>
                    <div><button type="button" className="botonCerrar" onClick={() => this.setState({ MuestreMensajes: false })}></button></div>
                  </div>
                :null}                  
              {this.state.MuestreErrores?
                  <div className="stickyError"> 
                    <div>{this.state.Errores}</div>
                    <div><button type="button" className="botonCerrar" onClick={() => this.setState({ MuestreErrores: false })}></button></div>
                  </div>
                :null}                  
              {this.CrearFormulario()}
              <div className="bloque_alineado espaciado">
                <div className="col-sm-6"></div>
                <div className="col-sm-3">
                  {this.renderRedirect()}
                  <Button class ="btn-lg btn-dark btn-block" onClick={this.setRedirectFalse}>
                    Regresar
                  </Button>
                </div>
                <div className="col-sm-3">
                  {
                    this.state.SoloLectura !=="disabled"
                      ? 
                        <Button color="secondary" onClick={this.handleButtonGuardarFormulario}>
                            {this.state.EsRenovacion?"Renovar": "Guardar"}
                        </Button>                        
                      : ""
                  }
                </div>
              </div> 
              {
                this.state.EsNueva?null:this.AcordeonFormulario()    
              }
              <div className="EspacioFooter"></div>
            </div>
        </div> 
        {this.modoDesarrollo ?
                <VisorEstado estado={this.state} titulo="Estado Local" estilo="fijoDerechaBottom"/>
            : null}

      </React.Fragment>
    )
  }
}

export default Formulario;
