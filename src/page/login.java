package page;

import blog.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name=request.getParameter("name");
        String pwd=request.getParameter("pwd");
        User user=new User();
        String url="";
        if(name.equals("root")){
            try {
                if(user.checkpwd(pwd)){
                    url="root/rootindex.jsp";
                }
                else{
                    url="root/rootlogin.jsp";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect(url);
        }
        else{
            response.sendRedirect("root/rootlogin.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
