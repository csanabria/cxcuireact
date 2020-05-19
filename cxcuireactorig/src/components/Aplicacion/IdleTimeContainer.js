import React, {useRef, useState} from 'react';
import { Modal, Button } from 'react-bootstrap';
import IdleTimer from 'react-idle-timer';
/* Fuente: https://www.youtube.com/watch?v=_wgCPufTAYI&t=408s */

const IdleTimeContainer = (props) => {
    const [isLoggedIn, setIsLoggedIn] = useState(true);
    const [modalIsOpen, setModalIsOpen] = useState(false);
    const [contadorSesion, setContadorSesion] = useState(10);

    const idleTimerRef = useRef(null);
    const sessionTimeoutRef = useRef(null);
    const contadorTimeoutSesionRef = useRef(null)
    // const disminuirContadorSesion = () => {
    //     while (contadorSesion > 0) {
    //         const interval = setInterval(() => {
    //             setContadorSesion(contadorSesion - 1);
    //             alert(contadorSesion)
    //         }, 1000);
    //     }
    //     //return () => clearInterval(interval);
    // }
    const onIdle = () => {
        //console.log("user is idle")
        setModalIsOpen(true);
        setContadorSesion(10);  //reiniciarlo por si se carga varias veces el modal
        sessionTimeoutRef.current = setTimeout(salir, 10000);
        ///disminuirContadorSesion();
    }
    const mantenerSesion = () => {
        setModalIsOpen(false);
        //limpiar el timeot de sesion
        clearTimeout(sessionTimeoutRef.current);
        setIsLoggedIn(true);
    }
    const salir = () => {
        //la defino de nuevo pues no solo ocupo salir sino ocultar el modal, luego llamar a la función de props
        setModalIsOpen(false);
        //limpiar el timeot de sesion
        clearTimeout(sessionTimeoutRef.current);
        props.salir();
    }
    
    //debugger;
    return (
        <>
            {
                (modalIsOpen)
                ?
                    (<Modal show={modalIsOpen}>
                        <Modal.Header>
                            <Modal.Title>Sin actividad...</Modal.Title>
                        </Modal.Header>
        
                        <Modal.Body>
                            <p>Su sesión se cerrará en {contadorSesion} seguntos</p>
                        </Modal.Body>
        
                        <Modal.Footer>
                            <Button onClick={salir} variant="secondary">Salir</Button>
                            <Button onClick={mantenerSesion} variant="primary">Mantener sesión activa</Button>
                        </Modal.Footer>
                    </Modal>
                )
                :
                    null
            }
            <div>
                <IdleTimer 
                    ref={idleTimerRef} 
                    timeout={30000} /*ACA*/
                    onIdle={onIdle} >

                </IdleTimer>
            </div>
        </>
    )
}

export default IdleTimeContainer
