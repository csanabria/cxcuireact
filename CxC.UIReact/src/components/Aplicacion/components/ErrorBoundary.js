import React,{Component} from 'react';

class ErrorBoundary extends React.Component {
    constructor(props) {
      super(props);
      this.state = { hasError: false,
                     error: null, 
                     errorInfo: null };
    }
  
    componentDidCatch(error, info) {
      // Display fallback UI
      this.setState({ hasError: true });
      // You can also log the error to an error reporting service
          // comentado pgamboa
      //logErrorToMyService(error, info);
      this.setState({
        error: error,
        errorInfo: info
      })
    }

    shouldComponentUpdate(nextProps, nextState) {
      if ( this.state.hasError ) {
        return false;
      }
      return true;
    }

    render() {
        if (this.state.hasError) {
            // Error path
            return (
                <div>
                <h2>Ha ocurrido un error interno. Por favor intente más tarde o comuníquese con el administrador del sistema.</h2>
                <details style={{ whiteSpace: 'pre-wrap' }}>
                    {this.state.error && this.state.error.toString()}
                    <br />
                    {this.state.errorInfo.componentStack}
                </details>
                </div>
            );
        }
        return this.props.children;
    }
  }

  export default ErrorBoundary;