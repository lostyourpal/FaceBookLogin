<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<html>
    <head>
    <h1 style="background-color: #ff3333">CHANGE MANUFACTURER DETAILS</h1>
    <body style="background-color: skyblue"><!-- comment -->
        <div id="Menu">
            <table align="left">
                <tr><a href="http://localhost:8080/WebApplication1/newjsp3.jsp">logout</a></td><!-- comment -->
                <td></td>><td></td></tr></table><br><br><br>
            <center><legend><b>CHANGE MANUFACTURER DETAILS</b></legend></center>
            <script language="JavaScript">
              fucntion hello(){
                  var x=f1.input.value;
                  location.reload("http://localhost:8080/WebApplication1/newjsp4.jsp");
              }
            </script><!-- comment -->
            <center>s
                <table>
                    <form name="f1" method="POST" action="http://localhost:8080/WebApplication1/NewServlet5">
                        <% int m=0;
                        String n=null,d=null,e=null,b=null,t=null;
                        %>
                        <br><tr><td> SELECT DEPARTMENT ID:</td>
                            <td>
                                <select name="input" width=30 onChange="hello()">
                                    <option value="">--SELECT DID--</option>
                                    <% Connection con=null;
                                    Statement stmt=null;
                                    ResultSet rs;
                                    try{
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost/dbs?autoReconnect=true&useSSL=false","root","godhelp");
                                        stmt=con.createStatement();
                                        rs=stmt.executeQuery("select did,manname from manager");
                                        while(rs.next()){
                                            int id=rs.getInt("did");
                                            String name=rs.getString("manname");
                                           %>
                                            <option value='<%=id%>'><%=name%></option>
                                                    
                                     <%   }
                                    
                                   %>
                                    
                                    
                                   
                                    </select></td><!-- comment -->
                                    <td><input type="submit" value="Update"></td>
                                    </tr><!-- comment -->
                                    <%
                                        String x=request.getParameter("input");
                                        if(x==null||x=="")
                                        m=0;
                                        else
                                       m=Integer.parseInt(x);
                                        rs=stmt.executeQuery("select * from manager where did="+m+"");
                                        while(rs.next()){
                                            m=rs.getInt(1);
                                            n=rs.getString(2);
                                            d=rs.getString(3);
                                            e=rs.getString(4);
                                            b=rs.getString(5);
                                        }
                                        rs.close();
                                        stmt.close();
                                        con.close();
                                        }
                                        catch(Exception ex){
                                        out.println("error:"+ex);
                                    }
                                        %>
                                        <tr>
                                            <td>department id:</td><td><input type="text" name="text1" value='<%=m%>'></td><!-- comment -->
                                        </tr><!-- comment -->
                                        <tr>
                                            <td>man id:</td><td><input type="text" name="text2" value='<%=n%>'></td>
                                        </tr>
                                        <tr>
                                            <td>mananger name:</td><td><input type="text" name="text3" value='<%=d%>'></td>
                                        </tr>
                                        <tr>
                                            <td>highest qual:</td><td><input type="text" name="text4" value='<%=e%>'></td>
                                        </tr>
                                        <tr>
                                            <td>institution:</td><td><input type="text" name="text5" value='<%=b%>'></td>
                                        </tr>
                    </form><!-- comment -->
                </table><!-- comment -->
            </fiedlset><!-- comment -->
            </center>
        </body><!-- comment -->
        </html><!-- comment -->