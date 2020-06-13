package page;

import blog.Message;
import blog.Tip;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "OpMessage",urlPatterns = "/OpMessage")
public class OpMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag=request.getParameter("flag");
        String key=request.getParameter("mess");
        String par=request.getParameter("par");
        Message m=new Message();
        if(flag.equals("1")){
            if(par==null||par==""){
                try {
                    m.add(key,new Date((new java.util.Date().getTime())));
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            else{
                try {
                    m.add(key,new Date((new java.util.Date().getTime())),par);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else{
            try {
                m.del(key);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("root/MessageManger.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
