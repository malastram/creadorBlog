<%-- 
    Document   : newjsppasarelaRegistro
    Created on : 06-jun-2023, 12:23:26
    Author     : Maik
--%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion" %>


        <%
            if (BBDDConnexion.conecta() != null) {
        %>
        <p>Conexión satisfactoria!</p>

        <%
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String edad = request.getParameter("edad");
                String correo = request.getParameter("correo");
                String contrasena = request.getParameter("password");
                String nickname = request.getParameter("nickname");

                PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT * FROM user WHERE nickname =?");
                stmt.setString(1, nickname);
                ResultSet res = stmt.executeQuery();
              
                boolean existeUser = res.next();
                BBDDConnexion.conecta().close(); 

                if (existeUser == false) {

                    stmt = BBDDConnexion.conecta().prepareStatement("INSERT INTO user (iduser,nombre, apellidos, edad, mail, contrasena, nickname,skin) VALUES (NULL,?,?,?,?,?,?,?)");
                    stmt.setString(1, nombre);
                    stmt.setString(2, apellidos);
                    stmt.setString(3, edad);
                    stmt.setString(4, correo);
                    stmt.setString(5, contrasena);
                    stmt.setString(6, nickname);
                    stmt.setString(7, "default");
                    stmt.executeUpdate();
                    BBDDConnexion.conecta().close();
                } else {
                    out.println("Error de conexión");
                }

            }

        %>

    </body>
</html>
