import React, {useState, useEffect, useContext} from 'react'
import {Table } from 'react-bootstrap';
import { ArrowRight, EyeFill } from 'react-bootstrap-icons';
import AppContext, {estadoAppInicial} from '../../Context/AppContext'
import VisorEstado from '../VisorEstado'

import './TablaCuentas.css'
import datosTemp from './datosTemp.json'

import {BootstrapTable, TableHeaderColumn,SearchField} from 'react-bootstrap-table';

const TablaCuentas = () => {
  const {estadoApp, setEstadoApp} = useContext(AppContext);
  const [estadoLocal, setEstadoLocal] = useState({});

  const {modoDesarrollo} = estadoApp;
  useEffect(() => {
    //carga la tabla de cuentas del socio actual
    fetch('./datosTemp.json').then(response => {
      //debugger;
      response.json()
    })
    .then(data => {
      // Work with JSON data here
      //debugger;
      setEstadoLocal({
        data
      })
    }).catch(err => {
      // Do something for an error here
      console.log("Error Reading data " + err);
    });
    //debugger;
  }, [])

  // funcion para dar formato de fecha
  function dateToDMY(date) {
      var d = date.getDate();
      var m = date.getMonth() + 1; //Month from 0 to 11
      var y = date.getFullYear();
      return '' + (d <= 9 ? '0' + d : d) + '/' + (m<=9 ? '0' + m : m) + '/' + y;
  }

  const formatCurrency = (m) => {
    return "¢" + m.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
  }

  const cuentas = datosTemp.cuentas;
  
  //setEstadoLocal({cuentas})
  //setEstadoLocal({a : 1});
  debugger;
  return (
    <div className="tablaCuentas">
      <h2>Cuentas pendientes</h2>
      <hr/>
      {(modoDesarrollo)
            ?
                (
                    <>
                    {/* <VisorEstado estado={estadoApp} titulo="Estado Global" estilo="fijoDerechaBottom"/> */}
                    <VisorEstado estado={estadoLocal} titulo="Estado Local" estilo="fijoIzquierdaBottom"/>
                    </>
                )
            :
                (null)
            }

      <Table striped bordered hover>
        <thead>
          <tr>
            <th>#</th>
            <th>Fecha</th>
            <th>Concepto</th>
            <th>Monto</th>
            <th>Estado</th>
            <th>Acción</th>
          </tr>
        </thead>
        <tbody>
          {
            cuentas.map(cuenta => (
            <tr>
              <td>{cuenta.id}</td>
              <td>{cuenta.fecha}</td>
              <td>{cuenta.concepto}</td>
              <td>{cuenta.monto}</td>
              <td>{cuenta.estado}</td>
              <td><a ><EyeFill className="iconoAccion"/></a><a>&nbsp;<ArrowRight className="iconoAccion"/></a></td>
            </tr>))}
        </tbody>
      </Table>
    </div>
  )
}

export default TablaCuentas;


