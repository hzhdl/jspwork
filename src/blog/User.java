package blog;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User extends Sql{
    public Boolean changepwd(String pwd) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="UPDATE rootuser set RootPassword='"+pwd+"' where RootName='root'";
        s.executeUpdate(s1);
        return true;
    }
    public Boolean changeName(String Name) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="UPDATE rootuser set RealName='"+Name+"' where RootName='root'";
        s.executeUpdate(s1);
        return true;
    }
    public Boolean changestat(String Stat) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="UPDATE rootuser set Status='"+Stat+"' where RootName='root'";
        s.executeUpdate(s1);
        return true;
    }
    public String getName() throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="SELECT RealName from rootuser";
        s.execute(s1);
        ResultSet res=s.getResultSet();
        res.next();
        String ss=res.getString(1);
        res.close();
        s.close();
        return ss;
    }
    public String getstat() throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="SELECT `Status` from rootuser";
        s.execute(s1);
        ResultSet res=s.getResultSet();
        res.next();
        String ss=res.getString(1);
        res.close();
        s.close();
        return ss;
    }
}
