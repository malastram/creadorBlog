/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//implementar eventlistener para menu desplegable mobile

let buttonMobile = document.getElementsByClassName("fa-bars")[0];
  //  let buttonMobile = document.getElementById("menuMov");
    let listaLogMov = document.getElementsByClassName("listaLogSupMobile")[0];
    let hPrin = document.getElementsByClassName("headerPrin")[0];
    let estilosListaLM = window.getComputedStyle(listaLogMov);  //extraer lista de estilos del elemento pasado como parámetro

    buttonMobile.addEventListener("click", function() {
       // alert("click");
        if (estilosListaLM.getPropertyValue("display") !== "none") {
            listaLogMov.style.display = "none";
        } else {

            listaLogMov.style.display = "flex";
            listaLogMov.style.flexDirection = "column";
        }
        if (estilosListaLM.getPropertyValue("display") !== "none") {

            document.getElementsByTagName("main")[0].addEventListener("click", function () {
                listaLogMov.style.display = "none";
                hPrin.style.display = "flex";

            });
        }

    });
