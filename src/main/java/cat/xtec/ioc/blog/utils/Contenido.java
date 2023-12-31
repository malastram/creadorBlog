/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.blog.utils;

import cat.xtec.ioc.blog.connexion.BBDDConnexion;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

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

            while (res.next()) {
                resultados.add("<p class='date'>" + res.getString(1) + "</p>");

                resultados.add(res.getString(2));

                resultados.add("<div class='br'></div>");

            }
  BBDDConnexion.conecta().close();//AÑADIDO
        }
        StringBuilder str = new StringBuilder();

        for (String result : resultados) {
            str.append(result);
        }
        BBDDConnexion.conecta().close();
        return str.toString();
    }

    public static ArrayList<String> mostrarUsuarios() throws SQLException {
        ArrayList<String> usuarios = new ArrayList();
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT nickname FROM user");

        ResultSet res = stmt.executeQuery();
          BBDDConnexion.conecta().close();
        while (res.next()) {

            usuarios.add(res.getString(1));

        }

      

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

}
