package Net;

import java.io.*; 
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckUser extends Dispatcher {
    public String getServletInfo(){
        return "Registration servlet";
    }
   
    public void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String user = request.getParameter("user");
        String pass = request.getParameter("password");
        if (user == null){
            this.forward("/login.html", request, response);
         } else {
            if(pass == null){
                this.forward("/login.html", request, response);
                } else {
                 this.forward("/welcomeJSF.jsp", request, response);
                }
         }
    }
}
