<%@page language="java"%>
<%@page import ="java.lang.*,java.sql.*,java.io.*,java.util.*" %>
<%
  Connection con=null;
  Statement stmt=null;
  ResultSet rs=null;
          try{
              Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	      con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","root");

              stmt =con.createStatement();
             String unm = request.getParameter("uname");
             String pwd = request.getParameter("pwd");
             String str="select * from register where name='"+unm+"' and pwd='"+pwd+"'";
     rs=stmt.executeQuery(str);
      if(rs.next())
       out.println("User Login is valid");
    else
       out.println("no such User");
rs.close();
stmt.close();
}
          catch(Exception e)
                  {
                    out.println(e);
                    }
%>
