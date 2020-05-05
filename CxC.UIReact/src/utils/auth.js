import { ThemeProvider } from "react-bootstrap";

class Auth {
    constructor() {
        this.authenticated = false;
    }

    //recibe la función a la que debe llamar al terminar el proceso
    login (cb) {
        //validar
        this.isAuthenticated = true;
        cb();
    }

    //recibe la función a la que debe llamar al terminar el proceso
    logout(cb) {
        //cerrar cosas
        this.isAuthenticated = false;
        cb();
    }

    isAuthenticated() {
        return this.isAuthenticated;
    }
}

export default new Auth();