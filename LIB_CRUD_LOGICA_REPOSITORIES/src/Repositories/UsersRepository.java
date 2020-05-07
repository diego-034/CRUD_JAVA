/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repositories;

import Models.Users;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author DIEGO
 */
public class UsersRepository {

    public Exception Exception;

    public boolean Add(Users user) {

        try {
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:sqlserver://localhost;databaseName=crud_user;user=sa;password=0mil2002;");
            String query = "INSERT INTO Users  (name, password,"
                    + "state,document)"
                    + "VALUES (?,?,?,?);";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getPassword());
            stmt.setBoolean(3, user.isState());
            stmt.setString(4, user.getDocument());
            stmt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception ex) {
            Exception = ex;
            return false;
        }
    }

    public ArrayList<Users> List() {
        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:sqlserver://localhost;databaseName=crud_user;user=sa;password=0mil2002;");
            String query = "SELECT * FROM Users;";
            Statement stmt = connection.createStatement();
            ResultSet result = stmt.executeQuery(query);
            ArrayList<Users> list = new ArrayList();
            while (result.next()) {
                Users user = new Users();
                user.setId(result.getInt("id"));
                user.setName(result.getString("name"));
                user.setPassword(result.getString("password"));
                user.setState((result.getInt("state")) == 1 ? true : false);
                user.setDocument(result.getString("document"));
                list.add(user);
            }
            connection.close();
            return list;
        } catch (Exception ex) {
            Exception = ex;
            return null;
        }
    }

    public Users GetUser(String idSelected) {
        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:sqlserver://localhost;databaseName=crud_user;user=sa;password=0mil2002;");
            String query = "SELECT * FROM Users "
                    + "WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, idSelected);
            ResultSet result = stmt.executeQuery();
            Users user = new Users();
            if (result.next()) {
                user.setId(result.getInt("id"));
                user.setName(result.getString("name"));
                user.setPassword(result.getString("password"));
                user.setState((result.getInt("state")) == 1 ? true : false);
                user.setDocument(result.getString("document"));
            }
            connection.close();
            return user;
        } catch (Exception ex) {
            Exception = ex;
            return null;
        }
    }

    public boolean Update(Users user) {
        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:sqlserver://localhost;databaseName=crud_user;user=sa;password=0mil2002;");
            String query = "UPDATE Users SET name = ?, password = ?, state = ?, document = ? "
                    + "WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getPassword());
            stmt.setBoolean(3, user.isState());
            stmt.setString(4, user.getDocument());
            stmt.setInt(5, user.getId());
            stmt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception ex) {
            Exception = ex;
            return false;
        }
    }

    public boolean Delete(String idSelected) {
        try {
            Connection connection = DriverManager.getConnection(
                    "jdbc:sqlserver://localhost;databaseName=crud_user;user=sa;password=0mil2002;");
            String query = "DELETE FROM Users "
                    + "WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, idSelected);
            stmt.executeUpdate();
            connection.close();
            return true;
        } catch (Exception ex) {
            Exception = ex;
            return false;
        }
    }
}
