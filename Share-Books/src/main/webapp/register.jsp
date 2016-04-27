<%@page import="java.sql.*" %>
<%@page contentType="text/html; charset=UTF-8" %>
<html>
<body>
<%
class DB {
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
}
%>

<%
	DB d = new DB();
	String name = request.getParameter("userName");
	String mail = request.getParameter("email");
	String pwd = request.getParameter("password");
	String phone = request.getParameter("phone");
	
	String[] infomation = {name, mail, pwd, phone};
	if(d.Reg(infomation))
		out.print("註冊成功!!" + "<br/>");
	else
		out.print("註冊失敗!!" + "<br/>");
		
%>
<input type="button" name="goToIndexPage" onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>