<%-- 
    Document   : passComentario
    Created on : 14-ago-2023, 12:16:10
    Author     : Maik
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cat.xtec.ioc.blog.utils.Contenido"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

   String titulo = request.getParameter("tituloComentario");
   String comentario = request.getParameter("textComentario");
   String positivo = request.getParameter("resena");
   String idArticulo=request.getParameter("idArticulo").toString();
   
   String user = session.getAttribute("nombre").toString();
   
   String textoCompleto = "<h2>"+titulo.toString()+"</h2><p>"+comentario.toString()+"</p>";
   
 
   
   String resena ="valoración negativa!";
   if(positivo!=null){
       resena = "valoración positiva!";
   }
    
        
   // out.print("<h2>"+titulo+"</h2><p> "+comentario+"</p><p> "+resena+"</p><p> Artículo nº: "+idArticulo+"</p>");
     

  Contenido.ingresarComentarios(idArticulo, textoCompleto, resena, user);
     ArrayList<String> coments = new ArrayList();
                    coments = Contenido.mostrarComentarios(idArticulo);
                    Iterator<String> it = coments.iterator();

                    while (it.hasNext()) {
                       out.print("<div class='comment'>"+it.next()+"</div>");
  
                    }
  //out.print(Contenido.mostrarComentarios(idArticulo));
%>  


