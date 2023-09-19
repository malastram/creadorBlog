<%-- 
    Document   : eliminarArticulos
    Created on : 22-jul-2023, 10:36:52
    Author     : Maik
--%>

<%@page import="java.util.Iterator"%>
<%@page import="cat.xtec.ioc.blog.Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>
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
            String[] filas = request.getParameterValues("filas");

            for (int i = 0; i < filas.length; i++) {

                out.print(filas[i] + ",");
            }

            Contenido.eliminarArticulos(filas);

            String usuario = session.getAttribute("iduser").toString();

            ArrayList<Usuario> usuarios = (ArrayList<Usuario>) session.getAttribute("usuarios");
            Usuario user = null;
            Iterator<Usuario> it = usuarios.iterator();
            while (it.hasNext()) {
                user = it.next();
                if (user.getNickname().equals(session.getAttribute("nombre"))) {
                    user.setArticulosDelUsuario(usuario);
                } else {
                    out.print("Not found");

                }

            }
            response.sendRedirect("../index.jsp");


        %>
    </body>
</html>
