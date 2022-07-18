/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author DELL
 */
public class AccountDAO extends DBContext {

    public Account login(String username, String password) {
        try {
            String sql = "select * from Account where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .phone(rs.getString(7))
                        .role(rs.getString(8))
                        .build();
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean signUpAccount(String user, String pass, String email) {
        try {
            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[email])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.execute();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    public List<Account> getAllAccounts() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .phone(rs.getString(7))
                        .build();
                list.add(account);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Account> getAllUserAccounts() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account where id != 2";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .phone(rs.getString(7))
                        .role(rs.getString(8))
                        .build();
                list.add(account);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        AccountDAO account = new AccountDAO();
        account.deactiveA(3);
        
        
    }

    public Account getAccountByAccountId(int accountId) {
        try {
            String sql = "select * from Account where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = Account.builder()
                        .id(rs.getInt(1))
                        .username(rs.getString(2))
                        .password(rs.getString(3))
                        .displayName(rs.getString(4))
                        .address(rs.getString(5))
                        .email(rs.getString(6))
                        .phone(rs.getString(7))
                        .role(rs.getString(8))
                        .build();
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public boolean deactiveA(int id) {
        Account a = getAccountByAccountId(id);
        String sql = "";
        if (a.getRole().equals("USER")) {
            sql = "UPDATE [dbo].[Account]\n"
                    + "   SET \n"
                    + "      [role] = 'DEACTIVE'\n"
                    + " WHERE id = ?";
        } else {
            sql = "UPDATE [dbo].[Account]\n"
                    + "   SET \n"
                    + "      [role] = 'USER'\n"
                    + " WHERE id = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

}
