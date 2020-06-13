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

@WebServlet(name = "DelBlog",urlPatterns = "/DelBlog")
public class DelBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num=request.getParameter("num");
        Blog ee= null;
        try {
            ee = new Blog();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        File file = null;
        try {
            assert ee != null;
            file = new File(ee.Findpath(num));
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        assert file != null;
        if (file.exists()) {
            file.delete();
        }
        try {
            Blog b=new Blog();
            b.del(num);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("root/BlogManger.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
