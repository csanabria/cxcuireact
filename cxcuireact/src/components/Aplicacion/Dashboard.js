import React, {useContext} from 'react'
import AppContext from '../../Context/AppContext'
import DatosSocio from './DatosSocio'
import TablaCuentas from './TablaCuentas'

const Dashboard = () => {
    //debugger;
    return (
        <div>
            <DatosSocio />
            <TablaCuentas />
        </div>
    )
}

export default Dashboard
