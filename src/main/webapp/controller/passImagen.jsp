<%-- 
    Document   : passImagen
    Created on : 13-jun-2023, 10:24:36
    Author     : Maik
--%>

<%@page import="org.apache.commons.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="java.nio.file.Paths"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <%

    if (ServletFileUpload.isMultipartContent(request)) {
                    // Crear un objeto FileItemFactory
FileItemFactory factory = new DiskFileItemFactory();

// Crear un objeto ServletFileUpload con el FileItemFactory
ServletFileUpload upload = new ServletFileUpload(factory);

  try {
    // Analizar la solicitud y obtener una lista de elementos de archivo
    List<FileItem> items = upload.parseRequest(request);
    
    // Iterar sobre los elementos de archivo
    for (FileItem item : items) {
      // Verificar si el elemento es un campo de formulario regular o un archivo
      if (!item.isFormField()) {
        // Obtener el nombre del archivo
     //   String fileName = item.getName();
     String fileName = "avatar.jpg";
      //  session.setAttribute("avatar", fileName);
        // Construir la ruta completa del archivo en el directorio local
     //   String directoryPath = "C:/Users/Maik/Documents/NetBeansProjects/m7b2 projects/blog/src/main/webapp/img/"+session.getAttribute("nombre").toString()+"/" ;
        String directoryPath ="/opt/tomcat/webapps/ROOT/img/"+session.getAttribute("nombre").toString()+"/" ;
        // Construir la ruta completa del archivo en el directorio local
        String filePath =directoryPath+ fileName;
        
        
// Crear un objeto File para representar el directorio
File directory = new File(directoryPath);

// Verificar si el directorio no existe
if (!directory.exists()) {
    // Intentar crear el directorio
    boolean created = directory.mkdirs();

    if (created) {
        out.println("Se ha creado el directorio: " + directoryPath);
    } else {
        out.println("No se pudo crear el directorio: " + directoryPath);
    }
}
        
        // Crear un objeto File para representar el archivo en el directorio local
        File uploadedFile = new File(filePath);
        
        // Guardar el archivo en el directorio local
        item.write(uploadedFile);
        
        // Mostrar un mensaje de éxito
        out.println("El archivo se ha cargado correctamente.");
      }
    }
  } catch (Exception e) {
    out.println("Error al cargar el archivo: " + e.getMessage());
  }
} else {
  out.println("No se ha seleccionado ningún archivo.");
}
             
             
        Thread.currentThread().sleep(3000);
                response.sendRedirect("../index.jsp");

        %>
    </body>
</html>
