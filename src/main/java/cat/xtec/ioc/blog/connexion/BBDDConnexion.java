/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.blog.connexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Maik
 */
public class BBDDConnexion {

    public static Connection conecta() {
        Connection conecta = null;

        try {
            System.out.println("Estableciendo conexion");

            Class.forName("org.mariadb.jdbc.Driver");

            String servidor = "jdbc:mariadb://node151552-env-0213938.jelastic.saveincloud.net:3306/portfolio";
            String usuario = "root";
            String contrasenia = "Jddzo7hIQ9";

            conecta = (Connection) DriverManager.getConnection(servidor, usuario, contrasenia);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            return conecta;
        }
    }
}
