package jdbc_02_statement_try_resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ExempluStatementTryResources
{
    public static void main(String[] args)
    {
        //Pasul 1: încărcarea driver-ului specific BD (opțional)
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        }
        catch (ClassNotFoundException ex)
        {
            System.out.println("Driver-ul nu a fost gasit!");
        }
        
        String qrySQL = "SELECT * FROM Angajati";
        try(
            //Pasul 2: conectarea la BD
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Angajati" , "radu" , "12345");
            //Pasul 3: crearea unui obiect de tip Statement
            Statement stmt = conn.createStatement();     
            //Pasul 4: executarea unei interogări
            ResultSet rs = stmt.executeQuery(qrySQL);
            )
        {
                //Pasul 5: procesarea rezultatelor
                while(rs.next())
                    System.out.println(rs.getString("CNP") + " " + rs.getString("Nume") + " " + rs.getDouble("Salariu"));
        }
        catch (SQLException ex)
        {
            System.out.println("Eroare la conectarea/interogarea BD!");
        }
    }
}
