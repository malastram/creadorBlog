<%-- 
    Document   : crearEntrada
    Created on : 08-jun-2023, 10:06:31
    Author     : Maik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Entrada blog</title>
    </head>

    <%@ include file="header.jsp" %>
    <h2>Introduce el contenido:</h2>
    <%if (session.getAttribute("nombre") != null) {
    %>
    <p hidden id="nombreAvatar"><%= session.getAttribute("nombre").toString()%></p>
    <%} else {
            response.sendRedirect("index.jsp");
        }%>
    <div id="inputDatos">

        <div id="selectCategoria">
            <label>Seleccionar categoria</label>
            <select id="categoria">
                <option value="informatica">Informática general</option>
                <option value="varios">Varios</option>
                <option value="js">JavaScript</option>
                <option value="java">Java</option>
                <option value="diseno">Diseño web</option>

            </select>
        </div>


        <div id="cabezeraElementos">

            <div id="inputCabezera"> 
                <p>Cabezera</p>
                <input type="text" id="textoCabezera">                    

            </div>
            <div>   
                <input type="button" id="buttonCabezera" value="Enviar">
                <input type="button" id="buttonModCabezera" value="Cambiar" hidden>
                <p id="cabezera" hidden></p>
            </div>
        </div>
        <div id="cuerpoEntrada" >   
            <div id="selectEntrada">
                <select id="entrada">
                    <option value="parrafo">Parrafo</option>
                    <option value="imagen">Imagen</option>
                </select>
            </div>

            <div id="entradaElementos" >
                <div><p>Cuerpo de la entrada</p>
                    <textarea id="textoEntrada" placeholder="Escriba aquí el contenido de la entrada"></textarea> 
                </div>
                <div>
                    <input type="button" id="buttonCuerpo" value="Enviar">
                    <input type="button" id="buttonModCuerpo" value="Cambiar" hidden>
                </div>
            </div>

            <div id="imagenEntrada" hidden>          

                <p>Imagen</p>                        
                <input type="file" id="imagen" multiple>
                <input type="button" id="buttonImagen" value="Enviar">
            </div>
        </div>

        <div id="generar">           
            <input type="button" id="buttonGenerar" value="Guardar datos">

        </div>
    </div>
    <div id="outputDatos"></div>
    <script src="js/entrada.js"></script>

</body>
</html>
