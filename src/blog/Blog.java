package blog;

import java.math.BigInteger;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Blog extends Sql{
    public Blog() throws SQLException {
        //Statement s=this.getConnection().createStatement();
    }
    //查询
    public ResultSet check(Date time, Boolean flag) throws SQLException {//根据时间查询
        Statement s=this.getConnection().createStatement();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String t=df.format(time);
        String s1;
        if(flag){
            s1="SELECT * FROM `blog` where Time <= '"+t+"'";
        }
        else{
            s1="SELECT * FROM `blog` where Time >= '"+t+"'";
        }
        s.executeQuery(s1);
        return s.getResultSet();
    }
    public ResultSet check(Date stime, Date etime) throws SQLException {//根据时间段查询
        Statement s=this.getConnection().createStatement();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String st=df.format(stime);
        String et=df.format(etime);
        String s1;
        s1="SELECT * FROM `blog` where Time >= '"+st+"' and Time <= '"+et+"'";
        s.executeQuery(s1);
        return s.getResultSet();
    }
    public ResultSet check(String tip) throws SQLException {//根据tip查询
        Statement s=this.getConnection().createStatement();
        String s1;
        s1="SELECT * from blog where Tip LIKE '%"+tip+"%'";
        s.executeQuery(s1);
        return s.getResultSet();
    }
    public ResultSet LikeFind(String key) throws SQLException {//根据tittle或者summary查询
        Statement s=this.getConnection().createStatement();
        String s1;
        s1="SELECT * from blog where Tip LIKE '%"+key+"%' OR Tittle like '%"+key+"%'";
        s.executeQuery(s1);
        return s.getResultSet();
    }
    //删除
    public Boolean del(String key) throws SQLException {//根据tittle或者summary查询
        Statement s=this.getConnection().createStatement();
        String s1;
        s1="DELETE from blog where Number='"+key+"'";
        s.executeQuery(s1);
        return true;
    }
    //修改

    //增加
    public Boolean AddBlog(String tittle, String summary, String path, String tip, Date time) throws SQLException{
        Statement s=this.getConnection().createStatement();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String t=df.format(time);
        String Insert="insert into blog(Tittle,Summary,Path,Tip,Time) VALUES('"+tittle+"','"+summary+"','"+path+"','"+tip+"','"+t+"')";
        s.executeUpdate(Insert);
        if(s!=null) {
            s.close();
        }
        return true;
    }
    //其他需求实现
    public BigInteger Findmax() throws SQLException {
        Statement s=this.getConnection().createStatement();
        String find="SELECT MAX(Number) from blog";
        BigInteger num;
        s.execute(find);
        ResultSet r=s.getResultSet();
        r.next();
        num=r.getBigDecimal(1).toBigInteger();
        r.close();
        s.close();
        return num;

    }
}
