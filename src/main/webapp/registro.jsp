<%-- 
    Document   : registro
    Created on : 05-jun-2023, 9:58:00
    Author     : Maik
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Registro</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h2>Registro</h2>
        <%
            ArrayList<String> usuarios =  Contenido.mostrarUsuarios();%>
        <p hidden id="usuarios"> <%=usuarios.toString()%></p>
        <div class="formReg">
            <form action="controller/passRegistro.jsp"   method="POST" >
                <fieldset>
                    <legend>Regístrate para empezar a crear entradas</legend>
                    <div class="partForm"> 
                        <label>Nombre</label>
                        <input type="text" placeholder="escriba su nombre" name="nombre" class="campoForm" required>
                    </div>
                    <div class="partForm"> 
                        <label>Apellidos</label>
                        <input type="text" placeholder="escriba sus apellidos" class="campoForm" name="apellidos" required>
                    </div>
                    <div class="partForm"> 
                        <label>Nickname</label>
                        <input type="text" placeholder="escriba su nickname" class="campoForm" name="nickname" id="insertNombre" required>
                    </div>
                    <div class="partForm">  <label>Email</label>
                        <input type="email" placeholder="escriba su correo" class="campoForm" name="correo" required ></div>
                    <div class="partForm">    <label>Password</label>
                        <input type="password" placeholder="escriba su contraseña" name="password" required id="password" class="campoForm" title="La contraseña ha de tener mínimo 8 carácteres, además de un dígito, un carácter especial , una mayúscula y una minúscula."></div>
                     <div class="partForm">    <label>Repetir password</label>
                        <input type="password" placeholder="repita su contraseña" name="password2" required id="password2"  class="campoForm" ></div>
                    <div class="partForm">    
                        <label>Edad</label>
                        <input type="text" placeholder="escriba su edad" name="edad" class="campoForm"></div>

                    <div class="partForm"> <div></div>
                        <input type="submit" value="Envia" id="confirmarReg">
                    </div>
                </fieldset>
            </form>
        </div>
        <div id="outputPassword"></div>
         <div id="outputUser"></div>
                <script src="js/jquery-3.7.0.min.js"></script> 

        <script src="js/registro.js"></script>
               <script src="js/responsive.js"></script>
        
    </body>
</html>
