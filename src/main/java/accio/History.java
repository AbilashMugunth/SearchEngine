package accio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;


@WebServlet("/History")
public class History extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<HistoryResult> results = new ArrayList<HistoryResult>();
        try{
            Connection connection = DatabaseConnection.getConnection();
            ResultSet resultSet = connection.createStatement().executeQuery("select * from history;");
            while (resultSet.next()){
                HistoryResult historyResult = new HistoryResult();
                historyResult.setName(resultSet.getString("name"));
                historyResult.setLink(resultSet.getString("link"));
                results.add(historyResult);
            }
        }catch (SQLException sqlException){
            System.out.println(sqlException);
        }
        Collections.reverse(results);
        request.setAttribute("results", results);
        request.getRequestDispatcher("/history.jsp").forward(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h3>Hello World!</h3>");
    }
}