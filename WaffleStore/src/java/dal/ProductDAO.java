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
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .category_Id(rs.getInt(7))
                        .build();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where Product.category_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .category_Id(rs.getInt(7)).build();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product order by id \n"
                    + "offset (?-1)*? row fetch next ? row only";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .category_Id(rs.getInt(7)).build();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProducts() {
        try {
            String sql = "select count(*) from Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where name like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .category_Id(rs.getInt(7)).build();
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductById(int productId) {
        try {
            String sql = "select * from Product where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .category_Id(rs.getInt(7)).build();
                return product;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void editProduct(String pname, String pquantity, String pprice, String pdescription, String pimageUrl) {
    }

    public List<Product> getRelatedProductById(int productId) {
        List<Product> list = new ArrayList<>();
        Product p = getProductById(productId);
        try {
            String sql = "SELECT top 4 [id]\n"
                    + "      ,[name]\n"
                    + "      ,[quantity]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[imageUrl]\n"
                    + "      ,[category_id]\n"
                    + "  FROM [dbo].[Product]\n"
                    + "  where category_id = ? and id != ? order by price desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getCategory_Id());
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder()
                        .id(rs.getInt(1))
                        .name(rs.getString(2))
                        .quantity(rs.getInt(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .imageUrl(rs.getString(6))
                        .category_Id(rs.getInt(7)).build();
                list.add(product);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        System.out.println(p.getRelatedProductById(9).size());
    }

    public void insert(Product p) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[imageUrl]\n"
                + "           ,[category_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(2, p.getName());
            st.setInt(3, p.getQuantity());
            st.setDouble(4, p.getPrice());
            st.setString(5, p.getDescription());
            st.setString(6, p.getImageUrl());
            st.setInt(7, p.getCategory_Id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
