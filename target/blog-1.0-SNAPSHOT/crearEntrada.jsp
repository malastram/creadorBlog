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
     <main>
         <div class="principal">
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

         

                <h3>Cabezera</h3>
                <input type="text" id="textoCabezera">                    

                <input type="button" id="buttonCabezera" value="Enviar">
                <input type="button" id="buttonModCabezera" value="Cambiar" hidden>
                <p id="cabezera" hidden></p>
            </div>
<<<<<<< Updated upstream
        </div>
        <div id="cuerpoEntrada" >   
            <div id="selectEntrada">
                <select id="entrada">
                    <option value="parrafo">Párrafo</option>
                    <option value="nota">Nota</option>
                    <option value="imagen">Imagen</option>
                </select>
            </div>

            <div id="entradaElementos" >
                <div><p>Cuerpo de la entrada</p>
                    <textarea id="textoEntrada" placeholder="Escriba aquí el contenido de la entrada"></textarea> 
=======
            <div id="cuerpoEntrada" >   
                <div id="selectEntrada">
                    <select id="entrada">
                        <option value="parrafo">Párrafo</option>
                        <option value="nota">Nota</option>
                        <option value="imagen">Imagen</option>
                    </select>
>>>>>>> Stashed changes
                </div>

                <div id="entradaElementos" >
                    <div><h3>Cuerpo de la entrada</h3>
                        <textarea id="textoEntrada" placeholder="Escriba aquí el contenido de la entrada"></textarea> 
                    </div>
                    <div>
                        <input type="button" id="buttonCuerpo" value="Enviar">
                        <input type="button" id="buttonModCuerpo" value="Cambiar" hidden>
                    </div>
                </div>

                <div id="imagenEntrada" hidden>          

                    <h3>Imagen</h3>                        
                    <input type="file" id="imagen" multiple >
                    <input type="button" id="buttonImagen" value="Enviar">
                </div>
                <div id="entradaNota" hidden>  

                    <div>
                        <h3>Cuerpo de la anotación</h3>
                        <textarea id="textoNota" placeholder="Escriba aquí el contenido a resaltar"></textarea> 

                    </div>
                    <div> 
                        <input type="button" id="buttonNota" value="Enviar">
                        <input type="button" id="buttonModNota" value="Cambiar" hidden></div>
                </div>

            </div>

            <div id="generar">           
                <h3>Generar entrada</h3>
                <input type="button" id="buttonGenerar" value="Guardar datos">

            </div>
            <div id="entradaNota" hidden>  

                <div>
                    <p>Cuerpo de la anotación</p>
                    <textarea id="textoNota" placeholder="Escriba aquí el contenido a resaltar"></textarea> 

                </div>
                <div> 
                    <input type="button" id="buttonNota" value="Enviar">
                    <input type="button" id="buttonModNota" value="Cambiar" hidden></div>
            </div>

        </div>
        <div id="outputDatos"></div>
      
         </div>
</main>
        <%@include file="footer.jsp" %>
  <script src="js/entrada.js"></script>
       <script src="js/responsive.js"></script>
    </body>
</html>