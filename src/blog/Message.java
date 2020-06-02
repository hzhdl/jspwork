package blog;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class Message extends Sql{
    public Boolean add(String content, Date time) throws SQLException {
        Statement s=this.getConnection().createStatement();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String t=df.format(time);
        String s1="insert into message(Content,Time) VALUES('"+content+"','"+t+"')";
        s.executeUpdate(s1);
        return true;
    }
    public Boolean add(String content, Date time,String pnumber) throws SQLException {
        Statement s=this.getConnection().createStatement();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String t=df.format(time);
        String s1="insert into message(Content,Time,,ParentNumber) VALUES('"+content+"','"+t+"','"+pnumber+"')";
        s.executeUpdate(s1);
        return true;
    }
    public Boolean del(String number) throws SQLException{
        Statement s=this.getConnection().createStatement();
        String s1="DELETE from message where MessageNumber="+number;
        s.executeUpdate(s1);
        String s2="DELETE from message where ParentNumber="+number;
        s.executeUpdate(s1);
        return true;
    }
    //
    public ResultSet getparentmessage() throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="select * from message where ParentNumber='-1'";
        s.executeUpdate(s1);
        return s.getResultSet();
    }
    public ResultSet getchildmessage(String number) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="select * from message where ParentNumber='"+number+"'";
        s.executeUpdate(s1);
        return s.getResultSet();
    }
    //其他功能暂定

}
