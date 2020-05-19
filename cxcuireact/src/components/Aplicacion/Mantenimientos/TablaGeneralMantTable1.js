import React, {useState, useEffect, useContext} from 'react'
import {BootstrapTable, TableHeaderColumn} from 'react-bootstrap-table';
//import '../../../../node_modules/react-bootstrap-table/dist/react-bootstrap-table-all.min.css';



const TablaGeneralMant = (props) => {
    const datos = props.datos;
    debugger;

    return (
        <div>
            <BootstrapTable data={datos} striped hover>
                <TableHeaderColumn isKey dataField='id'>ID</TableHeaderColumn>
                <TableHeaderColumn dataField='nombre'>Nombre</TableHeaderColumn>
                <TableHeaderColumn>Acciones</TableHeaderColumn>
            </BootstrapTable>,
        </div>
    )
}

export default TablaGeneralMant
