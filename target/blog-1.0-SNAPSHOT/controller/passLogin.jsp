<%-- 
    Document   : passLogin
    Created on : 12-jun-2023, 10:32:43
    Author     : Maik
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            if (BBDDConnexion.conecta() != null) {
        %>
        <p>Conexión satisfactoria!</p>

        <%
            String nombre = request.getParameter("nombre");
            String contrasena = request.getParameter("contrasena");
            out.println(nombre);
            PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT * FROM user WHERE nickname =? AND contrasena=?");
            stmt.setString(1, nombre);
            stmt.setString(2, contrasena);
            ResultSet res = stmt.executeQuery();

            
            boolean existeUser = res.next();
            
           
           
                    
                
            //si no es correcto el login
            if (existeUser == false) {
                out.println("Login no correcto");
                response.sendRedirect("../index.jsp");
//si es correcto el login 
            } else {
                   
                   session.setAttribute("iduser", res.getString(1));
                out.println("Bienvenido " + nombre);
             
                session.setAttribute("nombre", nombre); //session nickname
                  stmt = BBDDConnexion.conecta().prepareStatement("SELECT skin FROM user WHERE nickname = ?");
                  stmt.setString(1, nombre);
                  res = stmt.executeQuery();
                  
                  String skin = "";
                  while (res.next()){
                    skin=    res.getString(1);
                  }
                                     System.out.println(skin);
 
                     
              response.sendRedirect("../index.jsp");
            }

            BBDDConnexion.conecta().close();
        } else {%>
        <p>Error de conexión</p>
        <%}%>
        <%
            out.print(BBDDConnexion.conecta());
        %>

    </body>
</html>
