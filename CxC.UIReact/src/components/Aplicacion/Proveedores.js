import React from 'react';
import grupos from './contenido.json';

const Grupos = props => {
  return (
    <select className="grupos">
      {grupos.map(item => <option value={item.id} selected={item.id == props.idSeleccionado}>{item.name}</option>)}
    </select>
  );
}

export default Grupos;