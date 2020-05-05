// Constante para cargar Listados / Selects
import React from 'react';

// Puede usarse Props para obtener el json a formatear, igual con el nombre y otros elementos
const Listados = props => {
  var jsoncatalogo = props.catalogoJson;
  var nombre_item = props.campoNombre?"item."+props.campoNombre:"item.name";
  var nombre_id = props.campoId?"item."+props.campoId:"item.id";
  var opciones ="";
  
  ////debugger;
  
  // <select id={props.nombre} defaultValue={0} value={props.idSeleccionado} className="option select" name={props.nombre} onChange={props.FunctionPasada} disabled={props.SoloLectura} >
  // jsoncatalogo.map(item => <option key={"opcion_"+eval(nombre_item)+eval(nombre_id)} value={eval(nombre_id)} selected={eval(nombre_id) === props.idSeleccionado}>{eval(nombre_item)}</option>)
  if (jsoncatalogo !== null  && typeof(jsoncatalogo[0]) !== 'undefined' && jsoncatalogo[0] != null) {
    opciones = (
      jsoncatalogo.map(item => <option key={"opcion_"+eval(nombre_item)+eval(nombre_id)} value={eval(nombre_id)}>{eval(nombre_item)}</option>)
    );
  }

  //var otro = "<option value=0>Otros</option>";

  return (
    <select id={props.nombre} value={props.idSeleccionado} className="option select" name={props.nombre} onChange={props.FunctionPasada} disabled={props.SoloLectura} >
      {opciones}
      {props.incluyeOtros ==="Si"?<option value="0">[ Otro ]</option>:""}
    </select>
  );
}

export default Listados;