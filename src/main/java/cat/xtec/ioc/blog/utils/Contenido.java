/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.blog.utils;

import cat.xtec.ioc.blog.connexion.BBDDConnexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
<<<<<<< Updated upstream
import javax.servlet.http.HttpSession;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
=======
>>>>>>> Stashed changes

/**
 *
 * @author Maik
 */
public class Contenido {

    public static String mostrarContenido(String usuario) throws SQLException {
        ArrayList<String> resultados = new ArrayList();//array a devolver

        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT idarticulo FROM user_articulo WHERE iduser=? ORDER BY idarticulo DESC");
        stmt.setString(1, usuario);
        ResultSet res = stmt.executeQuery();
        ArrayList<String> arrayidArticulo = new ArrayList();
 BBDDConnexion.conecta().close();//AÑADIDO
        while (res.next()) {
            arrayidArticulo.add(res.getString(1));
        }

        for (int i = 0; i < arrayidArticulo.size(); i++) {

            stmt = BBDDConnexion.conecta().prepareStatement("SELECT fecha, articulo FROM articulo WHERE idarticulo=?");
            stmt.setString(1, arrayidArticulo.get(i)); //todos los id del articulo que pertenecen al usuario-Se repite la consulta por cada entrada 
            res = stmt.executeQuery();
  BBDDConnexion.conecta().close();
            while (res.next()) {
<<<<<<< Updated upstream
                resultados.add("<p class='date'>" + res.getString(1) + "</p>");

                resultados.add(res.getString(2));

                resultados.add("<div class='br'></div>");

=======
                resultados.add("<div class='articuloIndividual'><p hidden class='art'>" + arrayidArticulo.get(i) + "</p><h3>Fecha de creación: " + res.getString(1) + "</h3><h3 class='categ'>Categoria: " + res.getString(3) + "</h3><div>" + res.getString(2)
                        + "</div></div><div class='elemExtras'><div><p>Comentarios:" + Contenido.contarComentarios(arrayidArticulo.get(i)) + "</p></div><a class='vmas' href='articulo.jsp?articulo=" + arrayidArticulo.get(i) + "'>ver más</a><div class='br'></div></div>");
//<input type='button' value='ver más' onclick='articulo.jsp?nombre="+res.getString(2)+"'>
>>>>>>> Stashed changes
            }
  BBDDConnexion.conecta().close();//AÑADIDO
        }
        StringBuilder str = new StringBuilder();

<<<<<<< Updated upstream
        for (String result : resultados) {
            str.append(result);
        }
        BBDDConnexion.conecta().close();
        return str.toString();
=======
      
        return resultados;
>>>>>>> Stashed changes
    }

    public static ArrayList<String> mostrarUsuarios() throws SQLException {
        ArrayList<String> usuarios = new ArrayList();
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT nickname FROM user");

        ResultSet res = stmt.executeQuery();
<<<<<<< Updated upstream
          BBDDConnexion.conecta().close();
=======
                BBDDConnexion.conecta().close();

>>>>>>> Stashed changes
        while (res.next()) {

            usuarios.add(res.getString(1));

        }

<<<<<<< Updated upstream
      
=======
>>>>>>> Stashed changes

        return usuarios;
    }

    public static ArrayList<String> mostrarIdUsuarios() throws SQLException {
        ArrayList<String> usuarios = new ArrayList();
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT iduser FROM user");

        ResultSet res = stmt.executeQuery();
        while (res.next()) {

            usuarios.add(res.getString(1));

        }

        BBDDConnexion.conecta().close();
        return usuarios;
    }

<<<<<<< Updated upstream
=======
    public static void eliminarArticulos(String[] ids) throws SQLException {
        String placeholders = String.join(",", ids);
//eliminar filas tabla articulo
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("DELETE FROM articulo WHERE idarticulo IN (" + placeholders + ")");

        stmt.executeUpdate();

        BBDDConnexion.conecta().close();

        //eliminar filas tabla usuario_articulo
        stmt = BBDDConnexion.conecta().prepareStatement("DELETE  FROM user_articulo WHERE idarticulo IN (" + placeholders + ")");
        stmt.executeUpdate();
        BBDDConnexion.conecta().close();
    }

    public static void ingresarComentarios(String idArt, String coment, String resena, String user) throws SQLException {
        //revisar, se tiene que coger el último id creado del comentario

        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("INSERT INTO comentario (comentario, resena, user) VALUES (?,?,?)");
        stmt.setString(1, coment);
        stmt.setString(2, resena);
        stmt.setString(3, user);
        stmt.executeUpdate();
        BBDDConnexion.conecta().close();

        //conseguir el último id de comentario
        stmt = BBDDConnexion.conecta().prepareStatement("SELECT MAX(idcomentario) FROM comentario");
        ResultSet res = stmt.executeQuery();
        res.next();
        String idCom = res.getString(1);
        BBDDConnexion.conecta().close();
        stmt = BBDDConnexion.conecta().prepareStatement("INSERT INTO comentario_articulo (idarticulo, idcomentario) VALUES (?,?)");
        stmt.setString(1, idArt);
        stmt.setString(2, idCom);
        stmt.executeUpdate();
        BBDDConnexion.conecta().close();

    }

    public static ArrayList<String> mostrarComentarios(String idArticulo) throws SQLException {
        //COMPLETAR, 
        ArrayList<String> comentarios = new ArrayList();// arraylist con el contenido a devolver
        ArrayList<String> idComs = new ArrayList(); // ids de los comentarios
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT idcomentario FROM comentario_articulo WHERE idarticulo = ?");
        stmt.setString(1, idArticulo);
        ResultSet res = stmt.executeQuery();
        BBDDConnexion.conecta().close();
        String placeholders;
        if (res.next()) {
            while (res.next()) {
                idComs.add(res.getString(1));
            }

            if (idComs.size() > 1) {
                placeholders = String.join(",", idComs);
            } else if (idComs.size() == 1) {
                placeholders = idComs.get(0);
            } else {
                placeholders = "0";
            }
            stmt = BBDDConnexion.conecta().prepareStatement("SELECT comentario, resena, user FROM comentario WHERE idComentario IN (" + placeholders + ")");
            res = stmt.executeQuery();
            BBDDConnexion.conecta().close();
            while (res.next()) {
                comentarios.add("<div class='cabezeraComentario'><img src='img/" + res.getString(3) + "/avatar.jpg' alt='foto' class='imAvatar'><h3>Comentario de " + res.getString(3) + "</h3></div>" + res.getString(1) + "<p>" + res.getString(2) + "</p>");
            }
        } else {
            comentarios.add("<p>No hay comentarios</p>");
        }
        return comentarios;

    }

    public static String contarComentarios(String idComentario) throws SQLException {
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT count(*) FROM comentario_articulo where idarticulo =?");
        stmt.setString(1, idComentario);
        ResultSet res = stmt.executeQuery();
        if (res.next()) {
            BBDDConnexion.conecta().close();
            return res.getString(1);

        }

        return "0";

    }

>>>>>>> Stashed changes
}
