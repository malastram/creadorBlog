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

        <h1>Login</h1>     <form action="controller/passLogin.jsp"   method="POST" class="formLogin">
              <label>Usuario:</label>
              <input type="text" name="nombre">
              <label>Contraseña:</label>
                            <input type="password" name="contrasena">
                            <input type="submit" value="Entrar">

          </form>  
               <script src="js/responsive.js"></script>

    </body>
</html>
