/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



let articulos = document.getElementById("principal").childNodes;
//alert(articulos.length);
console.log("length de los nodos: "+articulos.length);
let parr = "";
let tit = "";
let contenido = [];
for (let i = 0; i < articulos.length; i++) {
  console.log(articulos[i].tagName); 
   if(articulos[i].tagName==="DIV"){
    contenido.push("<div class='gestEntradas'>"+articulos[i].getElementsByTagName("p")[0].outerHTML+articulos[i].getElementsByTagName("h1")[0].outerHTML+articulos[i].getElementsByTagName("p")[2].outerHTML+
           "<label><input type='checkbox' name='filas' form='formEliminar' value='"+articulos[i].getElementsByTagName("p")[1].innerHTML+"'>Seleccionar</label></div>");
   }

}


document.getElementById("principal").innerHTML = "";

console.log("contenido " + contenido);
for (let i = 0; i < contenido.length; i++) {
    console.log("length contenidoo  "+contenido.length);
    // console.log(" contenidoo  "+contenido[i].textContent);
    
    if(i===0){
    document.getElementById("principal").innerHTML =contenido[i];
    }else{
         document.getElementById("principal").innerHTML +=contenido[i];
        
    }
}
     document.getElementById("principal").innerHTML +="<form id='formEliminar' method='POST' action='controller/eliminarArticulos.jsp'> <input type='submit' class='buttondel' value='eliminar' id='buttondel'></form>";


