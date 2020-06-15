package com.web.banking.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.web.banking.connection.DbConnection;
import com.web.banking.entity.Account;
import com.web.banking.entity.Customer;
import com.web.banking.entity.TransStatement;

public class BankingDbUtil {
	
	
	public static boolean verifyLogin(String username,String password){
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			stmt = con.prepareStatement("SELECT * FROM USER WHERE username = ? and password = ?");
			stmt.setString(1,username);
			stmt.setString(2,password);
			rs = stmt.executeQuery();
			if(rs.next()) {
				con.close();
				return true;
			}
			con.close();
			
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			
			close(con, stmt, rs);
		}
		return false;
	}
	
	public static int createCustomer(Customer customer){
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int genId=-1;
		
		try {
			
			con = DbConnection.getConnection();
			
			String sql = "Insert into Customer(name,age,address,state,city) values(?,?,?,?,?)";
			
			stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			stmt.setString(1,customer.getName());
			stmt.setInt(2, customer.getAge());
			stmt.setString(3, customer.getAddress());
			stmt.setString(4, customer.getState());
			stmt.setString(5, customer.getCity());
			
			stmt.execute();
			
			rs = stmt.getGeneratedKeys();
			
			if (rs.next()) {
			    genId = rs.getInt(1);
			}
			
			con.close();
			
			
		} 
		catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			
			close(con, stmt, rs);
			return genId;
		}
	}
	

	public static  List<Customer> getCustomers(){
		
		List<Customer> customers = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			
			con = DbConnection.getConnection();
			
			String sql = "select * from Customer order by customer_id,name";
			
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			
			while (rs.next()) {
				int id = rs.getInt("customer_id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String address = rs.getString("address");
				String state = rs.getString("state");
				String city = rs.getString("city");
				
				Customer customer = new Customer(id,name,age,address,state,city);
				
				customers.add(customer);
				
			}		
			
		} 
		
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			
			close(con, stmt, rs);
		}
		
		return customers;		
	}
	

    public static List<Customer> searchCustomers(String searchkwd){
    	
		
		List<Customer> customers = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			String sql="Select * From Customer Where customer_id = ? Or lower(name) Like ? order by customer_id,name";
			
			stmt = con.prepareStatement(sql);
			
			if(isInteger(searchkwd))
				stmt.setInt(1,Integer.parseInt(searchkwd));
			else
				stmt.setInt(1,0);
			
			stmt.setString(2,searchkwd.toLowerCase()+"%");
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				int id = rs.getInt("customer_id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String address = rs.getString("address");
				String state = rs.getString("state");
				String city = rs.getString("city");
				
				Customer customer = new Customer(id,name,age,address,state,city);
				customers.add(customer);
						
			}
					
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			close(con, stmt, rs);
		}	
		
		return customers;
	}
    
    public static Customer getCustomer(int customerId){

		Customer customer = null;
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			
			con = DbConnection.getConnection();
			
			String sql = "select * from Customer where customer_id=?";
			
	
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, customerId);
			

			rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				int id = rs.getInt("customer_id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String address = rs.getString("address");
				String state = rs.getString("state");
				String city = rs.getString("city");
				
				customer = new Customer(id,name,age,address,state,city);
			}
			
			
			
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, stmt, rs);
		}
		
		return customer;
	}

	public static void updateCustomer(Customer customer) {
		
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			
			con = DbConnection.getConnection();
			
			String sql = "update Customer "
						+ "set name=?, age =?, address=?, state=?, city=? "
						+ "where customer_id=?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1,customer.getName());
			stmt.setInt(2, customer.getAge());
			stmt.setString(3, customer.getAddress());
			stmt.setString(4, customer.getState());
			stmt.setString(5, customer.getCity());
			stmt.setInt(6, customer.getId());
			
			stmt.execute();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			close(con, stmt, null);
		}
	}

	public static void deleteCustomer(int customerId){

		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			
			con = DbConnection.getConnection();
			
			
			con = DbConnection.getConnection();
			
			String sql = "delete from Customer where customer_id=?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, customerId);
			
			stmt.execute();
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, stmt, null);
		}	
	}
    
	public static int createAccount(Account account) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int genId = -1;
		
		try {
			con = DbConnection.getConnection();
			
			String sql = "Insert into Account(customer_id,account_type,balance) Values(?,?,?)";
			stmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
			stmt.setInt(1, account.getCustomerId());
			stmt.setString(2, account.getAccountType());
			stmt.setDouble(3, account.getBalance());
			
			int count = stmt.executeUpdate();
			
			rs = stmt.getGeneratedKeys();
			if (rs.next()) {
			    genId = rs.getInt(1);
			}
			
			if(count>0)
				createStatement(genId,account.getBalance(),"Credited : By Deposit");
			
		} 
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, stmt, null);
			return genId;
		}
		
	}
	
	public static void deleteAccount(int accountId) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			stmt = con.prepareStatement("DELETE FROM Account WHERE Account_Id = ?");
			
			stmt.setInt(1, accountId);
			
			stmt.execute();
		} 
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, stmt, null);
		}
	}
	
    public static Account getAccount(int accountId){

		Account account = null;
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			con = DbConnection.getConnection();
			
			String sql = "select * from account where account_id=?";
			
	
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, accountId);
			

			rs = stmt.executeQuery();
			
			if (rs.next()) {
				
				int id = rs.getInt("account_id");
				int customerId = rs.getInt("customer_id");
				String type = rs.getString("account_type");
				double balance = rs.getDouble("balance");
				
				account = new Account(id,customerId,type,balance);
			}
			
			
			
		}
		catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, stmt, rs);
		}
		
		return account;
	}
	
    
    public static List<Account> getAccounts(int customerId){
    	
    	List<Account> accounts = new ArrayList<Account>();
    	
    	Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			stmt = con.prepareStatement("SELECT * FROM Account Where customer_id = ?");
			stmt.setInt(1, customerId);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int account_id = rs.getInt("account_id");
				int customer_id = rs.getInt("customer_id");
				String type = rs.getString("account_type");
				double balance = rs.getDouble("balance");
				
				Account account = new Account(account_id,customer_id,type,balance);
				
				accounts.add(account);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			close(con, stmt, null);
			return accounts;
		}
    	
    }
    
    public static String deposit(int accountId,double dAmount) {
    	
    	Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			String sql = "SELECT balance FROM Account Where account_id = ?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, accountId);
			
			rs = stmt.executeQuery();
			
			double balance;
			
			if(rs.next())
				balance = rs.getDouble("balance");
			else
				return "Failure : Invalid Account Id !!";
			
			sql = "update Account "
					+ "set balance = ? "
					+ "where account_id=?";
			
			stmt = con.prepareStatement(sql);
			
			balance = balance + dAmount;
			stmt.setDouble(1,balance);
			stmt.setInt(2, accountId);
			
			int count = stmt.executeUpdate();
			
			if(count>0) {
				createStatement(accountId,dAmount,"Credited : By Deposit");
			}
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Success : Deposit amount of "+dAmount+" !!";
    	
    }
    
    public static String withdraw(int accountId,double wAmount) {
    	
    	Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			String sql = "SELECT balance FROM Account Where account_id = ?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, accountId);
			
			rs = stmt.executeQuery();
			
			double balance;
			
			if(rs.next())
				balance = rs.getDouble("balance");
			else
				return "Failure : Invalid Account Id !!";
			
			balance = balance - wAmount;
			
			if(balance<0)
				return "Failure : Doesn't have sufficient balance";
			
			sql = "update Account "
					+ "set balance = ? "
					+ "where account_id=?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setDouble(1,balance);
			stmt.setInt(2, accountId);
			
			int count = stmt.executeUpdate();
			
			if(count>0) {
				createStatement(accountId,wAmount,"Debited : By Withdraw");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Success : Withdraw amount of "+wAmount+" !!";
    	
    }
	
public static String transfer(int sourceAcId, int targetAcId, double tAmount) {
    	
    	Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			stmt = con.prepareStatement("SELECT balance FROM Account Where account_id = ?");
			
			stmt.setInt(1, sourceAcId);
			
			rs = stmt.executeQuery();
			
			double balance;
			
			if(rs.next())
				balance = rs.getDouble("balance");
			else
				return "Failure : Invalid Source Account Id !!";
			
			balance = balance - tAmount;
			
			if(balance<0)
				return "Failure : Source Doesn't have sufficient balance";
			
			String sql = "update Account "
					+ "set balance = ? "
					+ "where account_id=?";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setDouble(1,balance);
			stmt.setInt(2, sourceAcId);
			
			stmt.execute();
			
			String remark = "Debited : Transfered to "+targetAcId;
			createStatement(sourceAcId,tAmount,remark);
			
			stmt = con.prepareStatement("SELECT balance FROM Account Where account_id = ?");
			
			stmt.setInt(1, targetAcId);
			
			rs = stmt.executeQuery();
			
			
			if(rs.next())
				balance = rs.getDouble("balance");
			else
				return "Failure : Invalid Target Account Id !!";
			
			sql = "update Account "
					+ "set balance = ? "
					+ "where account_id=?";
			
			stmt = con.prepareStatement(sql);
			
			balance = balance + tAmount;
			stmt.setDouble(1,balance);
			stmt.setInt(2, targetAcId);
			
			stmt.execute();
			
			remark = "Credited : Transfered from "+sourceAcId;
			createStatement(targetAcId,tAmount,remark);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			close(con,stmt,rs);
		}
		return "Success : Transfer amount of "+tAmount+" !!";
    	
    }

	public static List<TransStatement> getStatements(int accountId,Date startDate,Date endDate) throws ParseException{
		
		List<TransStatement> statements = new ArrayList<TransStatement>();
		
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			String sql = "SELECT * FROM STATEMENT WHERE account_id = ? AND Date BETWEEN ? AND ? ORDER BY Date";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, accountId);
			stmt.setDate(2, new java.sql.Date(startDate.getTime()));
			stmt.setDate(3, new java.sql.Date(endDate.getTime()));
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				int AccountId = rs.getInt("account_id");
				Date date = rs.getDate("date");
				double amount = rs.getDouble("amount");
				String remark = rs.getString("remark");
				TransStatement statement = new TransStatement(id,AccountId,date,amount,remark);
				statements.add(statement);
			}
					
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con,stmt,rs);
			return statements;
		}
	}
	
	public static void createStatement(int accountId,double amount,String remark) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DbConnection.getConnection();
			
			String sql = "INSERT INTO Statement(account_id,date,amount,remark) Values(?, ?, ?, ?)";
			
			stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, accountId);
			
			Calendar calendar = Calendar.getInstance();
			java.util.Date curDate = calendar.getTime();
			
			stmt.setDate(2, new java.sql.Date(curDate.getTime()));
			stmt.setDouble(3, amount);
			
			
			stmt.setString(4, remark);
			
			stmt.executeUpdate();
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

    private static void close(Connection con, Statement stmt, ResultSet rs) {
 
		try {
			if (rs != null) {
				rs.close();
			}
			
			if (stmt != null) {
				stmt.close();
			}
			
			if (con != null) {
				con.close();  
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
	}
    
	public static boolean isInteger(String str) { 
		  try {  
		    Integer.parseInt(str);  
		    return true;
		  } catch(NumberFormatException e){  
		    return false;  
		  }  
	}

}
