<%-- 
    Document   : passComentario
    Created on : 14-ago-2023, 12:16:10
    Author     : Maik
--%>

<%@page import="cat.xtec.ioc.blog.Modelo.Usuario"%>
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
   //String idArticulo=request.getParameter("idArticulo").toString();
   String idArticulo=request.getParameter("idArticulo");
   String user = session.getAttribute("nombre").toString();
   String idAutor = session.getAttribute("idAutor").toString();
   
   String textoCompleto = "<h2>"+titulo.toString()+"</h2><p>"+comentario.toString()+"</p>";
   
   String resena ="valoración negativa!";
   if(positivo!=null){
       resena = "valoración positiva!";
   }

  Contenido.ingresarComentarios(idArticulo, textoCompleto, resena, user);
    //actualizar contenido          
   ArrayList<Usuario> usuarios = (ArrayList<Usuario>) session.getAttribute("usuarios");
                       //             String ultimoArticulo = null;
                                    Iterator itUser = usuarios.iterator();
                                    while (itUser.hasNext()) {
                                        Usuario usuario = (Usuario) itUser.next();
                                        if (usuario.getIduser() == Integer.parseInt(idAutor)) { //si es el id del usuario autor del artículo
                                            usuario.setArticulosDelUsuario(idAutor);   // Actualizar artículo con el comentario añadido

                                        }
                                    }
                                    session.setAttribute("usuarios", usuarios);
     ArrayList<String> coments = new ArrayList();
                    coments = Contenido.mostrarComentarios(idArticulo);
                    Iterator<String> it = coments.iterator();

                    while (it.hasNext()) {
                       out.print("<div class='comment'>"+it.next()+"</div>");
                      }
        
%>  


