<%-- 
    Document   : registro
    Created on : 05-jun-2023, 9:58:00
    Author     : Maik
--%>

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
        <div class="formReg">
            <form action="controller/passRegistro.jsp"   method="POST" >
                <fieldset>
                    <legend>Regístrate para empezar a crear entradas</legend>
            <div class="partForm"> 
                <label>Nombre</label>
                <input type="text" placeholder="escriba su nombre" name="nombre" required>
            </div>
             <div class="partForm"> 
            <label>Apellidos</label>
                <input type="text" placeholder="escriba sus apellidos" name="apellidos" required>
                </div>
             <div class="partForm"> 
            <label>Nickname</label>
                <input type="text" placeholder="escriba su nickname" name="nickname" required>
             </div>
            <div class="partForm">  <label>Email</label>
                <input type="email" placeholder="escriba su correo" name="correo" required></div>
            <div class="partForm">    <label>Password</label>
                <input type="password" placeholder="escriba su contraseña" name="password" required></div>
            <div class="partForm">    
                <label>Edad</label>
                <input type="text" placeholder="escriba su edad" name="edad" ></div>
                    
                    <div class="partForm"> <div></div>
            <input type="submit" value="Envia">
           </div>
                </fieldset>
        </form>
        </div>
        <script src="js/registro.js"></script>
    </body>
</html>
