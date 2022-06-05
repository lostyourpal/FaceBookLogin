<%-- 
    Document   : newjsp
    Created on : 11 Mar, 2022, 1:41:25 PM
    Author     : 1000096059
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
   
       
    <body>
<form method="POST"  action="http://localhost:8080/WebApplication1/newjsp.jsp" >
            <table width="500" align="center">
                <tr>
                    <td align="center">
                        <fieldset>
                            <legend><font color="black">SEARCH employee details....</font></legend>
                            <center><b><h1>search manufacturer details</h1></b></center>
                            <b>select employee:</b>
                            <select id="id"><option value="">Select employee details</option><!-- comment -->
                                <%
                                    Connection con;
                                    Statement stmt;
                                    ResultSet rs=null;
                                    try{
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                      con=DriverManager.getConnection("jdbc:mysql://localhost/dbs?autoReconnect=true&useSSL=false","root","godhelp");
                                        stmt=con.createStatement();
                                        rs=stmt.executeQuery("select id from emp");
                                        while(rs.next())
                                        {
                                           int id1=rs.getInt(1);
                                           
                                         %> 
                                        
                                    <option value='<%=id1%>'><%=id1%>
                                            <%
                                                
                                                }
}

catch(Exception e)
{
out.println(e);
}
rs.close();
%>
                                            
                </tr>
            </table>
            
    
    <body>
        <h1>Hello World!</h1>
    </body>
</html>