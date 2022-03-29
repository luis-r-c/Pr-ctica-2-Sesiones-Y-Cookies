package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis
 */
@WebServlet(name = "VisitaServlet", urlPatterns = {"/VisitaServlet"})
public class VisitaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int contador = 0;
        Cookie[] cukis = request.getCookies();
        if (cukis!=null){
            for (Cookie c : cukis){
                if(c.getName().equals("visitas")){
                    contador = Integer.parseInt(c.getValue());
                }
            }
        }
        contador++;
        Cookie c = new Cookie ("visitas",Integer.toString(contador));
        c.setMaxAge(3600);
        response.addCookie(c);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if(contador <=1){
            out.print("Bienvenido a nuestro sitio Web");
        }else{
            out.print("Gracias por visitarnos nuevamente");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
