<%-- 
    Document   : passLogin
    Created on : 12-jun-2023, 10:32:43
    Author     : Maik
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>
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
            if (BBDDConnexion.conecta() != null) {
        %>
        <p>Conexión satisfactoria!</p>

        <%
            String nombre = request.getParameter("nombre");
            String contrasena = request.getParameter("contrasena");
            out.println(nombre);
            PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT * FROM user WHERE nickname =? AND contrasena=?");
            stmt.setString(1, nombre);
            stmt.setString(2, contrasena);
            ResultSet res = stmt.executeQuery();
            boolean existeUser = res.next();
            BBDDConnexion.conecta().close();//AÑADIDO, NECESARIO O NO?
            //si no es correcto el login
            if (existeUser == false) {
                out.println("Login no correcto");
                response.sendRedirect("../index.jsp");
//si es correcto el login 
            } else {
                session.setMaxInactiveInterval(-1);

                session.setAttribute("iduser", res.getString(1));
<<<<<<< Updated upstream
                out.println("Bienvenido " + nombre);

                session.setAttribute("nombre", nombre); //session nickname
                stmt = BBDDConnexion.conecta().prepareStatement("SELECT skin FROM user WHERE nickname = ?");
                stmt.setString(1, nombre);
                res = stmt.executeQuery();

                String skin = "";
                while (res.next()) {
                    skin = res.getString(1);
                }
                System.out.println(skin);
=======
                  session.setAttribute("skin", res.getString(8));
                out.println("Bienvenido " + nickname);

                String skin = "";
                int iduser = 0;
                String nombre = "";
                String apellidos = "";
                String edad = "";
                String mail = "";
                Date fecha = null;

                session.setAttribute("nombre", nickname); //session nickname
                /*     stmt = BBDDConnexion.conecta().prepareStatement("SELECT * FROM user WHERE nickname = ?");
                stmt.setString(1, nickname);
                res = stmt.executeQuery();

                BBDDConnexion.conecta().close();*/

                ArrayList<Usuario> usuarios = new ArrayList();

                ArrayList<String> listaNicknames = Contenido.mostrarUsuarios();

                Iterator it = listaNicknames.iterator();
                while (it.hasNext()) {
                    String nickUsuario = it.next().toString();
                    stmt = BBDDConnexion.conecta().prepareStatement("SELECT * FROM user WHERE nickname = ?");
                    stmt.setString(1, nickUsuario);
                    res = stmt.executeQuery();
                    while (res.next()) {
                        iduser = res.getInt(1);
                        nombre = res.getString(2);
                        apellidos = res.getString(3);
                        edad = res.getString(4);
                        mail = res.getString(5);
                        contrasena = res.getString(6);
                        nickname = res.getString(7);
                        skin = res.getString(8);
                        fecha = res.getDate(9);
                        // out.println(iduser + " " + nombre + " " + apellidos + " " + edad + " " + mail + " " + contrasena + " " + nickname + " " + skin + " " + fecha);
                    }

                    Usuario user = new Usuario(iduser, nombre, apellidos, edad, mail, contrasena, nickname, skin, fecha);
                    user.setArticulosDelUsuario(String.valueOf(iduser));
                    usuarios.add(user);
                }
                session.setAttribute("usuarios", usuarios);
              
>>>>>>> Stashed changes

                response.sendRedirect("../index.jsp");
            }
<<<<<<< Updated upstream

            BBDDConnexion.conecta().close();
        } else {%>
        <p>Error de conexión</p>
        <%}%>
        <%
            out.print(BBDDConnexion.conecta());
        %>
=======
BBDDConnexion.conecta().close();
            response.sendRedirect("../index.jsp");
        } else {%>
        <p>Error de conexión</p>
        <%}%>
>>>>>>> Stashed changes

    </body>
</html>
