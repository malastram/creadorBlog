<%-- 
    Document   : aside
    Created on : 05-jul-2023, 9:57:16
    Author     : Maik
--%>

<%@page import="java.util.Iterator"%>
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    if (session.getAttribute("iduser") != null) {
        out.print("<h2>Usuarios</h2>");
        out.print("<br>");
        out.print("<h3 id='all'>Todos</h3>");
        ArrayList<String> usuarios = new ArrayList();
        usuarios = Contenido.mostrarUsuarios(); //array con los nombres de usuario

        ArrayList<String> idusuarios = new ArrayList();
        idusuarios = Contenido.mostrarIdUsuarios(); //array con los id de usuario           
        Iterator itId = idusuarios.iterator();
        Iterator it = usuarios.iterator();
        while (it.hasNext()) {
            while (itId.hasNext()) {
                out.print("<h3 id =" + itId.next() + "-link>" + it.next() + "</h3>"); //id h3 = id del usuario; contenido h3 = nombre de usuario
            }
        }

    } else {
%>

<%}
   
%>