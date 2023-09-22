<%-- 
    Document   : index
    Created on : 05-jun-2023, 9:47:27
    Author     : Maik
--%>

<%@page import="cat.xtec.ioc.blog.Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Creador de posts</title>
    </head>
    <%@ include file="header.jsp" %>
  <h1 class="title">Creador de posts</h1>
                          <img src="img/javaProgramming.webp" alt="noImage" class="imCabezera">

    <main>
        <%
          
            //ESTABLECER DISEÑO SKIN
            if (session.getAttribute("skin") != null) {
                String skin = session.getAttribute("skin").toString();

                if (skin.equals("dark")) {
        %>

        <aside class="asideDark">


            <%@include file="aside.jsp" %>
        </aside>

        <div id="principalDark" class="principal">
            <%            } else if (skin.equals("light")) {
            %>
            <aside class="asideLight">
                <%@include file="aside.jsp" %>
            </aside>
            <div id="principalLight" class="principal">        
                <%                } else if(skin.equals("default")){
                %>
                <aside class="asidePrin">
                    <%@include file="aside.jsp" %>
                </aside>
                <div id="principal" class="principal">
                    <%}
                    } else {%>
                    
                    
                    <div id="principal" class="principal">

                        <%}%>
                      

                        <%

                            if (session.getAttribute("iduser") != null) {
                                String usuario = session.getAttribute("iduser").toString();

                                ArrayList<Usuario> usuarios = (ArrayList<Usuario>) session.getAttribute("usuarios");
                                Usuario user = null;
                                Iterator<Usuario> it = usuarios.iterator();
                                while (it.hasNext()) {
                                    user = it.next();
                                    if (user.getNickname().equals(session.getAttribute("nombre"))) {
                                        out.print("<div  id=" + user.getIduser() + ">" + String.join(" ", user.getArticulos()) + "</div>");
                                      
                                    } else {
                                        out.print("<div hidden id=" + user.getIduser() + ">" + String.join(" ", user.getArticulos()) + "</div>");

                                    }

                                }

                            } else {
                                out.print("<p>Bienvenido a este espacio. Regístrate y empieza a crear posts personalizados, indicando la categoria "
                                        + "adecuada. Revisa los posts de los demás usuarios y déjales tus comentarios.</p>");

                            }

                        %>
                    </div>
                    </main>

                    <%@include file="footer.jsp" %>

                    <script src="js/index.js" defer></script>
                           <script src="js/responsive.js"></script>
                    </body>
                    </html>