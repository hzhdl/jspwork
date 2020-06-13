package page;

import blog.Tip;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "OpTips",urlPatterns = "/OpTips")
public class OpTips extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag=request.getParameter("flag");
        String key=request.getParameter("tip");
        Tip t=new Tip();
        if(flag.equals("1")){
            try {
                t.addTip(key);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else{
            try {
                t.del(key);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("root/optips.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
