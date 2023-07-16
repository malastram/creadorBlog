<%-- 
    Document   : crearEntrada
    Created on : 08-jun-2023, 10:06:31
    Author     : Maik
--%>

<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Modificar blog</title>
    </head>

    <%@ include file="header.jsp" %>
    <h2>Listado de elementos</h2>
    <%if (session.getAttribute("iduser") != null) {
    %>
    <p  id="nombreAvatar"><%= session.getAttribute("iduser").toString()%></p>
    <%
        
        
      out.print(Contenido.mostrarContenido(session.getAttribute("iduser").toString()));
        
        
        } else {
            response.sendRedirect("index.jsp");
        }%>
  
    <div id="outputDatos"></div>
    <script src="#"></script>

</body>
</html>
