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
        try (Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT name FROM User WHERE username="+request.getParameter("username"))) {

            while (rs.next()) {
                String name = rs.getString("name");
                out.println("name: " + name);
            }
        }
    }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
    }
%>

</body>

</html>