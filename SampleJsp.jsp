<%@ page import="java.sql.*"%>
<html>

<head>
    <title>JDBC Connection example</title>
</head>

<body>
    <h1>JDBC Connection example</h1>

<%
    String db = request.getParameter("db");
    String dbUser = request.getParameter("dbUser"); // db username
    String dbPassword = request.getParameter("dbPassword"); // db username
    try {
        java.sql.Connection con;
        Class.forName("org.gjt.mm.mysql.Driver");
        // get connection
        con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, dbUser, dbPassword);
        out.println (db+ "database successfully opened.");
        //read action flow
        if(request.getParameter("action")=="read") {
            try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT email FROM User WHERE username="+request.getParameter("username"))) {

                while (rs.next()) {
                    String email = rs.getString("email");
                    out.println("username:"+request.getParameter("username")+" email: " + email);
                }
            }
        } else if(request.getParameter("action")=="update") {
            try {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeUpdate("UPDATE User SET email = "+request.getParameter("email")+" WHERE username="+request.getParameter("username"));
            }
            out.println("email updated");
        }
        // else if(request.getParameter("action")=="update") {
        //    try {
        //        Statement stmt = conn.createStatement();
        //        ResultSet rs = stmt.executeUpdate("UPDATE User SET email = "+request.getParameter("email")+" WHERE username="+request.getParameter("username"));
        //    }
        //    out.println("email updated");
        // }
    }
    catch(SQLException e) {
        e.printStackTrace();
        out.println("SQLException caught: " +e.getMessage());
    }
%>

</body>

</html>