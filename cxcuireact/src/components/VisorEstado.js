import React from 'react';
import './visorestado.css';

const VisorEstado = props => {
  var estilo = props.estilo;
  return (
    <div className={estilo}>
      <b>{props.titulo}</b>
      <pre>{JSON.stringify(props.estado, null, 2)}</pre>
      <br/>
      <br/>
    </div>
  )
}

export default VisorEstado;