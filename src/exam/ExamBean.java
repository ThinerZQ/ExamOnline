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
			System.out.println("��������");
		} 
		catch (Exception ex) 
		{
			System.err.println("��������ʱ����: " + ex.getMessage());
		}
	}

	/**
		�����ݿ�
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
			System.out.println("�����ݿ�����");
		} 
		catch (Exception ex) 
		{
		System.err.println("�����ݿ�ʱ����: " + ex.getMessage());
		}
	}

	/**
		�ر����ݿ⣬�����ӷ��������ӳ�
	*/
	public void closeStmt() 
	{
		try 
		{
		
				
		//	connMgr.freeConnection("java", conn);
			conn.close();
			System.out.println ("�ͷ�����");
		} 
		catch (SQLException ex) 
		{
			System.err.println("�������ӳس���: " + ex.getMessage());
		}
	}

	/**
		ִ�в�ѯ
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
			System.out.println("�����ݿ�����");
		} 
		catch (Exception ex) 
		{
		System.err.println("�����ݿ�ʱ����: " + ex.getMessage());
		}
		ResultSet rs = null;
		

		rs = stmt.executeQuery(sql);
		System.out.println ("ִ�в�ѯ");
		return rs;
	}

	/**
		ִ����ɾ��
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
			System.out.println("�����ݿ�����");
		} 
		catch (Exception ex) 
		{
		System.err.println("�����ݿ�ʱ����: " + ex.getMessage());
		}
		int ret = 0;
		
	
		ret = stmt.executeUpdate(sql);
	
		System.out.println ("ִ����ɾ��");
		return ret;
	}

	/**
		��SQL�����뵽������
	*/
	public void addBatch(String sql) throws SQLException 
	{
		stmt.addBatch(sql);
	}

	/**
		ִ��������
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
