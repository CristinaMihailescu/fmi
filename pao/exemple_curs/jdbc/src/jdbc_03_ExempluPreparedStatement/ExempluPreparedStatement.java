package jdbc_03_ExempluPreparedStatement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class ExempluPreparedStatement
{
    public static void main(String[] args)
    {
        //Pasul 1: încărcarea driver-ului specific BD (opțional)
//        try
//        {
//            //Class.forName("org.apache.derby.jdbc.ClientDriver");
//            Class.forName("com.mysql.jdbc.Driver");
//        }
//        catch (ClassNotFoundException ex)
//        {
//            System.out.println("Driver-ul nu a fost gasit!");
//        }
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            //Pasul 2: conectarea la BD
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/angajatibd?useSSL=false" , "root" , "12345");
            //conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Angajati" , "radu" , "12345");
                        
            //Pasul 3: crearea unui obiect de tip PreparedStatement
            String qrySQL = "SELECT * FROM Angajati WHERE (Salariu >= ?) AND (Varsta <= ?)";
            pstmt = conn.prepareStatement(qrySQL);
            
            //Pasul 3: setarea valorilor parametrilor
            String aux = JOptionPane.showInputDialog(null, "Introduceti salariul minim:", "Salariul minim", JOptionPane.QUESTION_MESSAGE);
            double smin = Double.parseDouble(aux);
            
            aux = JOptionPane.showInputDialog(null, "Introduceti varsta maxima:", "Varsta maxima", JOptionPane.QUESTION_MESSAGE);
            int vmax = Integer.parseInt(aux);
            
            pstmt.setDouble(1, smin);
            pstmt.setInt(2, vmax);
            
            //Pasul 4: executarea interogării
            rs = pstmt.executeQuery();

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
                
                if(pstmt != null)
                    pstmt.close();
                
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
