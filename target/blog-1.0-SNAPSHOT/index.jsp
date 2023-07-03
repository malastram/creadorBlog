<%-- 
    Document   : index
    Created on : 05-jun-2023, 9:47:27
    Author     : Maik
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Home</title>
    </head>
    <%@ include file="header.jsp" %>
    <%
        //ESTABLECER DISEÑO SKIN
        if (session.getAttribute("skin") != null) {
            String skin = session.getAttribute("skin").toString();

            if (skin.equals("dark")) {
    %>
    %>

    <div id="principalDark">
        <%
        } else if (skin.equals("light")) {
        %>
        <div id="principalLight">        
            <%
            } else {
            %>
            <div id="principal">
                <%}
                } else {%>
                <div id="principal">

                    <%}%>
                    <h1>Creador de blogs</h1>
                    <img src="img/javaProgramming.webp" alt="noImage" class="imCabezera">

                    <%

                        //GENERAR CONTENIDO
                        if (session.getAttribute("iduser") != null) {

                            PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT idarticulo FROM user_articulo WHERE iduser=? ORDER BY idarticulo DESC");
                            stmt.setString(1, session.getAttribute("iduser").toString());
                            ResultSet res = stmt.executeQuery();
                            ArrayList<String> arrayidArticulo = new ArrayList();

                            while (res.next()) {
                                arrayidArticulo.add(res.getString(1));
                            }

                            // ArrayList<String> arrayContent = new ArrayList(); //guardaremos el articulo entero
                            for (int i = 0; i < arrayidArticulo.size(); i++) {

                                stmt = BBDDConnexion.conecta().prepareStatement("SELECT fecha, articulo FROM articulo WHERE idarticulo=?");
                                stmt.setString(1, arrayidArticulo.get(i)); //todos los id del articulo que pertenecen al usuario-Se repite la consulta por cada entrada 
                                res = stmt.executeQuery();
                                // arrayContent.add(res.getString(1));

                                while (res.next()) {
                                    out.print("<p>"+res.getString(1).toString()+"</p>");
                                                                        out.print(res.getString(2).toString());

                                    out.print("<div class='br'></div>");
                                }
                            }
                        }
                    %>
                </div>

                </body>
                </html>
