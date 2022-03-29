<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Tareas"%>
<%
    if (session.getAttribute("lista") == null){
        ArrayList<Tareas> lisaux = new ArrayList<Tareas>();
        session.setAttribute("lista", lisaux);
    }
    
    ArrayList<Tareas> lista = (ArrayList<Tareas>)session.getAttribute("lista");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ejercicio 2 - Tareas Pendientes</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="text" name="id" value="0" size="2"></td>
                </tr>
                <tr>
                    <td>Tarea</td>
                    <td><input type="text" name="tarea" value="" ></td>
                </tr>
                <tr>
                    <td>Completado</td>
                    <td><input type="checkbox" name="completado" value="SI" ></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Procesar"></td>
                </tr>
            </table>
        </form>
        
        <a href="MainServlet?op=vaciar">Nueva lista</a>
        
        <h2>Contenido de tareas</h2>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th></th>
            </tr>
            <%
                if (lista != null){
                    for (Tareas p : lista){
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getTarea() %></td>
                <td><%= p.getCompletado()  %> </td>
                <td><a href="MainServlet?op=eliminar&id=<%= p.getId() %>">Eliminar</a></td>
            </tr>
            <%
                    }
                }  
            %>
        </table>
    </body>
</html>
