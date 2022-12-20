<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="accio.HistoryResult"%>
<html>
 <head>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class = "homeButton">
        <form action = "https://priyanshsearchengine.herokuapp.com/">
        <button type = "submit">Back to home page </button>
        </form>
    </div>
    <div class= "logo">
         <h1>Search Engine</h1>
    </div>

    <div class = "resultTable">
        <table border = 2>
            <tr>
                <td>Name</td>
                <td>Link</td>
            </tr>
            <%
                ArrayList<HistoryResult> results = (ArrayList<HistoryResult>)request.getAttribute("results");
                for(HistoryResult result: results){
            %>
                    <tr>
                        <td><%out.println(result.getName());%></td>
                        <td><a href = "<%out.println(result.getLink());%>"><%out.println(result.getLink());%></a></td>
                    </tr>
            <%
                }
            %>
        </table>
    </div>

</body>
</html>