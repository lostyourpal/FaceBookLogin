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
<html>80
   
       
    <body>
<form method="get"  action="http://localhost:8080//WebApplication1//newjsp1.jsp" >
            <table width="500" align="center">
                <tr>
                    <td align="center">
                        <fieldset>
                            <legend><font color="black">SEARCH employee details....</font></legend>
                            <center><b><h1>search manufacturer details</h1></b></center>
                            <b>select employee:</b>
                            <select name="id"><option value="">Select employee details</option><!-- comment -->
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


%>
                            </select>
                                    <input type='submit' value="search">

  <%  int x=0;
    String n=request.getParameter("id");
    if(n==null||n.equals(""))
    x=0;
    else
    x=Integer.parseInt(n);
    rs=stmt.executeQuery("select * from emp where id="+x);
       
    %>
 <table>
 <tr>
         <td>
         name</td>
         <td> salary</td>
                 
 </tr>     
                    <%    while(rs.next())
                        {
                            
                        %>
                        <tr>
                            
                       
                            <td>      <%  out.println(rs.getString(1));%> </td>
                             <td>      <%  out.println(rs.getString(2));%> </td>
                          <%  }
                          
                            %>
                           
                            </tr>
                      <%  
                          }
    

catch(Exception e)
{
out.println("error"+e);
}
    %>
               
            </table>



                                            
             
            
    
    </body>
    
</html>