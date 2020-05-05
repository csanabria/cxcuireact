import React from 'react'
import { Link } from 'react-router-dom';
import './menu.css'

const Menu = () => {
    return (
        <ul className="menu">
            <li><Link to="/licencias">Home</Link></li>
        </ul>
    )
}

export default Menu
