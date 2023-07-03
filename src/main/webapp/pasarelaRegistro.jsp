<%-- 
    Document   : newjsppasarelaRegistro
    Created on : 06-jun-2023, 12:23:26
    Author     : Maik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="cat.xtec.ioc.portfolio.connexion.BBDDConnexion" %>
        
        <h1>Hello World!</h1>
        <%
            if(BBDDConnexion.conecta()!=null){
            %>
            <p>Conexión satisfactoria!</p>
            <%
                }
else{%>
<p>Error de conexión</p>
<%}%>
            %>
            
    </body>
</html>
