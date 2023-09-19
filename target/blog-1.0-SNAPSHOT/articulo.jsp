<%-- 
    Document   : articulo
    Created on : 14-ago-2023, 9:39:08
    Author     : Maik
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="head.jsp" %>
    </head>
    <body>
        <%@ include file="header.jsp" %>
    <main>
        <div class="divArticulo">
            <%
             
                String articulo = request.getParameter("articulo");

                PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT fecha, articulo, titulo FROM articulo WHERE idarticulo=?");
                stmt.setString(1, articulo);
                ResultSet res = stmt.executeQuery();
                while (res.next()) {
                    out.print("<h3>Fecha de creación: " + res.getString(1) + "</h3><h3 class='categ'>Categoria: " + res.getString(3) + "</h3>" + res.getString(2));
                }
                BBDDConnexion.conecta().close();


            %> 
            <div id="outputComentarios">
                <%    ArrayList<String> coments = new ArrayList();
                    coments = Contenido.mostrarComentarios(articulo);
                    Iterator<String> it = coments.iterator();

                    while (it.hasNext()) {
                       out.print("<div class='comment'>"+it.next()+"</div>");

                    }
//out.print(coments);


                %>

            </div>
            <h2>Introduce el comentario / reseña</h2>
            <form name="comForm" method="POST"  action="controller/passComentario.jsp" id="formul">
                <label>Título</label>
                <input  name="idArticulo" type="hidden" id="idArticulo" value=<%=articulo%> />
                <input type="text" name="tituloComentario" id="tituloComentario">

                <label>Comentario</label>
                <textarea name="textComentario" placeholder="Introduce tu comentario" id="textComentario"></textarea>
                <label>Es positivo:</label> <input type="checkbox" value="Positivo" name="resena" id="resenaOk">
                <input type="submit"  value="enviar">

            </form>

        </div>
    </main>
        <%@ include file="footer.jsp" %>

        <script src="js/jquery-3.7.0.min.js"></script> 
        <script src="js/articulo.js"></script>
               <script src="js/responsive.js"></script>
    </body>
</html>
