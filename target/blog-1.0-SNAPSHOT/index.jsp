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
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="head.jsp" %>
        <title>Home</title>
    </head>
    <%@ include file="header.jsp" %>

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
        
        <div id="principalDark">
            <%            } else if (skin.equals("light")) {
            %>
            <aside class="asideLight">
                <%@include file="aside.jsp" %>
            </aside>
            <div id="principalLight">        
                <%                } else {
                %>
                <aside class="asidePrin">
                    <%@include file="aside.jsp" %>
                </aside>
                <div id="principal">
                    <%}
                    } else {%>
                    <aside class="asidePrin">
                        <%@include file="aside.jsp" %>
                    </aside>
                    <div id="principal">

                        <%}%>
                        <h1>Creador de posts personal</h1>
                        <img src="img/javaProgramming.webp" alt="noImage" class="imCabezera">

                        <%

                            if (session.getAttribute("iduser") != null) {
                                String usuario = session.getAttribute("iduser").toString();
                                ArrayList<String> usuarios = new ArrayList();
                                usuarios = (ArrayList) Contenido.mostrarIdUsuarios().clone(); //Almacenamos lista de idusuarios
                                Iterator<String> it = usuarios.iterator();  //para iterar la arraylist de usuarios

                                while (it.hasNext()) {
                                    String iduseriterator = it.next().toString();

                                    if (iduseriterator.equals(usuario)) {   // si es el usuario logueado, no se oculta
                                        out.print("<div  id=" + iduseriterator + ">");
                                        out.print(Contenido.mostrarContenido(iduseriterator));
                                        out.print("</div>");
                                    } else {
                                        out.print("<div hidden id=" + iduseriterator + ">");
                                        out.print(Contenido.mostrarContenido(iduseriterator));
                                        out.print("</div>");

                                    }
                                }
                            }else{
                            out.print("<p>Bienvenido a este espacio. Regístrate y empieza a crear posts personalizados, indicando la categoria "
                                    + "adecuada. Revisa los posts de los demás usuarios y (próximamente) déjales tus comentarios.</p>");
                            
                            
                            }

                        %>
                    </div>
                    </main>
                     <%@include file="footer.jsp" %>
                    <script src="js/index.js"></script>
                    </body>
                    </html>
