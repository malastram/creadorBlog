<%-- 
    Document   : configPerfil
    Created on : 14-jun-2023, 8:35:28
    Author     : Maik
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>

        <h1>Hello World!</h1>
        <%
            String skinSelect = request.getParameter("skin").toString();
            out.println("<p>Has seleccionado " + skinSelect+"</p>");
            session.setAttribute("skin", skinSelect);
            out.println("<p>"+session.getAttribute("nombre").toString()+"</p>");

            if (BBDDConnexion.conecta() != null) {
                PreparedStatement stm = BBDDConnexion.conecta().prepareStatement("UPDATE user SET skin = ? WHERE nickname = ?");
                stm.setString(1, skinSelect);

                stm.setString(2, session.getAttribute("nombre").toString());
                stm.executeUpdate();
stm.close();
          out.println("<p>connected</p>");

            }else{
          out.println("<p>no connected</p>");
            }
            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
