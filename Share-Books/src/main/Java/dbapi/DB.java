package dbapi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private final String DB_URL = "jdbc:mysql://140.134.26.83/sharebooks";

	// Database credentials
	private final String USER = "sharebooks";
	private final String PASS = "fcuspm";

	public String[] Auth(String email, String passwd) {
		String[] result = new String[5];
		Connection conn = null;
		Statement stmt = null;

		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT * FROM sharebooks.user_data where email='" + email + "' and pw='" + passwd + "'";
			ResultSet rs = stmt.executeQuery(sql);

			// STEP 5: Extract data from result set

			if (rs.next()) {
				// Retrieve by column name
				result[0] = Integer.toString(rs.getInt("id"));
				result[1] = rs.getString("username");
				result[2] = rs.getString("email");
				result[3] = rs.getString("pw");
				result[4] = Integer.toString(rs.getInt("phone"));
			}
			// STEP 6: Clean-up environment
			rs.close();

			stmt.close();
			conn.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			} // end finally try
		} // end try
		return result;
	}

	public Boolean Reg(String info[]) { //info{username,email,pw,phone}
		if (info.length != 4) {
			return false;
		}
		Connection conn = null;
		Statement stmt = null;

		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT * FROM sharebooks.user_data where username='" + info[0] + "' and email='" + info[1]
					+ "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return false;
			}
			rs.close();

			sql = "insert into sharebooks.user_data(username,email,pw,phone) values('" + info[0] + "','" + info[1]
					+ "','" + info[2] + "','" + info[3] + "')";
			stmt.executeUpdate(sql);

			stmt.close();
			conn.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			} // end finally try
		} // end try

		return true;
	}
	
	public Boolean Modify(String info[]) { //info{username,email,pw,phone}
		if (info.length != 6) {
			return false;
		}
		
		Connection conn = null;
		Statement stmt = null;
		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String sql = "SET SQL_SAFE_UPDATES = 0";
			stmt.executeUpdate(sql);
			if(info[0]!=""){
				sql = "update sharebooks.user_data set username =  '" + info[0] + "' where email = '" + info[4] +"' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
			}
			if(info[1]!=""){
				sql = "update sharebooks.user_data set email =  '" + info[1] + "' where email = '" + info[4] + "' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
				info[4] = info[1];
			}
			if(info[2]!=""){
				sql = "update sharebooks.user_data set pw =  '" + info[2] + "' where email = '" + info[4] + "' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
				info[5] = info[2];
			}
			if(info[3]!=""){
				sql = "update sharebooks.user_data set phone =  '" + info[3] + "' where email = '" + info[4] + "' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
			}
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			} // end finally try
		} // end try

		return true;
	}
	
	public Boolean Lend(String uid, String bid, String ownid) {
		Connection conn = null;
		Statement stmt = null;

		Boolean result = false;

		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT * FROM sharebooks.book_data where id='" + bid + "'";
			ResultSet rs = stmt.executeQuery(sql);

			// STEP 5: Extract data from result set

			if (rs.next()) {

				sql = "SELECT * FROM sharebooks.book_lender where bid='" + bid + "' and uid='" + uid + "'";
				ResultSet otherrs = stmt.executeQuery(sql);

				if (otherrs.next()) {
					result = false;
				} else {
					sql = "insert into sharebooks.book_lender(uid,bid,owner_id,borrow_state) values('" + uid
							+ "','" + bid + "','" + ownid + "','0')";
					stmt.executeUpdate(sql);

					sql = "update book_owner set lend_state='1' WHERE bid='" + bid + "' and uid='" + uid
							+ "'";
					stmt.executeUpdate(sql);

					result = true;
				}
				otherrs.close();
			} else {
				result = false;
			}
			// STEP 6: Clean-up environment
			rs.close();
			conn.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			} // nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			} // end finally try
		} // end try
		return result;
	}
}
