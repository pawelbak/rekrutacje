<%@ page import="java.sql.*"%>
<html>

<head>
    <title>JDBC Connection example</title>
</head>

<body>
    <h1>JDBC Connection example</h1>

    <%
    String db = request.getParameter("db");
    String user = db; // assumes database name is the same as username
    try {
        java.sql.Connection con;
        Class.forName("org.gjt.mm.mysql.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, user, "xxxxxxx");
        out.println (db+ "database successfully opened.");
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
    }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
    }
%>

</body>

</html>