<%@page import="org.json.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>

<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>

<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@page import="cat.xtec.ioc.blog.connexion.BBDDConnexion"%>


<%

    String uploadDir = "C:/Users/Maik/Documents/NetBeansProjects/m7b2 projects/blog/src/main/webapp/img/" + session.getAttribute("nombre").toString() + "/";
    //uploadDir, HAY QUE PROBAR DE CAMBIAR LA RUTA, C://.... POR LOCALHOST.....
// Verificar si la solicitud contiene archivos
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    if (isMultipart) {
        // Crear una fábrica de elementos de archivo
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configurar el directorio temporal para almacenar los archivos subidos
        File tempDir = (File) application.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(tempDir);

        // Crear el analizador de solicitud
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {

            // Parsear los elementos de archivo de la solicitud
            List<FileItem> items = upload.parseRequest(request);

            // Variables para almacenar las imágenes y el string
            List<File> imagenes = new ArrayList<>();
            String miString = null;
            String categoria = null;

            // Recorrer los elementos de archivo
            for (FileItem item : items) {
                if (item.isFormField()) {
                    // Es un campo de formulario
                    if ("categoria".equals(item.getFieldName())) {
                        BufferedReader reader = new BufferedReader(new InputStreamReader(item.getInputStream(), "UTF-8"));
                        categoria = reader.readLine();
                        reader.close(); //cerramos el objeto BufferedReader
                    }
                    if ("elementos".equals(item.getFieldName())) {
                        // Obtener el valor del campo de formulario
                        BufferedReader reader = new BufferedReader(new InputStreamReader(item.getInputStream(), "UTF-8"));
                        miString = reader.lines().collect(Collectors.joining());
                        reader.close(); //cerramos el objeto BufferedReader

                        if (BBDDConnexion.conecta() != null) {
                            PreparedStatement stmt = BBDDConnexion.conecta().prepareStatement("INSERT INTO articulo (titulo,articulo) VALUES (?,?)");
                            stmt.setString(1, categoria);
                            stmt.setString(2, miString);
                            stmt.executeUpdate();

                            //BUSCAR ID DEL ARTICULO
                            stmt = BBDDConnexion.conecta().prepareStatement("SELECT MAX(idarticulo) FROM articulo"); //ultimo idarticulo insertado.Siempre será el máximo valor
                            ResultSet res = stmt.executeQuery();

                            String idArticulo = "";
                            while (res.next()) {
                                idArticulo = res.getString(1);
                            }
                            // insercion a tabla user_articulo donde se relaciona el id  del usuario con el id del articulo

                            stmt = BBDDConnexion.conecta().prepareStatement("INSERT INTO user_articulo (iduser,idarticulo) VALUES (?,?)");
                            stmt.setString(1, session.getAttribute("iduser").toString());
                            stmt.setString(2, idArticulo);
                            stmt.executeUpdate();
                            BBDDConnexion.conecta().close();
                        } else {
                            out.println("Error de conexión");
                        }

                    }
                } else {
                    // Es un archivo (imagen)
                    String fileName = item.getName();
                    String filePath = uploadDir + File.separator + fileName;  //ruta+nombre de archivo
                    File file = new File(filePath);
                    item.write(file);
                    // Agregar el archivo a la lista de imágenes
                    imagenes.add(file);
                }
            }

            // Enviar una respuesta al cliente
            response.getWriter().write("Imágenes y string recibidos correctamente");

        } catch (Exception e) {
            e.printStackTrace();
            // Manejar cualquier excepción que ocurra durante el procesamiento de los archivos
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar los archivos");
        }
    } else {
        // La solicitud no contiene archivos
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "La solicitud no contiene archivos");
    }


%>







