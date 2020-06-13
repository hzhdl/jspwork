package blog;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Tip extends Sql{
    public Tip(){}
    public Boolean addTip(String Tip) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="insert into tip(TipName) VALUES('"+Tip+"')";
        s.executeUpdate(s1);
        return true;
    }
    //标签删除
    public Boolean del(String Tip) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="DELETE from tip where TipName='"+Tip+"'";
        s.executeUpdate(s1);
        return true;
    }
    public ResultSet getall() throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="SELECT * FROM `tip`";
        s.executeQuery(s1);
        return s.getResultSet();
    }
    /*public String check(int tip) throws SQLException {
        Statement s=this.getConnection().createStatement();
        String s1="insert into tip(TipName) VALUES('"+Tip+"')";
        s.executeUpdate(s1);
        return " ";
    }*/
}
