/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import context.DBContext;
import entity.Product;
import entity.Staffs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
//hiển thị tất cả sản phẩm
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select*from Products";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
//hiện thị danh mục
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select*from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
//hien thi san pham date gan nhat
    public Product getLast() {
        String query = "select top 1*from Products\n" +
"order by exp ASC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    //hien thi category_id sp
    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select*from Products\n"
                + "where category_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    //hiển thị sản phẩm theo id
    public Product getProductByID(String product_id) {
        String query = "select*from Products\n"
                + "where product_id = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    //tìm sản phẩm
        public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select*from Products\n" +
"where [product_name] like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,"%"+txtSearch +"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
        //login
        public Staffs login(String staff_name, String password){
            String query = "select*from Staffs\n" +
"where staff_name = ?\n" +
"and [password] = ?";
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, staff_name );
            ps.setString(2, password );
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Staffs(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                
                }
        } catch (Exception e) {
        }
            
            return null;
        }
         //kiểm tra tài khoản đã tồn tại hay chưa
        public Staffs checkStaffexist(String user){
            String query = "select*from Staffs\n" +
        "where staff_name = ?" ;
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user );
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Staffs(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4));
                
                }
        } catch (Exception e) {
        }
           
            return null;
        }
        //tạo tài khoản mới
        public void signup(String user, String dob, String pass){
            String query ="insert into Staffs\n" +
"values (?,?,?)";
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user );
            ps.setString(2, dob);
            ps.setString(3, pass);
            ps.executeUpdate();
             } catch (Exception e) {
             }
             
}
        //hiển thị sản phẩm theo ngày
         public List<Product> getProductByDatelist() {
        List<Product> list = new ArrayList<>();
        String query = "select *from Products\n" +
"order by exp ASC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
         //hiển thị sản phẩm theo số lượng
          public List<Product> getProductByQuantity() {
        List<Product> list = new ArrayList<>();
        String query = "select *from Products\n" +
"order by quantity Desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
          //xóa sản phẩm
        public void deleteProduct(String pid){
            String query = "delete from Products\n" +
"where product_id = ?";
                         try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid );
            ps.executeUpdate();
             } catch (Exception e) {
             }
        }
        //thêm sản phẩm
        public void insertProduct(String product_id, String product_name, String quantity,String exp, String mfg, String images,String description,String category_id,String price){
            String query = "INSERT [dbo].[Products]\n" +
"([product_id],[product_name],[quantity],[exp],[mfg],[images],[description],[category_id],[price])\n" +
"VALUES (?,?,?,?,?,?,?,?,?)";
                   try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);      
            ps.setString(1, product_id );
            ps.setString(2, product_name );
            ps.setString(3, quantity );
            ps.setString(4, exp);
            ps.setString(5, mfg );
            ps.setString(6, images );
            ps.setString(7, description );
            ps.setString(8, category_id );
            ps.setString(9, price );
            ps.executeUpdate();
             } catch (Exception e) {
             }
            
                   
        }
       //edit sp
  public void editProduct( String product_name, String quantity,String exp, String mfg, String images,String description,String category_id,String price,String product_id){
            String query = "update Products\n" +
"set \n" +
"[product_name] = ?,\n" +
"[quantity] = ?,\n" +
"[exp] = ?,\n" +
"[mfg] = ?,\n" +
"[images] = ?,\n" +
"[description] = ?,\n" +
"[category_id] =?,\n" +
"[price] = ? \n" +
"where [product_id] = ?";
                   try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);      
            ps.setString(1, product_name );
            ps.setString(2, quantity );
            ps.setString(3, exp);
            ps.setString(4, mfg );
            ps.setString(5, images );
            ps.setString(6, description );
            ps.setString(7, category_id );
            ps.setString(8, price );
            ps.setString(9, product_id );
            ps.executeUpdate();
            
             } catch (Exception e) {
             }
            
        }
  //dem so sp
  public int getTotalProducts(){
      String query ="select count(*)from Products";
      try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
  }
   public List<Product> pagingProducts(int index) {
        List<Product> list = new ArrayList<>();
        String query = "select*from Products\n" +
"order by product_id\n" +
"OFFSET ? rows fetch next 5 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index-1)*5);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }
   //load staffslist
   public List<Staffs> getStaffslist() {
        List<Staffs> list = new ArrayList<>();
        String query = "select *from Staffs" ;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Staffs(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
   public void insertStaffs( String staff_name, String dob,String password){
            String query = "INSERT [dbo].[Staffs]\n" +
"([staff_name],[dob],[password])\n" +
"VALUES (?,?,?)";
                   try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);      
            ps.setString(1, staff_name ); 
            ps.setString(3, dob );
            ps.setString(4, password);
            ps.executeUpdate();
             } catch (Exception e) {
             }
               
        }
   public void deleteStaff(String staff_id){
            String query = "delete from Staffs\n" +
"where staff_id = ?";
                         try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, staff_id );
            ps.executeUpdate();
             } catch (Exception e) {
             }
        }
}

  
   
