/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cat.xtec.ioc.blog.Modelo;

/**
 *
 * @author Maik
 */
public class User_Articulo {
    private int iduser;
    private String idarticulo;

    public User_Articulo(int iduser, String idarticulo) {
        this.iduser = iduser;
        this.idarticulo = idarticulo;
    }

    public int getIduser() {
        return iduser;
    }

    public String getIdarticulo() {
        return idarticulo;
    }
    
    
}
