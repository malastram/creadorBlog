/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
let articulos = document.getElementsByClassName("articuloIndividual");
//alert(articulos.length);
console.log("length de los nodos: " + articulos.length);
let parr = "";
let tit = "";
let contenido = [];
for (let i = 0; i < articulos.length; i++) {
    console.log(articulos[i].tagName);
   
        contenido.push("<div class='gestEntradas'><div class='divGestEntradas'><table><tr><th><p>Fecha</p></th><th><p>Título</p></th><th><p>Categoría</p></th><th><p>Eliminar</p></th></tr>"
                + "<tr><td>" + articulos[i].getElementsByTagName("h3")[0].outerHTML.split(" ")[3] + "</td><td>" +"<p>"+ articulos[i].getElementsByTagName("h1")[0].outerHTML.slice(4,-3) +"</p>" +"</td><td>" + articulos[i].getElementsByTagName("h3")[1].outerHTML.split(":")[1] +
                "</td><td><input type='checkbox' name='filas' form='formEliminar' value='" + articulos[i].getElementsByTagName("p")[0].innerHTML + "'></td></tr></table></div>");
   

}

//SE PODRIA MEJORAR INCLUYENDO EN CADA ENTRADA UN DIV HIDDEN CON LAS IMAGENES DE CADA ARTICULO
// CON EL PROPOSITO DE ENVIARLO VIA POST PARA ELIMINAR LOS ARCHIVOS EN LOCAL
let divPrin = document.getElementsByClassName("principal")[0];
divPrin.innerHTML = "";

console.log("contenido " + contenido);
for (let i = 0; i < contenido.length; i++) {



    if (i === 0) {
        divPrin.innerHTML = "<h1>Creador de posts</h1><img src='img/javaProgramming.webp' alt='noImage' class='imCabezera'><h2>Selecciona los artículos que deseas eliminar.</h2>";
        divPrin.innerHTML += contenido[i];
    } else {
        divPrin.innerHTML += contenido[i];

    }
}
divPrin.innerHTML += "<form id='formEliminar' method='POST' action='controller/eliminarArticulos.jsp'> <input type='submit' class='buttondel' value='eliminar' id='buttondel'></form>";


