import React from 'react'
import {Form, Button} from 'react-bootstrap'
const DetalleMantAuxiliares = (props) => {
    let registroActual = props.registro;
    return (
        <div className="DetalleMant">
            <h3>Detalle</h3>
            <Form>
                <Form.Group controlId="formId">
                    <Form.Label>Id</Form.Label>
                    <Form.Control type="text" placeholder="Id" value={registroActual.id} />
                    <Form.Text className="text-muted">
                        Lo define el sistema
                    </Form.Text>
                </Form.Group>
            
                <Form.Group controlId="formNombre">
                    <Form.Label>Nombre</Form.Label>
                    <Form.Control type="text" value={registroActual.nombre} />
                </Form.Group>
                <Button variant="primary" type="submit">
                    Guardar
                </Button>
            </Form>
        </div>
    )
}

export default DetalleMantAuxiliares
