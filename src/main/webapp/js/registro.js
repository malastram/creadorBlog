/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#confirmarReg").prop("disabled", true);
$("#confirmarReg").css("background-color", "darkgray");

let nombreOK = false;
let passwordOK = false;
let allCamposOK = false;

$("#password").keyup(function (e) {

    var data = $("#password").val();
    var regex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*_])");  //1 minuscula, 1 mayuscula, 1 digito y 1 caracter especial
    var testPassword = regex.test(data);  //comprobamos la expresión regular
    console.log(data.length + " regex: " + testPassword);

    if (data.length < 5) {
        procesarComentario("<p>Contraseña débil!</p>", "1");
        $("#outputPassword").css("color", "red");
        passwordOK = false;
    } else if (data.length >= 5 && data.length <= 8) {
        procesarComentario("<p>Contraseña media!</p>", "1");
        $("#outputPassword").css("color", "orange");
        passwordOK = false;

    } else if (data.length > 8 && testPassword) {
        procesarComentario("<p>Contraseña fuerte!</p>", "1");
        $("#outputPassword").css("color", "green");
        passwordOK = true;
    }
    comprobarForm();
});

$("#insertNombre").keyup(function (e) {
    var data = $("#insertNombre").val();
    var users = $("#usuarios").text();
    var usersOK = users.slice(2, users.length - 1);
    var arrayUsers = usersOK.split(", ");
    console.log(usersOK);
    if (arrayUsers.includes(data)) {

        nombreOK = false;
        procesarComentario("<p>El usuario " + data + " ya existe!!</p>", "2");

    } else {
        procesarComentario("");
        nombreOK = true;
    }

    comprobarForm();
});


$(".campoForm").keyup(function (e) {
    comprobarCampos();
});


function procesarComentario(datos, out) {
    if (out === "1") {
        $("#outputPassword").html(datos);
    }

    if (out === "2") {
        $("#outputUser").html(datos);

    }
}

function comprobarCampos() {
    let camposOK = 0;    //si encuentra 1 campo vacio, suma 1
    $(".campoForm").each(function () {
        if ($(this).val() === "") {
            camposOK++;
        }

        if (camposOK < 1) {

            allCamposOK = true;

        } else {

            allCamposOK = false;

        }
        comprobarForm();
    });

}

function comprobarForm() {

    let samePass = false;
    if ($("#password").val() === $("#password2").val()) {
        samePass = true;
    }
    if (nombreOK && passwordOK && allCamposOK && samePass === true) {
        $("#confirmarReg").prop("disabled", false);
        $("#confirmarReg").css("background-color", "limegreen");
    } else {
        $("#confirmarReg").prop("disabled", true);
        $("#confirmarReg").css("background-color", "darkgray");
    }


}
