import React,{Component} from 'react';
//import {Button} from 'reactstrap'
import {Button} from 'react-bootstrap'
import './InicioSocio.css';
import "react-datepicker/dist/react-datepicker.css";
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.min.js';
//import Table from 'react-bootstrap/Table'
import TablaLicencias from './TablaLicencias';
import '../Encabezado.css';
import {Redirect} from "react-router-dom";
import 'react-bootstrap-table/dist/react-bootstrap-table-all.min.css';
import 'react-bootstrap-table/dist/react-bootstrap-table.min.js';
import LoadingOverlay from 'react-loading-overlay';

//contexto global de la aplicación
import AppContext from '../../context/AppContext';
import VisorEstado from '../VisorEstado';
// Prueba Pgamboa 25.2.2020
import BootstrapTable2 from 'react-bootstrap-table-next';
import DatePicker from "react-datepicker";
import Listados from './components/Listados.js'
import ToolkitProvider, { CSVExport } from 'react-bootstrap-table2-toolkit';
// FIN Prueba

// Funciones Generales
   // Formato de fecha
   function dateWithMonthNameSimple(data){
    const monthNames = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
    "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"];
  
    var date = new Date(data);
    var day = ("0" + date.getDate()).slice(-2);
    var month = monthNames[date.getMonth()];
    var year = date.getFullYear();
    var fullDate = day + ' ' + month + ' ' + year;
    return fullDate;
  }
  
  function formatDateTime(cell){
    // console.log(cell);
    if(cell){
      //return dateWithMonthName(cell) + ' - ' + timeOnlyAMPM(cell); 
      return dateWithMonthNameSimple(cell); 
    }else {
      return "";
    }
  }
  
  function formatCurrency(cell) {
    return "$" + cell.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
  }

// Componente de Prueba de Manejo de Exceptiones
class ConsultaLicencias extends Component {
  // Carga el contexto
  static contextType = AppContext;

  // Constructor del Pantalla de Consulta
  constructor (props, context) {
    super(props, context)
    this.estadoGlobal = context[0];
    const {modoDesarrollo, permisosApp, rutaApi, urlInstalacion} = this.estadoGlobal;
    //poner los valores del estado global (contexto) en variables de la clase
    this.modoDesarrollo = modoDesarrollo;
    this.urlInstalacion = urlInstalacion;
    const contexto = this.estadoGlobal;

    // --  Valida los permisos
    var permisosComponente = {
      NuevaLicencia: true,
      RenovarLicencia: true,
      ModificarLicencia: true,
      DetalleLicencia: true,
     };

    //llamada a la función TienePermiso de ambito global
    let promise = new Promise(function(resolve, reject) {
      resolve(contexto.TienePermiso(contexto,permisosApp.RenovarLicencia));
    }).then( res => {
      permisosComponente.RenovarLicencia = res;
    });

    //llamada a la función TienePermiso de ambito global
    promise = new Promise(function(resolve, reject) {
      resolve(contexto.TienePermiso(contexto,permisosApp.ModificarLicencia));
    }).then( res => {
      permisosComponente.ModificarLicencia = res;
    });
    
    //llamada a la función TienePermiso de ambito global
    promise = new Promise(function(resolve, reject) {
      resolve(contexto.TienePermiso(contexto,permisosApp.DetalleLicencia));
    }).then( res => {
      permisosComponente.DetalleLicencia = res;
    });

    //llamada a la función TienePermiso de ambito global
    promise = new Promise(function(resolve, reject) {
      resolve(contexto.TienePermiso(contexto,permisosApp.NuevaLicencia));
    }).then( res => {
      permisosComponente.NuevaLicencia = res;
      this.setState({PermisosComponente : permisosComponente});      
    });

    // Estado
    this.state = {

      //PROPIEDADES

      cargando: true,

      // Configuracion
      FilasenPagina:4, 
      CodigoFilasenPagina:6, 

      // Inactivas
      MuestreInactivas: false,
      CodigoLicenciaInactiva: 3,
      EstadoLicenciaInactiva: 18,

      // Errores
      MuestreErrores: false,
      Errores:"",

      // Redireccionamiento
      redirect: false,
      idLicenciaSeleccionada:0,
      idAccion:2,

      // Objetos del Contexto
      rutaAPI: rutaApi,
      permisosAPP: permisosApp,
      PermisosComponente:{},

      // Datos de la Licencia
      // Api
      DatosLicencias: [],

      // Datos para Consulta de Licencias por Vencer
      FechaVencimiento: new Date(),
      DatosLicenciasTotal: [],
      MuestreConsultaVencimiento: false,
      Estados:[],
      // Obtiene solo estados de la Licencia
      idTipoEstado: 3,
      IdEstado:5
    } 

    // Declarar funciones bind para manejo de eventos
    this.setRedirect = this.setRedirect.bind(this);
    this.handleChangeMostrarInactivas = this.handleChangeMostrarInactivas.bind(this);
    this.cargaLicenciasPorVencer = this.cargaLicenciasPorVencer.bind(this);
    this.handleChange = this.handleChange.bind(this);
    
  } 

  // Redireccion
  setRedirect = (pidLicencia,piAccion) => {
    this.setState({
      redirect: true,
      idLicenciaSeleccionada:pidLicencia,
      idAccion:piAccion
    })
  }

  renderRedirect = () => {
    //debugger;
    var ruta = "";
    if (this.state.redirect) {
      this.state.idAccion === "1" ? ruta = this.urlInstalacion + "/licencias"
      : this.state.idAccion==="2" ? ruta = this.urlInstalacion + "/licencias/editar"
      : this.state.idAccion==="3" ? ruta = this.urlInstalacion + "/licencias/renovar"
      : this.state.idAccion==="4" ? ruta = this.urlInstalacion + "/licencias/nueva"
      : ruta = ""
      //return <Redirect to='/editar' />
      return <Redirect
            to={{
              // pathname: this.state.idAccion==="1"?"/licencias":this.state.idAccion==="2"?"/licencias/editar":this.state.idAccion==="3"?"/licencias/renovar":this.state.idAccion==="4"?"/licencias/nueva":"",
              pathname: ruta,
              search: "",
              state: { pidLicencia: this.state.idLicenciaSeleccionada, pidAccion: this.state.idAccion }
            }}
    />
    }
  }

  // Componente Montado  / Metodo que e invoca al crear la pantalla 
  async componentDidMount() {
    ////debugger;
    // --  invocación de API para obtener Licencias
    // ApiPrivada: http://localhost:60000/api/parametro

    //alert("Consulta Licencias:");
    try {

      ////debugger;
      // Obtiene parametro para cantidad de filas en tabla
      await fetch(this.state.rutaAPI + '/parametro',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'codigoParametro':this.state.CodigoFilasenPagina
          }
      })
      .then(response =>  response.json())
      .then(resData => {
        ////debugger;
          if (resData.Datos != null){
            this.setState({ FilasenPagina: resData.Datos[0].Valor }); 
          }
      })        
      .catch((err) => {
        ////debugger;
        //quitar el loader
        this.setState({ cargando: false })
        return;
      });

      // Obtiene parametro para licencias inactivas
      await  fetch(this.state.rutaAPI + '/parametro',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'codigoParametro':this.state.CodigoLicenciaInactiva
          }
      }).then(response =>  response.json())
      .then(resData => {
        ////debugger;
          if (resData.Datos != null) {
            this.setState({ EstadoLicenciaInactiva: resData.Datos[0].Valor }); 
          }
      })

      // API Privada: http://localhost:60000/api/licenciasporgrupo
      await fetch(this.state.rutaAPI + '/licenciasporgrupo',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idEstado':this.state.EstadoLicenciaInactiva,
              'incExcEstado':this.state.MuestreInactivas
          }
      }).then(response =>  response.json())
      .then(resData => {
        this.setState({ DatosLicencias: resData.Datos });
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

          /*if (this.state.EsNueva === true) {
            var IdEstadoNuevo = (resData.Datos!=null && ((typeof(this.state.Estados[0]) !== 'undefined' || this.state.Estados[0] != null))? this.state.Estados[0].IdEstado:this.state.IdEstado);
            this.setState({ IdEstado: IdEstadoNuevo, IdEstadoLicencia: IdEstadoNuevo });
          }      */
      }) 

      //quitar el loader
      this.setState({ cargando: false })
    } catch (error) {
      this.setState({ Errores: error.message, MuestreErrores: true });
    }
  }

  // Carga las Licencias para el Listado
  async cargaLicencias(pMuestreInactivas){

    // Obtiene datos de licencias
    try {
      // API Privada: http://localhost:60000/api/licenciasporgrupo
      await fetch(this.state.rutaAPI + '/licenciasporgrupo',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'idEstado':this.state.EstadoLicenciaInactiva,
              'incExcEstado':pMuestreInactivas
          }
      }).then(response =>  response.json())
      .then(resData => {
        this.setState({ DatosLicencias: resData.Datos });
      })        
    } catch (error) {
      this.setState({ Errores: error.message, MuestreErrores: true });
    }
  }  

  // Carga las Licencias por vencer
  async cargaLicenciasPorVencer(){

    ////debugger;
    // Obtiene datos de licencias
    try {      
      var date = new Date(this.state.FechaVencimiento);
      var day = ("0" + date.getDate()).slice(-2);
      var month = date.getMonth()+1;
      var year = date.getFullYear();
   
      // API Privada: http://localhost:60000/api/LicenciasConVencimiento
      await fetch(this.state.rutaAPI + '/LicenciasConVencimiento',
      {
          method: 'GET',
          headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'diaFVencimiento':day,
              'mesFVencimiento':month,
              'annoFVencimiento':year,
              'idEstado':this.state.IdEstado
          }
      }).then(response =>  response.json())
      .then(resData => {
        this.setState({ DatosLicenciasTotal: resData.Datos });
      })        

    } catch (error) {
      this.setState({ Errores: error.message, MuestreErrores: true });
    }
  }  

  // Evento cuando cambia la fecha de vencimiento
  handleChangeVencimiento = date => {
    this.setState({
      FechaVencimiento: date
    });
  };

  // Evento para cambiar el estado
  handleChange (evt) {
    ////debugger;
    // check it out: we get the evt.target.name
    this.setState({ [evt.target.name]: evt.target.value });
  }


  // Cambia el valor del indicador de Mostrar Inactivas
  handleChangeMostrarInactivas() {
    // Licencias por Grupo
    this.cargaLicencias(!this.state.MuestreInactivas);

    // Asigne el valor al indicador
    this.setState({
      MuestreInactivas: !this.state.MuestreInactivas
    })

  }

  // Render de Clase con Grid
  render () {
    
    // Columnas para Tabla de Licencias por Vencimiento
    const columns = [{
      dataField: 'IdCxC',
      text: '#',
      footer: ''
    }, {
      dataField: 'BienoServicio',
      text: 'Bien o Servicio',
      footer: ''
    }, {
      dataField: 'FechaVencimiento',
      text: 'Fecha Vencimiento',
      formatter: formatDateTime,
      footer: ''
    }, {
      dataField: 'Monto',
      text: 'Monto',
      formatter: formatCurrency,
      footer: columnData => columnData.reduce((acc, item) => acc + item, 0),
      footerClasses:"simboloMoneda"
    }, {
      dataField: 'Cantidad',
      text: 'Cantidad',
      footer: ''
    }, {
      dataField: 'Estado',
      text: 'Estado',
      footer: ''
    }];

    const { ExportCSVButton } = CSVExport;

    ////debugger;
    return (
      <React.Fragment>
        <LoadingOverlay className="center-div-cargando" active={this.state.cargando} spinner text='Cargando...'>
          {this.renderRedirect()}
          <div>
          <div>
            <div className="Consulta">
            {!this.state.MuestreConsultaVencimiento?
                <div className="contenedor">
                  <nav className="BarraNavegacion navbar navbar-default" role="navigation">
                      <div className="navbar-header">
                          <a className="navbar-brand">Cuentas por Cobrar <span style={{color: "red"}}>activas</span></a>
                      </div> 
                      <div className="navbar-header">
                          <div><a className="subtitulo" onClick={() => this.setState({ MuestreConsultaVencimiento: true })}>Consulta todas las cuentas</a></div>
                      </div>                     
                  </nav>                  
                  {this.state.MuestreErrores===true?
                    <div className="stickyError"> 
                      <div>{this.state.Errores}</div>
                      <div><button type="button" className="botonCerrar" onClick={() => this.setState({ MuestreErrores: false })}></button></div>
                    </div>
                    :null}
                  <div className="bloque_alineado espaciado">
                      <div className="col-sm-6"> 
                        {this.state.PermisosComponente.NuevaLicencia?
                              <Button class ="btn-lg btn-dark btn-block" onClick={() => this.setRedirect("0","4")}>Nueva</Button>
                              :null
                        }                        
                      </div>
                    <div className="col-sm-6 alineadoDerecha">
                      <input type="checkbox" name="MostrarInactivas"  checked={ this.state.MuestreInactivas} onChange={this.handleChangeMostrarInactivas} /> Mostrar únicamente licencias inactivas
                    </div>
                  </div>
                  <div>
                    <TablaLicencias PermisosComponente={ this.state.PermisosComponente} filasenpagina={this.state.FilasenPagina} licencias={this.state.DatosLicencias} setRedirect={this.setRedirect}/>
                  </div>
                </div>
                :null}
                {this.state.MuestreConsultaVencimiento?
                  <React.Fragment>
                          <div>
                            <div>
                                <div className="Consulta">
                                  <div className="contenedor">
                                    <nav className="BarraNavegacion navbar navbar-default" role="navigation">
                                        <div className="navbar-header">
                                            <a className="navbar-brand">Consulta Licencias por Vencimiento</a>
                                        </div> 
                                        <div className="navbar-header">
                                            <div><a className="subtitulo" onClick={() => this.setState({ MuestreConsultaVencimiento: false })}>Consulta Licencias</a></div>
                                        </div>
                                    </nav>                  
                                    <div className="bloque_alineado espaciado">
                                      <div className="bloque_alineado">
                                        <div className="">Fecha Vencimiento:</div>
                                        <div className="">&nbsp;&nbsp;<DatePicker  name="FechaVencimiento" selected={this.state.FechaVencimiento} onChange={this.handleChangeVencimiento}/></div>
                                        <div className=""><label>&nbsp;&nbsp;Estado:</label></div>
                                        <div className="">
                                        &nbsp;&nbsp;<Listados campoNombre="Estado" campoId="IdEstado" idSeleccionado={this.state.IdEstado} catalogoJson={ this.state.Estados } nombre="IdEstado" incluyeOtros="" FunctionPasada={this.handleChange}/>
                                        </div>
                                        <div className="">&nbsp;&nbsp;<Button class ="btn-lg btn-dark btn-block" onClick={this.cargaLicenciasPorVencer}>Filtrar</Button></div>
                                      </div>
                                    </div>
                                    <div>
                                    <ToolkitProvider
                                        keyField="id"
                                        data={ this.state.DatosLicenciasTotal ?  this.state.DatosLicenciasTotal : [] }
                                        columns={ columns }
                                        exportCSV
                                      >
                                        {
                                          props => (
                                            <div>
                                              <ExportCSVButton { ...props.csvProps }><label className="tituloVerde">Exportar tabla a CSV</label></ExportCSVButton>
                                              <hr />
                                              <BootstrapTable2 keyField='id' data={ this.state.DatosLicenciasTotal ?  this.state.DatosLicenciasTotal : [] } columns={ columns } wrapperClasses="table-responsive" classes="table_responsiva" { ...props.baseProps }/>
                                            </div>
                                          )
                                        }
                                      </ToolkitProvider>                                      
                                    </div>
                                  </div>
                                  <div className="EspacioFooter"></div>
                                </div>
                            </div>
                            </div>
                    </React.Fragment>
                    :null}
                <div className="EspacioFooter"></div>
              </div>
          </div>
        </div>
        {this.estadoGlobal.modoDesarrollo ?
                <VisorEstado estado={this.state} titulo="Estado Local" estilo="fijoDerechaBottom"/>
            : null}
      </LoadingOverlay>
    </React.Fragment>
    )
  }
}

export default ConsultaLicencias;