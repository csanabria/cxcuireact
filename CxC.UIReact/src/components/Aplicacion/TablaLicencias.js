import React,{Component} from 'react';
import {BootstrapTable, TableHeaderColumn,SearchField} from 'react-bootstrap-table';
import BootstrapTable2 from 'react-bootstrap-table-next';
import './Tabla.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.min.js';
import 'react-bootstrap-table/dist/react-bootstrap-table-all.min.css';
import 'react-bootstrap-table/dist/react-bootstrap-table.min.js';
import {Redirect} from "react-router-dom";
import imgEditar from './Content/img/glyphicons-edit.png'
import imgRenovar from './Content/img/glyphicons-renew.png'
import imgVer from './Content/img/glyphicons-view.png'
//contexto global de la aplicación
import AppContext from '../../context/AppContext';

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

// Clase para tabla secundaria
class BSTable extends Component {
  constructor(props) {
    super(props);

    this.state = {
        // Redireccionamiento
        redirect: false,
        idLicenciaSeleccionada:0,
        idAccion:2
      }           
      
  }

  setRedirect = (pidLicencia,piAccion) => {
    this.setState({
      redirect: true,
      idLicenciaSeleccionada:pidLicencia,
      idAccion:piAccion
    })
  }

  renderRedirect = () => {
    
    if (this.state.redirect) {
      var ruta = "";
        this.state.idAccion === "1" ? ruta = this.props.urlInstalacion + "/inicio/consultar"
        : this.state.idAccion==="2" ? ruta = this.props.urlInstalacion + "/inicio/editar"
        : this.state.idAccion==="3" ? ruta = this.props.urlInstalacion + "/inicio/renovar"
        : this.state.idAccion==="4" ? ruta = this.props.urlInstalacion + "/inicio/nueva"
        : ruta = ""
  
      //return <Redirect to='/editar' />
      return <Redirect
                to={{
                  //pathname: this.state.idAccion==="1"?"/inicio/consultar":this.state.idAccion==="2"?"/inicio/editar":this.state.idAccion==="3"?"/inicio/renovar":this.state.idAccion==="4"?"/inicio/nueva":"",
                  pathname: ruta,
                  search: "",
                  state: { pidLicencia: this.state.idLicenciaSeleccionada, pidAccion: this.state.idAccion }
                }}
            />
    }
  }

  cellButton(cell, row, enumObject, rowIndex) {
    return ( 
      <React.Fragment>
          {this.props.PermisosComponente.ModificarLicencia?<input type="image"  className="icono" src={imgEditar} onClick={() => this.setRedirect(row.IdLicencia,"2")} alt="Editar" title="Editar"/>:null}
          {this.props.PermisosComponente.RenovarLicencia?<input type="image"  className="icono" src={imgRenovar} onClick={() => this.setRedirect(row.IdLicencia,"3")}  alt="Renovar" title="Renovar"/>:null}
          {this.props.PermisosComponente.DetalleLicencia?<input type="image"  className="icono" src={imgVer} onClick={() => this.setRedirect(row.IdLicencia,"1")} alt="Consultar" title="Consultar"/>:null}
      </React.Fragment>
    )
  }    

  formato_fila() {
    return 'tabla_td3';
  }

  render() {
      /*<TableHeaderColumn dataField='FechaVencimiento' dataFormat={ this.formatDateTime }>Fecha Vencimiento</TableHeaderColumn>*/
      /*            <TableHeaderColumn dataField='sessionDetails' columnClassName={ this.formato_fila() } dataFormat={this.cellButton.bind(this)}>Acciones</TableHeaderColumn> */

      const columns = [{
        dataField: 'IdLicencia',
        text: '#'
      }, {
        dataField: 'Nombre',
        text: 'Nombre'
      }, {
        dataField: 'FechaVencimiento',
        text: 'Fecha Vencimiento',
        formatter: formatDateTime,
      }, {
        dataField: 'Costo',
        text: 'Costo',
        formatter: formatCurrency
      }, {
        dataField: 'DescripcionPr',
        text: 'Prioridad'
      }, {
        dataField: 'Cantidad',
        text: 'Cantidad'
      }, {
        dataField: 'DescripcionFL',
        text: 'Forma Licenciamiento'
      }, {
        dataField: 'DescripcionGL',
        text: 'Proveedor'
      }, {
        dataField: 'Estado',
        text: 'Estado'
      }, {
        dataField: '',
        text: 'Acciones',
        formatter: (cell, row, enumObject, rowIndex) => {
          return this.cellButton(cell,row,enumObject,rowIndex);
        }
      }];
      
      return (
        <React.Fragment>
          {this.renderRedirect()}
          <BootstrapTable2 keyField='id' data={ this.props.data ?  this.props.data : [] } columns={ columns } wrapperClasses="table-responsive" classes="table_responsiva"/>
        </React.Fragment>
      );
  } // Fin Render 
} // Fin de clase de tabla secundaria

  // Clase para expandir una fila
class ExpandRow extends Component {
  // Carga el contexto
  static contextType = AppContext;

  // Constructor de Tabla
  constructor (props, context) {
    super(props, context)
    debugger;
    this.estadoGlobal = context;

    //poner los valores del estado global (contexto) en variables de la clase
    const {urlInstalacion} = this.estadoGlobal;
    this.urlInstalacion = urlInstalacion;

    this.state = {
         
      };

      this.handleExpand = this.handleExpand.bind(this);
      this.setRedirect = this.props.setRedirect.bind(this);
      this.expandComponent = this.expandComponent.bind(this);
    }
      
    handleExpand(rowKey, isExpand, e) {
      if (isExpand) {
        console.log(`row: ${rowKey} is ready to expand`);
      } else {
        console.log(`row: ${rowKey} is ready to collapse`);
      }
      console.log(e);
    }
  
    isExpandableRow(row) {
      // console.log(row);
      if (row.Licencias) return true;
      else return false;
      // return true;
    }
  
    expandComponent(row) {
      // console.log(typeof row, row);
      return (
        <div className="div_largo">
          <BSTable urlInstalacion={this.urlInstalacion} PermisosComponente={ this.props.PermisosComponente} setRedirect={ this.setRedirect} data={ row.Licencias ? row.Licencias : []  } />
        </div>  
      );
    }
  
    expandColumnComponent({ isExpandableRow, isExpanded }) {
      // console.log(isExpanded, "isExpandable");
      let content = '';
  
      if (isExpandableRow) {
        content = (isExpanded ? '(-)' : '(+)' );
      } else {
        content = ' ';
      }
      return (
        <div className="toggleExpandIcon"> { content } </div>
      );
    }
  
    // Personaliza el search
    createCustomSearchField = (props) => {
      return (
        <SearchField
            className='my-custom-class'
            placeholder='Buscar'/>
      );
    }

    render() {
      // console.log(this.props.expand, "propsExpandRows ===");
      //alert("Permisos:"+this.state.PermisosComponente.RenovarLicencia+this.state.PermisosComponente.ModificarLicencia+this.state.PermisosComponente.DetalleLicencia);

      const options = {
        expandRowBgColor: '#E6E6E8',
         expanding: this.props.expand, 
         sizePerPageList: [ {
                            text: '10', value: 10
                          }, {
                            text: '20', value: 20
                          }, {
                            text: '30', value: 30
                          }], // you can change the dropdown list for size per page
         sizePerPage: parseInt(this.props.filasenpagina),  // which size per page you want to locate as default
         pageStartIndex: 1, // where to start counting the pages
         paginationSize: 3,  // the pagination bar size.
         noDataText: 'No hay datos disponibles',
   
        /* 1) If Empty then all Rows will get collapsed by default
           2) expand only one / multiple ["licencias data of Row 1"] ?  ["licencia data of Row 1", "licencia data of Row 2", ....]
        */
       searchField: this.createCustomSearchField,
        onExpand: this.handleExpand
      };

      /* -- Constante para uso con datatable
      const columns = [{
        dataField: 'IdGrupoLicencias',
        text: '#',
        classes: 'id-custom-cell', 
        style: {'white-space': 'nowrap'} 
      }, {
        dataField: 'DescripcionGL',
        text: 'Nombre'
      }, {
        dataField: 'FechaVencimiento',
        text: 'Fecha Vencimiento',
        formatter: formatDateTime,
      }, {
        dataField: 'Costo',
        text: 'Costo',
        formatter: formatCurrency
      }, {
        dataField: 'DescripcionPr',
        text: 'Prioridad'
      }];
*/
      return (
        <React.Fragment>
            <BootstrapTable className="table_adaptable" data={ this.props.data ? this.props.data : [] }
              version='4'
              tableContainerclassName='tbPrincipal'
              options={ options }
              expandableRow={ this.isExpandableRow }
              expandComponent={ this.expandComponent }
              expandColumnOptions={ {
                expandColumnVisible: true,
                expandColumnComponent: this.expandColumnComponent,
                columnWidth: 50
              } } search pagination={true} striped hover>
                <TableHeaderColumn  width="5%" dataField='IdGrupoLicencias' isKey={ true }>#</TableHeaderColumn>        
                <TableHeaderColumn thStyle={{ whiteSpace: 'normal' }} dataField='DescripcionGL'>Bien o Servicio </TableHeaderColumn>
                <TableHeaderColumn dataField='FechaVencimiento' dataFormat={formatDateTime}>Fecha Vencimiento</TableHeaderColumn>
                <TableHeaderColumn dataField='Costo' dataFormat={formatCurrency}>Monto</TableHeaderColumn>
                <TableHeaderColumn dataField='DescripcionPr'>Prioridad</TableHeaderColumn>        
            </BootstrapTable>            
          </React.Fragment>
  
      );
    }
  }
  
  // Componente de Tabla de Licencias
  class TablaLicencias extends Component {
    constructor(props){
      super(props);
      this.state ={
        data: null,
        expandRows: null
      };
    }
 
    // Carga los items en data
    componentDidMount(){
        this.setState({data: this.props.licencias, 
                       expandRows: []});
    }

    render() {
      return (
        <div>
          <ExpandRow 
             PermisosComponente={ this.props.PermisosComponente}
             filasenpagina={this.props.filasenpagina}
             data={this.props.licencias ? this.props.licencias: ''}
             expand={this.state.expandRows} 
             setRedirect={this.props.setRedirect}
            />
        </div>);
    }
  } // Fin clase TablaLicencias
  
  export default TablaLicencias;