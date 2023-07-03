<%-- 
    Document   : header
    Created on : 05-jun-2023, 10:34:02
    Author     : Maik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(session.getAttribute("skin")!=null){
    String skin = session.getAttribute("skin").toString();

  %> <body class="<%=skin%>">
   <%
}else{%><body class="default">
<%}%>

<header>
 <div class="headerPrin">

    <%
        if (session.getAttribute("nombre") != null) {
            String imagen = "img/" + session.getAttribute("nombre").toString() + "/avatar.jpg";
    %>
   <div class="divAvatar">
            <img src="<%=imagen%>" alt="foto" class="imAvatar">
        </div>
        <div class="listaSup">
            <ul>
                <li><a href="index.jsp">Bienvenido <%out.print(session.getAttribute("nombre").toString());%></a>
                <li><a href="crearEntrada.jsp">Crea una entrada</a></li>
                  <li><a href="crearEntrada.jsp">Gestionar entradas</a></li>
                <li><a href="controller/cerrarSesion.jsp">Cerrar sesion</a></li>
                <li><a href="gestionUsuario.jsp">Gestionar cuenta</a></li>
                <li><a href="help.jsp">Help</a></li>

                <%   } else {
                %>

 <div class="divAvatar">
        </div>
        <div class="listaSup">

                <li><a href="index.jsp">Home</a></li>
                <li><a href="registro.jsp">Registro</a></li>   
                <li><a href="login.jsp">Login</a></li>
                <li><a href="help.jsp">Help</a></li>
                    <%}%> 
            </ul> 
        </div>
    </div>


</header>