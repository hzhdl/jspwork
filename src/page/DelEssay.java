package page;

import blog.Blog;
import blog.Essay;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DelEssay",urlPatterns = "/DelEssay")
public class DelEssay extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num=request.getParameter("num");
        Essay ess=new Essay();

        File file = null;
        try {
            file = new File(ess.Findpath(num));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        assert file != null;
        if (file.exists()) {
            file.delete();
        }
        try {
            Essay b=new Essay();
            b.del(num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("root/EssayManger.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
