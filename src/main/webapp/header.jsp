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

<<<<<<< Updated upstream
    <%
        if (session.getAttribute("nombre") != null) {
            String imagen = "img/" + session.getAttribute("nombre").toString() + "/avatar.jpg";
    %>
   <div class="divAvatar">
            <img src="<%=imagen%>" alt="foto" class="imAvatar">
=======
%> <body class="<%=skin%>">
<%
    } else {%><body class="default">
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
                    <li><i class="fa-solid fa-house"></i><a href="index.jsp">Bienvenido <%out.print(session.getAttribute("nombre").toString());%></a>
                    <li><i class="fa-sharp fa-solid fa-file-pen"></i><a href="crearEntrada.jsp">Crea una entrada</a></li>
                    <li><i class="fa-solid fa-gear"></i><a href="gestionEntradas.jsp">Gestionar entradas</a></li>
                    <li><i class="fa-solid fa-right-from-bracket"></i><a href="controller/cerrarSesion.jsp">Cerrar sesion</a></li>
                    <li><i class="fa-solid fa-user-pen"></i><a href="gestionUsuario.jsp">Gestionar cuenta</a></li>
                    <li><i class="fa-solid fa-question"></i><a href="help.jsp">Help</a></li>
                </ul>
            </div>
            <div class="menuSupMobile">
                <p>Bienvenido <%out.print(session.getAttribute("nombre").toString());%> </p>
                <ul><li><i class="fa-solid fa-bars"></i></li></ul>

            </div>

        </div>
        <div class="listaLogSupMobile" >

            <a href="index.jsp">Home <%out.print(session.getAttribute("nombre").toString());%></a>
            <a href="crearEntrada.jsp">Crea una entrada</a>
            <a href="gestionEntradas.jsp">Gestionar entradas</a>
            <a href="controller/cerrarSesion.jsp">Cerrar sesion</a>
            <a href="gestionUsuario.jsp">Gestionar cuenta</a><
            <a href="help.jsp">Help</a><

>>>>>>> Stashed changes
        </div>
        <div class="listaSup">
            <ul>
                <li><i class="fa-solid fa-house"></i><a href="index.jsp">Bienvenido <%out.print(session.getAttribute("nombre").toString());%></a>
                <li><i class="fa-sharp fa-solid fa-file-pen"></i><a href="crearEntrada.jsp">Crea una entrada</a></li>
                  <li><i class="fa-solid fa-book-sparkles"></i><a href="gestionEntradas.jsp">Gestionar entradas</a></li>
                <li><i class="fa-solid fa-right-from-bracket"></i><a href="controller/cerrarSesion.jsp">Cerrar sesion</a></li>
                <li><i class="fa-solid fa-user-pen"></i><a href="gestionUsuario.jsp">Gestionar cuenta</a></li>
                <li><i class="fa-solid fa-question"></i><a href="help.jsp">Help</a></li>

                <%   } else {
                %>

 <div class="divAvatar">
        </div>
        <div class="listaSup">

                <li><i class="fa-solid fa-house"></i><a href="index.jsp">Home</a></li>
                <li><i class="fa-solid fa-user-plus"></i><a href="registro.jsp">Registro</a></li>   
                <li><i class="fa-solid fa-user"></i><a href="login.jsp">Login</a></li>
                <li><i class="fa-solid fa-question"></i><a href="help.jsp">Help</a></li>
                    <%}%> 
            </ul> 
        </div>
    </div>

        <%   } else {
        %>

<<<<<<< Updated upstream
=======
        <div class="divAvatar">
        </div>
        <div class="listaSup">
            <ul>

                <li><i class="fa-solid fa-house"></i><a href="index.jsp">Home</a></li>
                <li><i class="fa-solid fa-user-plus"></i><a href="registro.jsp">Registro</a></li>   
                <li><i class="fa-solid fa-user"></i><a href="login.jsp">Login</a></li>
                <li><i class="fa-solid fa-question"></i><a href="help.jsp">Help</a></li>
            </ul>
        </div>
        <div class="listaSupMobile">
            <ul>

                <li><a href="index.jsp"><i class="fa-solid fa-house"></i></a></li>
                <li><a href="registro.jsp"><i class="fa-solid fa-user-plus"></i></a></li>   
                <li><a href="login.jsp"> <i class="fa-solid fa-user"></i></a></li>
                <li><a href="help.jsp"><i class="fa-solid fa-question"></i></a></li>
            </ul>
        </div>              <%}%> 

    </div>


>>>>>>> Stashed changes
</header>