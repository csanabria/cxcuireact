import React, {useState, useEffect, useContext} from 'react'
import BootstrapTable from 'react-bootstrap-table-next';
import 'react-bootstrap-table-next/dist/react-bootstrap-table2.min.css';
import './TablaGeneralMant.css'

const TablaGeneralMant = (props) => {

    const {datos, setRegistro} = props;

    const columns = [{
      dataField: 'id',
      text: 'Id'
    }, {
      dataField: 'nombre',
      text: 'Nombre'
    }];
    //debugger;

    const rowEvents = {
        onClick: (e, row, rowIndex) => {
          e.preventDefault();
          setRegistro({id : row.id, nombre : row.nombre})
        }
      };

    const selectRow = {
        mode:'radio',
        clickToSelect: true,
        style: { background: '#87CEFA' }
      };

    return (
        <div class="row justify-content-center TablaMant">
            <div class="col-auto">
                <BootstrapTable keyField='id' 
                    data={ datos } 
                    columns={ columns } 
                    rowEvents={ rowEvents }
                    selectRow={ selectRow }/>
            </div>
        </div>
    )
}

export default TablaGeneralMant
