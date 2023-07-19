/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.blog.Modelo;

import cat.xtec.ioc.blog.connexion.BBDDConnexion;
import cat.xtec.ioc.blog.utils.Contenido;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author Maik
 */
public class Usuario {
    private int iduser;
    private String nombre;
    private String apellidos;
    private String edad;
    private String mail;
    private String contrasena;
    private String nickname;
    private String skin;
    private Date fecha;
    private ArrayList <String> articulos;

    public Usuario(int iduser, String nombre, String apellidos, String edad, String mail, String contrasena, String nickname, String skin, Date fecha) {
        this.iduser = iduser;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.mail = mail;
        this.contrasena = contrasena;
        this.nickname = nickname;
        this.skin = skin;
        this.fecha = fecha;
    }

    public int getIduser() {
        return iduser;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getEdad() {
        return edad;
    }

    public String getMail() {
        return mail;
    }

    public String getContrasena() {
        return contrasena;
    }

    public String getNickname() {
        return nickname;
    }

    public String getSkin() {
        return skin;
    }

    public Date getFecha() {
        return fecha;
    }
    
    public ArrayList<String> getArticulos(){
        return articulos;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setSkin(String skin) {
        this.skin = skin;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
    public void setArticulosDelUsuario(String usuario) throws SQLException{
    
   this.articulos= Contenido.mostrarContenido(usuario);
    
    
    
    }
    
    
    
    
}
