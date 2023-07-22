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
import java.util.Arrays;
import javax.servlet.http.HttpSession;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

/**
 *
 * @author Maik
 */
public class Contenido {

    public static ArrayList<String> mostrarContenido(String usuario) throws SQLException {
        ArrayList<String> resultados = new ArrayList();//array a devolver

        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT idarticulo FROM user_articulo WHERE iduser=? ORDER BY idarticulo DESC");
        stmt.setString(1, usuario);
        ResultSet res = stmt.executeQuery();
        ArrayList<String> arrayidArticulo = new ArrayList();

        while (res.next()) {
            arrayidArticulo.add(res.getString(1));
        }

        for (int i = 0; i < arrayidArticulo.size(); i++) {

            stmt = BBDDConnexion.conecta().prepareStatement("SELECT fecha, articulo, titulo FROM articulo WHERE idarticulo=?");
            stmt.setString(1, arrayidArticulo.get(i)); //todos los id del articulo que pertenecen al usuario-Se repite la consulta por cada entrada 
            res = stmt.executeQuery();

            while (res.next()) {
                resultados.add("<p>" + res.getString(1) + "</p><p hidden class='art'>"+arrayidArticulo.get(i)+"</p><p class='categ'>"+res.getString(3)+"</p>"+res.getString(2)+
                        "<div class='br'></div>");

            }
        }

        BBDDConnexion.conecta().close();
        return resultados;
    }

    public static ArrayList<String> mostrarUsuarios() throws SQLException {
        ArrayList<String> usuarios = new ArrayList();
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("SELECT nickname FROM user");

        ResultSet res = stmt.executeQuery();
        while (res.next()) {

            usuarios.add(res.getString(1));

        }

        BBDDConnexion.conecta().close();

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

    
     public static void eliminarArticulos(String[] ids) throws SQLException {
        String placeholders = String.join(",",ids);
        
        PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("DELETE FROM articulo WHERE idarticulo IN (" + placeholders + ")");
          

           stmt.executeUpdate();
          
        BBDDConnexion.conecta().close();
       
    }
    public static String prueba() {
        return "prueba";

    }

}
