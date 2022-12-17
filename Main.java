import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class Main {

    public static void main(String args[]) throws SQLException, IOException, ClassNotFoundException {

        //Group 1/7 – The product p1 is deleted from Product and Stock.



        // Load the MySQL driver
        Class.forName("org.postgresql.Driver");


        //Establishing connection
        /*
        parameter 1 = local postgres server connection url
        parameter 2 = user
        parameter 3 = password
        * */

        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CS623", "postgres", "123");


        // For atomicity
        conn.setAutoCommit(false);

        // For  Isolation
        conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

        Statement statement = null;
        try {

            statement = conn.createStatement();


            System.out.println("\nDeleting p1 from Product table");
            statement.executeUpdate("DELETE FROM Product WHERE prodid = 'p1'");
            System.out.println("\nDeleted p1 from Product table and Stock table");

            


        } catch (SQLException err) {
            System.out.println("Error: "+err);
            err.printStackTrace();
            // For atomicity
            conn.rollback();
            statement.close();
            conn.close();
            return;
        } // main

        conn.commit();
        statement.close();
        conn.close();
        System.out.println("\n-----finished-----");
    }
}