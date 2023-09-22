<%-- 
    Document   : crearEntrada
    Created on : 08-jun-2023, 10:06:31
    Author     : Maik
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.mysql.cj.util.StringUtils"%>
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

        <title>Gestion entradas</title>

    </head>

    <%@ include file="header.jsp" %>
    <h2>Listado de elementos</h2>
    <%
        if (session.getAttribute("iduser") != null) {
    %>
    
    <%       
        
     // out.print(Contenido.mostrarContenido(session.getAttribute("iduser").toString()));
                
        } else {
            response.sendRedirect("index.jsp");
        }%>
  
    <main>
        <%
            //ESTABLECER DISEÑO SKIN
            if (session.getAttribute("skin") != null) {
                String skin = session.getAttribute("skin").toString();

                if (skin.equals("dark")) {
        %>

        <aside class="asideDark">          
        </aside>

        <div id="principalDark" class="principal">
            <%            } else if (skin.equals("light")) {
            %>
            <aside class="asideLight">

            </aside>
            <div id="principalLight" class="principal">        
                <%                } else {
                %>
                <aside class="asidePrin">

                </aside>
                <div id="principal" class="principal">
                    <%}
                    } else {%>
                    <aside class="asidePrin">

                    </aside>
                    <div id="principal" class="principal">

                        <%}%>                      

                        <%

                            if (session.getAttribute("iduser") != null) {
                                out.print("<h2>Selecciona artículo que deseas eliminar</h2>");
                                ArrayList<Usuario> usuarios = (ArrayList<Usuario>) session.getAttribute("usuarios");
                                Usuario user = null;
                                Iterator<Usuario> it = usuarios.iterator();
                                while (it.hasNext()) {
                                    user = it.next();
                                    if (user.getNickname().equals(session.getAttribute("nombre"))) {
                                        ArrayList<String> articulos = user.getArticulos();
                                        Iterator<String> itArt = articulos.iterator();
                                        while (itArt.hasNext()) {

                                            String data = itArt.next();

                                            out.print("<div>" + data + "</div>");

                                        }

                                    }
                                }

                            } else {
                                out.print("<p>Acceso no autorizado.</p>");

                            }

                        %>
                    </div>
        </main>

    <%@include file="footer.jsp" %>

    <script src="js/gestEntradas.js"></script>
           <script src="js/responsive.js"></script>
    </body>

</html>
