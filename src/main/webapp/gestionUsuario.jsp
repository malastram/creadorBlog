<%-- 
    Document   : gestionUsuario
    Created on : 12-jun-2023, 13:14:28
    Author     : Maik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@ include file="head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <%@ include file="header.jsp" %>

        <h1>Configuración del perfil</h1>
        <div class="formGest">
        <form action="controller/passImagen.jsp"   method="POST" enctype="multipart/form-data">
            <div class="partForm">
          <label>Avatar</label>
            <input type="file" name="avatar" accept="image/png, .jpeg, .jpg, image/gif">
            <input type="submit" value="Enter">
                     
                    </form>
   </div>
                <form action="controller/configPerfil.jsp" method="POST">
                  <div class="partForm">
                      <label>Skin</label>
                      <select name="skin" title="Selecciona una skin" autofocus>
                    <option value="default" >Predet</option>
                                   <option value="dark">Dark</option>
                    <option value="light">Light</option>
                </select>  
                      <input type="submit">

            </div>
                </form>
            </div>
        <script src="js/responsive.js"></script>
    </body>
</html>
