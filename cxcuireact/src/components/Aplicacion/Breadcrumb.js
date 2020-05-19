import React from 'react'
import {Link} from 'react-router-dom'
import { House } from 'react-bootstrap-icons';

const Breadcrumb = ({children}) => {
    return (
        <>
          <Link to="/inicio"><House />Inicio</Link>
          {children}  
        </>
    )
}

{children}export default Breadcrumb
