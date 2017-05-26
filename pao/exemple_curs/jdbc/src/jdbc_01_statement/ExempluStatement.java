package jdbc_01_statement;

import java.sql.*;

public class ExempluStatement
{
    public static void main(String[] args)
    {
        //Pasul 1: încărcarea driver-ului specific SGBD
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException ex)
        {
            System.out.println("Driver-ul nu a fost gasit!");
        }
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try
        {
            //Pasul 2: conectarea la BD
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/angajati" , "root" , "Parola12345");
                        
            //Pasul 3: crearea unui obiect de tip Statement
            stmt = conn.createStatement();
            
            //Pasul 4: executarea unei interogări de actualizare
//            String qrySQL = "INSERT INTO Angajati VALUES('123456789999','Albu Ioan',3210.10)";
//            String qrySQL = "UPDATE Angajati SET Salariu = 1.10*Salariu WHERE Salariu <= 33000";
//            String qrySQL = "DELETE FROM Angajati WHERE Nume LIKE 'Geo%'";
//            int n = stmt.executeUpdate(qrySQL);
//            System.out.println("Au fost modificate " + n + " inregistrari!");
            
            //Pasul 4: executarea unei interogări de selecție
            String qrySQL = "SELECT * FROM Angajati ORDER BY Salariu DESC";
            rs = stmt.executeQuery(qrySQL);

            //Pasul 5: procesarea rezultatelor
            while(rs.next())
                System.out.println(rs.getString("Nume") + " " + rs.getInt("Varsta") + " " + rs.getDouble("Salariu"));
        }
        catch (SQLException ex)
        {
            System.out.println("Eroare la conectarea la BD: " + ex);
        }
        finally
        {
            try
            {
                if(rs != null)
                    rs.close();
                
                if(stmt != null)
                    stmt.close();
                
                if(conn != null)
                    conn.close();
            }
            catch (SQLException ex)
            {
                System.out.println("Eroare la închiderea conexiunii cu BD!");
            }
        }
    }
}
