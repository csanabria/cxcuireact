$(document).ready(function () {
    //carga la imagen de cargando
    //$.LoadingOverlaySetup({ image: rootDirImage + "/Content/img/anim_tec.gif", maxSize: "128px", minSize: "75px", resizeInterval: 0, size: "100%" });
    //$.LoadingOverlaySetup({ image:'../../Content/img/anim_tec.gif', maxSize: "128px", minSize: "75px", resizeInterval: 0, size: "100%" });
    
    $('#idusererror').hide();
    $('#idpasserror').hide();
    $('#circularG').hide();

    $('#pass').keypress(function (e) {
    
        if (e.which === 13) {

            Autenticar();
            return false;
        }
       
    });


    $('#ingresar').on("click", function (e) {
        
        Autenticar();
        return false;
    });
});

//Autentica al usuario
function Autenticar() {
    $.LoadingOverlay("show");

    $('#idusererror').hide();
    $('#cargando').show();
    $('#idpasserror').hide();
    var user = $('#user').val();
    var pass = $('#pass').val();

    if ((user === "") || (pass === "")) {
        $('#popValidacion').modal('show');
        $('#popValidacion .popMensaje').html("Los datos no pueden ser vacíos.");
        $('#cargando').hide();
    } else {
        $.ajax({
            url: rootDirImage + 'Login/ValidarUsuario',
            dataType: 'json',
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify({ "usuario": user, "contrasena": pass }),
            processData: false,
            success: function (data, textStatus, jQxhr) {
                if (data.CodigoRespuesta === 0) {
                    BuscarPermisosUsuario();
                    $.LoadingOverlay("hide");
                } else {
                    $('#popValidacion').modal('show');
                    $('#popValidacion .popMensaje').html(data.MensajeRespuesta);
                    $('#cargando').hide();
                    $.LoadingOverlay("hide");
                }
               
            },
            error: function (jqXhr, textStatus, errorThrown) {
                console.log(errorThrown);
                $('#popValidacion').modal('show');
                $('#popValidacion .popMensaje').html('Ocurrió un problema inténtalo de nuevo.');
                $.LoadingOverlay("hide");
            }
        });
    }
    //$.LoadingOverlay("hide"); //Se quita porque se oculta antes de tiempo.
}

//Consulta si el usuario tiene permisos en la aplicación
function BuscarPermisosUsuario() {
    $.ajax({
        url: rootDirImage + 'Login/ConsultarPermisosUsuario',
        dataType: 'json',
        type: 'post',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify({ "idPadre": 0 }),
        processData: false,
        success: function (data, textStatus, jQxhr) {
            if (data.CodigoRespuesta === 0) {
                window.location.href = rootDirImage + 'Home/Index';
            }
            else {
                $('#cargando').hide();
                $('#popValidacion').modal('show');
                $('#popValidacion .popMensaje').html('Usuario no tiene permisos para ingresar a este sistema.');
            }
        },
        error: function (jqXhr, textStatus, errorThrown) {
            console.log(errorThrown);
            $('#cargando').hide();
            $('#popValidacion').modal('show');
            $('#popValidacion .popMensaje').html('Ocurrió un problema inténtalo de nuevo.');
        }
    });
}