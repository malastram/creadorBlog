/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
window.onload = function () {

//guardaremos todo el cuerpo de la entrada
    let stringCabezera = "";
    let arrayElementos = [];
    let arrayImagenes = [];
    let contadorCabezeras = 0;
    let nombreAvatar = document.getElementById("nombreAvatar").innerHTML;
    let output = document.getElementById("outputDatos");


    function guardarCabezera() {
        let cabezera = document.getElementById("textoCabezera");
        let cabezeraText = document.getElementById("cabezera");
        if (contadorCabezeras >= 1) {
            let nodo = document.createElement("h2");
            nodo.innerHTML = cabezera.value;
            output.appendChild(nodo);
            arrayElementos.push("<h2>" + cabezera.value + "</h2>");
            contadorCabezeras++;
            console.log(contadorCabezeras);
            cabezera.value = "";
        } else {
            let nodo = document.createElement("h1");
            nodo.innerHTML = cabezera.value;
            output.appendChild(nodo);
            arrayElementos.push("<h1>" + cabezera.value + "</h1>");
            contadorCabezeras++;
            console.log(contadorCabezeras);
            cabezera.value = "";

        }

        cabezeraText.innerHTML = cabezera;

    }

    function modificar(elem) {

    }

    function seleccion() {
        if (select.value === "parrafo") {
            document.getElementById("entradaElementos").hidden = false;
            document.getElementById("imagenEntrada").hidden = true;
        } else if (select.value === "imagen") {
            document.getElementById("entradaElementos").hidden = true;
            document.getElementById("imagenEntrada").hidden = false;
        }
    }

    function generarHTML() {
        // Obtener el array de imágenes
        const imageArray = arrayImagenes;
        //Obtener categoria
        let categoria = document.getElementById("categoria").value;
        
        if(!categoria){
            categoria="informatica";
        }
        
        // Crear un objeto FormData
        var formData = new FormData();
        for (let i = 0; i < imageArray.length; i++) {
            formData.append('images[]', imageArray[i]);
            //console.log(imageArray[imageArray.length - 1].name);
        }
        formData.append('categoria', categoria);
        formData.append('elementos', arrayElementos.join(''));
       

        // Enviar los datos al servidor
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'http://localhost:8095/blog/controller/passFoto.jsp', true);
        xhr.overrideMimeType('text/xml; charset=iso-8859-1');
        //    xhr.setRequestHeader("Content-Type", "multipart/form-data");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Manejar la respuesta del servidor si es necesario
                console.log("RESPONSETEXT:"+xhr.responseText);

            }
        };
        xhr.send(formData);


        console.log("elemmmm " + arrayElementos);
        //vaciar arrays y visualización salida
        arrayElementos = "";
        arrayImagenes = "";
        output.innerHTML = "";
        output.innerHTML = "";

    }

    function anadirParr() {

        if (contadorCabezeras >= 1) {
            let campoEntrada = document.getElementById("textoEntrada");
            let parrafo = document.createElement("p");
            parrafo.textContent = campoEntrada.value;
            output.appendChild(parrafo);
            arrayElementos.push("<p>" + campoEntrada.value + "</p>");
            campoEntrada.value = "";
        } else {

            alert("Debes introducir primero la cabezera");
        }

    }
    function mostrarImagen(event) {
        var imagenSource = event.target.result;
        var contentImage = document.createElement("div");
        var previewImage = document.createElement("img");
        previewImage.src = imagenSource;
        previewImage.setAttribute("class", "imagenContenido");
        contentImage.appendChild(previewImage);
        output.appendChild(contentImage);

    }

    function addImages() {
        const input = document.getElementById('imagen');
        const files = input.files;

        anadirImg(files[files.length - 1]); //visualizar en pantalla la ultima imagen añadida

        for (let i = 0; i < files.length; i++) {
            const image = files[i];
            // Agregar la imagen al array
            arrayImagenes.push(image);
            arrayElementos.push("<img class='imagenContenido'src='" + "http://localhost:8095/blog/img/" + nombreAvatar + "/" + arrayImagenes[arrayImagenes.length - 1].name + "'>");//

        }
    }


    function anadirParr() {

        if (contadorCabezeras >= 1) {
            let campoEntrada = document.getElementById("textoEntrada");
            let parrafo = document.createElement("p");
            parrafo.textContent = campoEntrada.value;
            output.appendChild(parrafo);
            arrayElementos.push("<p>" + campoEntrada.value + "</p>");
            campoEntrada.value = "";
        } else {

            alert("Debes introducir primero la cabezera");
        }

    }
    function mostrarImagen(event) {
        var imagenSource = event.target.result;
        var contentImage = document.createElement("div");
        var previewImage = document.createElement("img");
        previewImage.src = imagenSource;
        previewImage.setAttribute("class", "imagenContenido");
        contentImage.appendChild(previewImage);
        output.appendChild(contentImage);

    }

    function addImages() {
        const input = document.getElementById('imagen');
        const files = input.files;

        anadirImg(files[files.length - 1]); //visualizar en pantalla la ultima imagen añadida

        for (let i = 0; i < files.length; i++) {
            const image = files[i];
            // Agregar la imagen al array
            arrayImagenes.push(image);
            arrayElementos.push("<img class='imagenContenido'src='" + "http://localhost:8095/blog/img/" + nombreAvatar + "/" + arrayImagenes[arrayImagenes.length - 1].name + "'>");//

        }
    }

    function anadirImg(imagen) {
        var lector = new FileReader();
        lector.addEventListener('load', mostrarImagen, false);
        lector.readAsDataURL(imagen);
    }



    let bCabezera = document.getElementById("buttonCabezera");
    let bModCabezera = document.getElementById("buttonModCabezera");
    let select = document.getElementById("entrada");
    let bGenerar = document.getElementById("buttonGenerar");
    let bCuerpo = document.getElementById("buttonCuerpo");
    let bImagen = document.getElementById("buttonImagen");

    //listeners

    bCabezera.addEventListener("click", guardarCabezera, false);
    bModCabezera.addEventListener("click", function () {
        modificar("cabezera");
    });
    select.addEventListener("change", function () {
        seleccion();
    });
    bGenerar.addEventListener("click", generarHTML, false);
    bCuerpo.addEventListener("click", anadirParr, false);

    // bImagen.addEventListener("change", anadirImg, false);
    bImagen.addEventListener("click", addImages, false);

};

