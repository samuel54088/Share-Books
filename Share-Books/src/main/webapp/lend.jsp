<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		class DB {
			private final String DB_URL = "jdbc:mysql://140.134.26.83/sharebooks";

			// Database credentials
			private final String USER = "sharebooks";
			private final String PASS = "fcuspm";

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
	%>
	<%
		DB d = new DB();
		String uid = session.getAttribute("uid").toString();
		System.out.println(uid);
		String bid = request.getParameter("bid");
		String ownid = request.getParameter("owner_id");
		Boolean infomation = false;
		if (!uid.equals("fail")) {
			infomation = d.Lend(uid, bid, ownid);
		}
		if (infomation) {
			out.print("借閱成功!!" + "<br/>");
		} else {
			out.print("借閱失敗!!" + "<br/>");
		}
	%>
	<input type="button" name="goToIndexPage"
		onclick="javascript:location.href='index.jsp'" value="回首頁">
</body>
</html>