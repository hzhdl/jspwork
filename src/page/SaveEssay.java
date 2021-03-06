package page;

import blog.Blog;
import blog.Essay;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "SaveEssay",urlPatterns = "/SaveEssay")
public class SaveEssay extends HttpServlet {
    private FileWriter fl;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        String ht= request.getParameter("te");
        String t=request.getParameter("tittle");
        String s=request.getParameter("summary");
        String ti=request.getParameter("tips");
        String path = request.getServletContext().getRealPath("/"); //得到项目路径
        Essay b=null;

        BigInteger num = null;
        try {
            b=new Essay();
            num = b.Findmax();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        num.add(new BigInteger(String.valueOf(1)));
        try {
            fl=new FileWriter(path+"Essay/essay"+num+".txt",true);
        } catch (IOException e) {
            e.printStackTrace();
        }
        PrintWriter l = new PrintWriter(fl);
        for(int i=0;i<ht.length();i++){
            if(ht.charAt(i)=='\n'){
                l.print("\n");
            }
            else{
                l.print(ht.charAt(i));}
        }
        l.flush(); //刷新缓冲
        try {
            b.AddBlog(t,s,"Essay/essay"+num+".txt",ti,new Date(new java.util.Date().getTime()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("root/EssayManger.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request,response);
    }
}
