package com.qasurgetechnologies.blog.dao;

import com.qasurgetechnologies.blog.helper.ConnectionProvider;
import com.qasurgetechnologies.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class UserDao {

    public static void main(String[] args) {

        try {
            // User user = new User("ajay", "ajay@gmail.com", "ajay", "m");
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            System.out.println(userDao.doesUserRecordsExist("ajay@gmail.com", "ajay"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public boolean insertUserRecords(User user) {

        try {
            Thread.sleep(0);
        } catch (Exception e) {
        }

        boolean flag = false;
        String sql = "insert into user (name, email, password, gender) values(?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getGender());
            int count = statement.executeUpdate();

            if (count > 0) {
                System.out.println("Records succcessfully submitted");
                flag = true;
            } else {
                System.out.println("Something went wrong...Records not submitted");
            }
        } catch (SQLException e) {
            System.out.println("Something went wrong...Records not submitted");
            e.printStackTrace();
        }

        return flag;
    }

    public boolean doesUserRecordsExist(String email, String password) {
        boolean flag = false;

        try {
            String query = "select count(*) from user where email=? and password=?;";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            flag = (count > 0) ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rSet = pstmt.executeQuery();
            
            while(rSet.next()){
                user=new User();
                user.setName(rSet.getString("name"));
                user.setEmail(rSet.getString("email"));
                user.setPassword(rSet.getString("password"));
                user.setGender(rSet.getString("gender"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
