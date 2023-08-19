<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(Exception e){
		out.println("fail"+e.toString()+"<p>");
	}
	String dbUser="SCOTT";
	String dbPasswd="tiger";
	String dbURL="jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection conn=null;
	try{
		conn=DriverManager.getConnection(dbURL,dbUser,dbPasswd);
		out.println("connected");
	}
	catch(Exception e){
		out.println("fail"+e.toString()+"<p>");	
	}
	String sql;
	int numRowsAffected;
	Statement stmt = conn.createStatement();
	ResultSet rs;
	//===================================================
	//insert
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String city=request.getParameter("city");
	String mobile=request.getParameter("mobile");
	String stream=request.getParameter("stream");
	String semester=request.getParameter("semester");
	String po_year=request.getParameter("po_year");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String repassword=request.getParameter("re-password");
	if(password.equals(repassword)){
	try {
	//sql = "insert into emp_regis values (email,pass)";
	PreparedStatement ps=conn.prepareStatement("insert into stuinfo values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,fname);
	ps.setString(2,lname);
	ps.setString(3,city);
	ps.setString(4,mobile);
	ps.setString(5,stream);
	ps.setString(6,semester);
	ps.setString(7,po_year);
	ps.setString(8,email);
	ps.setString(9,password);
	numRowsAffected = ps.executeUpdate();
	out.println("<BR>"+ numRowsAffected + " SignUp Successful.. <BR>");
	}
	catch (SQLException e)
	{
	out.println("Error encountered during row insertion for employee: " +
	e.toString()+ "<BR>");
	}
	}
	else
	out.println("Password and confirm password do not match ");
	sql = "select * from stuinfo";
	rs = stmt.executeQuery(sql);
	out.println("<p>");
	while (rs.next())
	{
	out.println("FName = " + rs.getString("fname") + ", Lname = " +rs.getString("lname") +" City = " +rs.getString("city")+" semester = " +rs.getString("semester")+" Stream = " +rs.getString("stream")+" PO_year = " +rs.getString("po_year")+" Email= "+rs.getString("email")+" Password= "+rs.getString("password")+ "<BR>");
	}
	out.println("</P>");
conn.close();
%>

</body>
</html>