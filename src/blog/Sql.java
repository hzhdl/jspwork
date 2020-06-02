package blog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Sql {
    public Connection conn = null;
    public Sql(){
        String url = "jdbc:mysql://localhost/blog";
        String userName = "root";
        String password = "680490";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            System.out.println("加载驱动器类时出现异常");
        }try {
            conn = null;
            conn = DriverManager.getConnection(url, userName, password);
        } catch(SQLException e) {
            System.out.println("连接数据库的过程中出现SQL异常");
        } if (conn==null)
            System.out.println("连接数据库失败");
        else
            System.out.println("连接数据库成功");
    }
    public Connection getConnection()
    {
        return conn;
    }
    public Boolean del() throws SQLException {
        if(conn!=null){
            conn.close();
            return true;
        }
        return true;
    }
}
