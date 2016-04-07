package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

public class ExamBean {

	private Connection conn;
	private Statement stmt;
  	private DataSource ds;
	
	public ExamBean()
	{
	}
	
	static{
		try 
		{
			//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");           
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("加载驱动");
		} 
		catch (Exception ex) 
		{
			System.err.println("加载驱动时出错: " + ex.getMessage());
		}
	}

	/**
		打开数据库
	*/
	public void open() 
	{
		try 
		{
			//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");           
			//conn = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;databasename=exam","sa","");
			String UR="jdbc:mysql://localhost:3306/exam";
			conn = DriverManager.getConnection(UR,"root","123");
			stmt=conn.createStatement();
			System.out.println("打开数据库连接");
		} 
		catch (Exception ex) 
		{
		System.err.println("打开数据库时出错: " + ex.getMessage());
		}
	}

	/**
		关闭数据库，将连接返还给连接池
	*/
	public void closeStmt() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
			System.out.println ("释放连接");
		} 
		catch (SQLException ex) 
		{
			System.err.println("返还连接池出错: " + ex.getMessage());
		}
	}

	/**
		执行查询
	*/
	public ResultSet executeQuery(String sql) throws SQLException
	{
		try 
		{
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");           
			//conn = DriverManager.getConnection("jdbc:odbc:exam");
			//conn = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;databasename=exam","sa","");
			String UR="jdbc:mysql://localhost:3306/exam";
			conn = DriverManager.getConnection(UR,"root","");
			stmt=conn.createStatement();
			System.out.println("打开数据库连接");
		} 
		catch (Exception ex) 
		{
		System.err.println("打开数据库时出错: " + ex.getMessage());
		}
		ResultSet rs = null;
		

		rs = stmt.executeQuery(sql);
		System.out.println ("执行查询");
		return rs;
	}

	/**
		执行增删改
	*/
	public int executeUpdate(String sql) throws SQLException
	{
		try 
		{
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");           
			//conn = DriverManager.getConnection("jdbc:odbc:exam");
			//conn = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;databasename=exam","sa","");
			String UR="jdbc:mysql://localhost:3306/exam";
			conn = DriverManager.getConnection(UR,"root","123");
			stmt=conn.createStatement();
			System.out.println("打开数据库连接");
		} 
		catch (Exception ex) 
		{
		System.err.println("打开数据库时出错: " + ex.getMessage());
		}
		int ret = 0;
		
	
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("执行增删改");
		return ret;
	}

	/**
		将SQL语句加入到批处理
	*/
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	/**
		执行批处理
	*/
	public int [] executeBatch() throws SQLException 
	{
		boolean isAuto=conn.getAutoCommit();
		
		conn.setAutoCommit(false);
		int [] updateCounts = stmt.executeBatch();
		
//		conn.commit();
		
//		conn.setAutoCommit(isAuto);
		//conn.setAutoCommit(true);
		return updateCounts;
	}
	public boolean getAutoCommit() throws SQLException
	{
		return conn.getAutoCommit();
	}
	public void setAutoCommit(boolean auto)  throws SQLException 
	{
		conn.setAutoCommit(auto);
	}
	
	public void commit() throws SQLException 
	{
		conn.commit();
//		this.close();
	}
	public void rollBack() throws SQLException 
	{
		conn.rollback();
//		this.close();
	}
}
