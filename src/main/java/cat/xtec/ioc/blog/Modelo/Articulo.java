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
public class Articulo {
    private int idarticulo;
    private String titulo;
    private String articulo;
    private String fecha;

    public Articulo(int idarticulo, String titulo, String articulo, String fecha) {
        this.idarticulo = idarticulo;
        this.titulo = titulo;
        this.articulo = articulo;
        this.fecha = fecha;
    }

    public int getIdarticulo() {
        return idarticulo;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getArticulo() {
        return articulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setIdarticulo(int idarticulo) {
        this.idarticulo = idarticulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setArticulo(String articulo) {
        this.articulo = articulo;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    
    
}
