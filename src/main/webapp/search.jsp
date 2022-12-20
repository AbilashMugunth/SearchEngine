<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="accio.SearchResult"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class = "searchEngine">
        <div class = "historyButton">
                <form action = "History">
                    <button type = "submit">History </button>
                </form>
        </div>
        <div class= "logo">
             <h1>Search Engine</h1>
        </div>

        <div class = "searchFormResult">
            <form action = "Search">
                <input type = "text" name = "keyword">
                <button type = "submit"> Search </button>
            </form>
        </div>
    </div>
    <div class = "resultTable">
        <table border = 2>
            <tr>
                <td>Name</td>
                <td>Link</td>
            </tr>
            <%
                ArrayList<SearchResult> results = (ArrayList<SearchResult>)request.getAttribute("results");
                for(SearchResult result: results){
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