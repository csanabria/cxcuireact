import React from 'react';
import ReactDOM from 'react-dom';
import {BrowserRouter } from 'react-router-dom';
import { usePromiseTracker } from "react-promise-tracker";
import App from './App';
import AppContext, {estadoInicialGlobal} from './context/AppContext';

//css del responsive navigation menu
import './Content/scss/baseResponsiveNav.scss';

const LoadingIndicator = props => {
    const { promiseInProgress } = usePromiseTracker();
    return (
        promiseInProgress && 
        <h1>Hey some async call in progress ! </h1>
    );  
}

ReactDOM.render(
    <AppContext.Provider value={estadoInicialGlobal}>
        <BrowserRouter>
            <App />
            <LoadingIndicator/>
        </BrowserRouter>
    </AppContext.Provider>, 
    document.getElementById('root'));

