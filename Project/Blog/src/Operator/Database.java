package Operator;

import java.sql.*;
import java.util.ArrayList;

public class Database
{
    private String dataBaseAddress = "localhost:3306/nightmare";
    private String userName = "root";
    private String passWord = "admin520zhuo";
    
    public Database ()
    {
        
    }
    
    public Database(String dataBaseAddress,
            String userName,  String passWord)
    {
        this.dataBaseAddress = dataBaseAddress;
        this.userName = userName;
        this.passWord = passWord;
    }
    
    public Connection getConnection(String address, String userName, String passWord) 
            throws SQLException ,java.lang.ClassNotFoundException
    {
        String url = "jdbc:mysql://" + address + "?" + "useSSL=false" + "&" + "characterEncoding=utf-8";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con  = DriverManager.getConnection(url, userName, passWord);
        return con;
    }
    
    /**
     * 登录
     * @param e_mail
     * @param password 
     * @return 
     */
    public String login(String IDentity, String password)
    {   
        String userName = "";
        try
        {
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);
            String qurey="select * from  userinfo where (e_mail=? or userName=?) and password=?";
            PreparedStatement statement=con.prepareStatement(qurey);
            statement.setString(1, IDentity);
            statement.setString(2, IDentity);            
            statement.setString(3, Code.getSHA256(password));
            ResultSet result = statement.executeQuery();
            
            if (result.next())
                userName = result.getString(2);
            
            statement.close();
            con.close();
        }
        catch (java.lang.ClassNotFoundException e)
        {
            System.err.println(e.getMessage());
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
        }
        return userName;
    }
    
    /**
     * 检测邮箱
     * @param e_mail
     * @return
     */
    public boolean checkE_mail(String e_mail)
    {
        boolean flag = false;
        try
        {
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);
            String qurey="select * from userinfo where e_mail=?";
            PreparedStatement statement=con.prepareStatement(qurey);
            statement.setString(1, e_mail);
            ResultSet result = statement.executeQuery();
            
            if (result.next())
                flag = true;
            else
                flag = false;
            statement.close();
            con.close();
        }
        catch (java.lang.ClassNotFoundException e)
        {
            System.err.println(e.getMessage());
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
        }
        return flag;
    }
    
    /**
     * 检测用户名
     * @param userName
     * @return
     */
    public boolean checkUserName(String userName)
    {
        boolean flag = false;
        try
        {
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);
            String qurey="select * from userinfo where userName=?";
            PreparedStatement statement=con.prepareStatement(qurey);
            statement.setString(1, userName);
            ResultSet result = statement.executeQuery();
            
            if (result.next())
                flag = true;
            else
                flag = false;
            
        }
        catch (java.lang.ClassNotFoundException e)
        {
            System.err.println(e.getMessage());
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
        }
        return flag;
    }
    
    /**
     * 注册
     * @param e_mail
     * @param userName
     * @param password
     * @return
     */
    public boolean register(String e_mail, String userName, String password)
    {
        if (checkE_mail(e_mail) || checkUserName(userName))
            return false;
        
        try
        {            
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);
           
            String query = "insert into userinfo (e_mail, userName, password) "
                    + "values(?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, e_mail);
            statement.setString(2, userName);
            statement.setString(3, Code.getSHA256(password));
            int result = statement.executeUpdate();
            
            statement.close();
            con.close();
            
            return result > 0;
        }
        catch (java.lang.ClassNotFoundException e)
        {
            System.err.println(e.getMessage());
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
        }
        return false;
    }
    
    /**
     * 查找series的文章,返回只有number和title属性的Essay列表
     * @param series
     * @return
     */
    public ArrayList<Essay> selectEssayBySeries(String series)
    {
        ArrayList<Essay> essayList = null;
        try{
            essayList = new ArrayList<>();
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);         
            String query = "select number, title from essay where series=?";       
            PreparedStatement statment = con.prepareStatement(query);
            statment.setString(1, series);
            ResultSet result = statment.executeQuery();
            while(result.next()){    
                Essay essay = new Essay(result.getInt(1), result.getString(2));
                essayList.add(essay);
            }
            statment.close();
            con.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return essayList;
    }
    
    /**
     * 查找number的文章,number只有一个, 故只有一篇文章
     * @param series
     * @return
     */
    public Essay selectEssayByNumber(int number)
    {
        Essay essay = null;
        try{
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);         
            String query = "select * from essay where number=?";       
            PreparedStatement statment = con.prepareStatement(query);
            statment.setInt(1,number);
            ResultSet result = statment.executeQuery();
            while(result.next()){    
                essay = new Essay(result.getInt(1), result.getString(2), result.getString(3), result.getString(4));
              
            }
            statment.close();
            con.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return essay;
    }
    
    /**
     * 留言
     * @param e_mail 留言的签名
     * @param signed 是否是注册的签名
     * @param text 留言内容
     * @return 留言成功返回true
     */
    public boolean leftAMessage(String e_mail, Boolean signed, String text)
    {
        try
        {            
            Connection con = getConnection(this.dataBaseAddress, this.userName, this.passWord);
           
            String query = "insert into message (e_mail, signed, text)"
                    + "values(?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, e_mail);
            statement.setBoolean(2, signed);
            statement.setString(3, text);
            int result = statement.executeUpdate();
            
            statement.close();
            con.close();
            
            return result > 0;
        }
        catch (java.lang.ClassNotFoundException e)
        {
            System.err.println(e.getMessage());
        }
        catch (SQLException ex)
        {
            System.err.println("SQLException: " + ex.getMessage());
        }
        return false;
    }
}