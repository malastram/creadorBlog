<%-- 
    Document   : login
    Created on : 05-jun-2023, 9:58:29
    Author     : Maik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Login</title>
    </head>
     <body>
        <%@ include file="header.jsp" %>
        <main>
            <aside></aside>
            <div class="cuerpoForm">
            <h1>Login</h1>
           
             
            <div class="formReg">
            <form action="controller/passLogin.jsp"   method="POST" >
                    <label>Usuario:</label>
                    <input type="text" name="nombre">
                    <label>Contraseña:</label>
                    <input type="text" name="contrasena">
                    <input type="submit" value="Entrar">

                </form>  
            </div>
            </div>
        </main>
             <%@include file="footer.jsp" %>
    </body>
</html>
