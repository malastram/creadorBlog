/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let todasLasEntradas = document.getElementById("all");
let output = document.getElementById("principal");
let arrayIds = []; //todos los usuarios + all
let listUsers = document.getElementsByTagName("aside")[0].getElementsByTagName("h3");  //lista de todos los usuarios + "todos"

let fechas = document.getElementsByClassName("date");
for(let i=0; i< fechas.length; i++){
    let fecha = fechas[i].textContent.split(" ")[0];
    fechas[i].innerHTML ="Fecha de creación: "+fecha.split("-")[2]+ " / "+fecha.split("-")[1]+" / "+fecha.split("-")[0];
}

console.log("listauserstag: "+listUsers.length);
for (let i = 0; i < listUsers.length; i++) {
    listUsers[i].addEventListener("click", function () {
        mostrarContenido(listUsers[i].id);
    });
    arrayIds.push(listUsers[i].id.split("-")[0]);  //almacenamos solo el id: (ej) de 00-link nos quedamos con 00
    console.log(arrayIds);}

function mostrarContenido(id) {
    if (id === "all") {  //si se pulsa en todos...
        //quitar hiddens
        for (let i = 0; i < arrayIds.length; i++) {
            document.getElementById(arrayIds[i]).hidden = false;
        }

    } else {        //si se pulsa en un usuario
        for (let i = 0; i < arrayIds.length; i++) {

            if (arrayIds[i] !== "all") {     //excluir elemento con id all, ya que no forma parte del contenido
                if (arrayIds[i] === id.split("-")[0]) {
                    document.getElementById(arrayIds[i]).hidden = false;
                  
                } else {
                    document.getElementById(arrayIds[i]).hidden = true;

                }
            }
        }

    }
}



