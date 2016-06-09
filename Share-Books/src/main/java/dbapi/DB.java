package dbapi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.text.*;

public class DB {
	private final String DB_URL = "jdbc:mysql://140.134.26.83/sharebooks?useUnicode=true&characterEncoding=UTF-8";

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

	public Boolean Reg(String info[]) { // info{username,email,pw,phone}
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

	public Boolean Modify(String info[]) { // info{username,email,pw,phone}
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
			if (info[0] != "") {
				sql = "update sharebooks.user_data set username =  '" + info[0] + "' where email = '" + info[4]
						+ "' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
			}
			if (info[1] != "") {
				sql = "update sharebooks.user_data set email =  '" + info[1] + "' where email = '" + info[4]
						+ "' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
				info[4] = info[1];
			}
			if (info[2] != "") {
				sql = "update sharebooks.user_data set pw =  '" + info[2] + "' where email = '" + info[4]
						+ "' and pw = '" + info[5] + "'";
				stmt.executeUpdate(sql);
				info[5] = info[2];
			}
			if (info[3] != "") {
				sql = "update sharebooks.user_data set phone =  '" + info[3] + "' where email = '" + info[4]
						+ "' and pw = '" + info[5] + "'";
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

	public Boolean Lend(String email, String bid, String ownid) {
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
			String sql = "SELECT * FROM sharebooks.user_data where email='" + email + "'";
			ResultSet rs = stmt.executeQuery(sql);
			String uid = "";
			if (rs.next()) {
				uid = Integer.toString(rs.getInt("id"));
			}

			sql = "SELECT * FROM sharebooks.book_owner where bid='" + bid + "' and lend_state=0";
			rs = stmt.executeQuery(sql);
			// STEP 5: Extract data from result set

			if (rs.next()) {

				sql = "SELECT * FROM sharebooks.book_lender where bid='" + bid + "' and uid='" + uid
						+ "' and borrow_state=0";
				ResultSet otherrs = stmt.executeQuery(sql);

				if (otherrs.next()) {
					result = false;
				} else {
					sql = "insert into sharebooks.book_lender(uid,bid,owner_id,borrow_state) values('" + uid + "','"
							+ bid + "','" + ownid + "','0')";
					stmt.executeUpdate(sql);

					sql = "update sharebooks.book_owner set lend_state = 1 where uid=" + ownid + " and bid=" + bid;
					stmt.execute(sql);

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

	public String[][] query(String email) {
		String[][] result = new String[0][0];

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
			stmt = conn.createStatement();
			String sql = "SELECT * FROM sharebooks.user_data where email='" + email + "'";
			ResultSet rs = stmt.executeQuery(sql);
			String uid = "";
			if (rs.next()) {
				uid = Integer.toString(rs.getInt("id"));
			}
			sql = "SELECT * FROM book_lender where owner_id='" + uid + "'";
			rs = stmt.executeQuery(sql);

			// STEP 5: Extract data from result set
			rs.last();
			result = new String[rs.getRow()][6];
			rs.beforeFirst();
			int rscount = 0;
			while (rs.next()) {
				result[rscount][0] = Integer.toString(rs.getInt("uid"));
				result[rscount][1] = Integer.toString(rs.getInt("bid"));
				result[rscount][2] = Integer.toString(rs.getInt("owner_id"));
				result[rscount][3] = Integer.toString(rs.getInt("borrow_state"));
				// result[rscount][4] = rs.getTime("updated").toString();
				// result[rscount][5] = rs.getTime("created").toString();
				rscount++;
			}
			for (int i = 0; i < result.length; i++) {
				sql = "SELECT * FROM user_data where id='" + result[i][0] + "'";
				rs = stmt.executeQuery(sql);
				rs.next();
				result[i][0] = rs.getString("username");

				sql = "SELECT * FROM book_data where id='" + result[i][1] + "'";
				rs = stmt.executeQuery(sql);
				rs.next();
				result[i][1] = rs.getString("bookname");

				sql = "SELECT * FROM user_data where id='" + result[i][2] + "'";
				rs = stmt.executeQuery(sql);
				rs.next();
				result[i][2] = rs.getString("username");
			}
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

	public Boolean add_book_data(String[] info) {
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

			String sql = "SELECT * FROM sharebooks.book_data where isbn_10='" + info[0] + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				return false;
			}
			rs.close();

			sql = "insert into sharebooks.book_data(isbn_10,bookname,description,author,publisher,publish_date) values("
					+ info[0] + ",'" + info[1] + "','" + info[2] + "','" + info[3] + "','" + info[4] + "','" + info[5]
					+ "')";
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

	public String[] readBookInfo(String bid) {
		Connection conn = null;
		Statement stmt = null;
		String[] result = new String[7];

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

				result[0] = Integer.toString(rs.getInt("id"));
				// result[1] = new String
				// (Long.toString(rs.getLong("isbn_10")).getBytes("utf-8"),"utf-8");
				result[1] = new String(rs.getString("isbn_10").getBytes("utf-8"), "utf-8");
				result[2] = new String(rs.getString("bookname").getBytes("utf-8"), "utf-8");
				result[3] = new String(rs.getString("description").getBytes("utf-8"), "utf-8");
				result[4] = new String(rs.getString("author").getBytes("utf-8"), "utf-8");
				result[5] = new String(rs.getString("publisher").getBytes("utf-8"), "utf-8");
				result[6] = new String(rs.getString("publish_date").getBytes("utf-8"), "utf-8");

			} else {
				result = null;
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

	public String[] readUserInfo(String uid) {
		Connection conn = null;
		Statement stmt = null;
		String[] result = new String[4];

		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT * FROM sharebooks.user_data where id='" + uid + "'";
			ResultSet rs = stmt.executeQuery(sql);

			// STEP 5: Extract data from result set
			if (rs.next()) {

				result[0] = Integer.toString(rs.getInt("id"));
				// result[1] = new String
				// (Long.toString(rs.getLong("isbn_10")).getBytes("utf-8"),"utf-8");
				result[1] = new String(rs.getString("username").getBytes("utf-8"), "utf-8");
				result[2] = new String(rs.getString("email").getBytes("utf-8"), "utf-8");
				result[3] = new String(rs.getString("phone").getBytes("utf-8"), "utf-8");

			} else {
				result = null;
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

	public String update_book_owner(String isbn, String email, String passwd) {
		// String[] result = new String[2];

		if (isbn.equals("")) {
			return "noinput";
		}

		String[] id_buffer = new String[2];
		Connection conn = null;
		Statement stmt = null;
		String local_time;
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy-MM-dd HH:mm:ss"); // 套用新格式
		local_time = sdf.format(d);
		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String sql = "SELECT * FROM sharebooks.book_data where isbn_10='" + isbn + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next() == false) {
				return "insert";
			}
			rs.close();

			sql = "SELECT * FROM sharebooks.user_data where email='" + email + "' and pw = '" + passwd + "'";
			ResultSet rs_user_id = stmt.executeQuery(sql);
			if (rs_user_id.next()) {
				id_buffer[0] = Integer.toString(rs_user_id.getInt("id"));
			} else {

			}
			rs_user_id.close();

			sql = "SELECT * FROM sharebooks.book_data where isbn_10='" + isbn + "'";
			ResultSet rs_book_id = stmt.executeQuery(sql);
			if (rs_book_id.next()) {
				id_buffer[1] = Integer.toString(rs_book_id.getInt("id"));
			} else {

			}
			rs_book_id.close();

			sql = "insert into sharebooks.book_owner(uid,bid,lend_state,updated) values('" + id_buffer[0] + "','"
					+ id_buffer[1] + "','0','" + local_time + "')";
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

		return "更新成功";
	}

	public String[][] getBookInfo() {
		Connection conn = null;
		Statement stmt = null;
		String[][] result = null;

		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT * FROM sharebooks.book_data";
			ResultSet rs = stmt.executeQuery(sql);
			result = new String[getBookNumber()][6];
			// STEP 5: Extract data from result set

			int i = 0;
			while (rs.next()) {
				result[i][0] = Integer.toString(rs.getInt("id"));
				result[i][1] = new String(rs.getString("bookname").getBytes("utf-8"), "utf-8");
				result[i][2] = new String(rs.getString("author").getBytes("utf-8"), "utf-8");
				result[i][3] = new String(rs.getString("publish_date").getBytes("utf-8"), "utf-8");
				result[i][4] = new String(rs.getString("publisher").getBytes("utf-8"), "utf-8");
				result[i][5] = new String(rs.getString("description").getBytes("utf-8"), "utf-8");
				i++;

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
	public int getBookNumber() {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT COUNT(bookname) FROM sharebooks.book_data WHERE bookname IS NOT NULL";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next())
				result = Integer.parseInt(rs.getString("COUNT(bookname)"));
			
			// STEP 5: Clean-up environment
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
	public String getUserID(String bookID) {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;
		try {
			// STEP 2: Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");

			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = conn.createStatement();

			String sql = "SELECT uid FROM sharebooks.book_owner WHERE bid=" + bookID;
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next())
				result = Integer.parseInt(rs.getString("uid"));
			
			// STEP 5: Clean-up environment
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
		return Integer.toString(result);
	}
}
