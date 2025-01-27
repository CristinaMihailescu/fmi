
import java.awt.Font;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTabbedPane;
import static javax.swing.SwingConstants.CENTER;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableColumnModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import javax.swing.table.TableModel;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Radu
 */
class Angajat
{

    String CNP;
    String Nume;
    int Varsta;
    double Salariu;

    public Angajat(String CNP, String Nume, int Varsta, double Salariu)
    {
        this.CNP = CNP;
        this.Nume = Nume;
        this.Varsta = Varsta;
        this.Salariu = Salariu;
    }

    public String getCNP()
    {
        return CNP;
    }

    public String getNume()
    {
        return Nume;
    }

    public int getVarsta()
    {
        return Varsta;
    }

    public double getSalariu()
    {
        return Salariu;
    }

    public String toString()
    {
        return Nume;
    }
}

public class Interfara_grafica_BD extends javax.swing.JFrame
{

    static Connection conn = null;

    public Interfara_grafica_BD ()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex)
        {
            System.out.println("Eroare la incarcarea driver-ului MySQL!");
        }

        try
        {
            conn = DriverManager.getConnection("jdbc:mysql://localhost/angajati", "root", "12345");

        } catch (SQLException ex)
        {
            System.out.println("Eroare la conectarea la baza de date!");
        }

        initComponents();

        //TabelDate.getTableHeader().setFont(new Font("Arial", Font.BOLD, 12));
        //((DefaultTableCellRenderer) TabelDate.getTableHeader().getDefaultRenderer()).setHorizontalAlignment(JLabel.CENTER);
        //TabelDate.getTableHeader().repaint();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        TabelDate = new javax.swing.JTable();
        filler8 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        AfisareDate = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        filler9 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jPanel2 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        filler2 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jButton1 = new javax.swing.JButton();
        filler3 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jScrollPane2 = new javax.swing.JScrollPane();
        ListaAngajati = new javax.swing.JList();
        jPanel4 = new javax.swing.JPanel();
        filler4 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jLabel2 = new javax.swing.JLabel();
        CNP = new javax.swing.JLabel();
        filler5 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jLabel4 = new javax.swing.JLabel();
        Nume = new javax.swing.JTextField();
        filler6 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jLabel5 = new javax.swing.JLabel();
        Varsta = new javax.swing.JTextField();
        filler7 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10), new java.awt.Dimension(0, 10));
        jLabel6 = new javax.swing.JLabel();
        Salariu = new javax.swing.JTextField();
        filler1 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15));
        SalvareDate = new javax.swing.JButton();
        jPanel5 = new javax.swing.JPanel();
        filler10 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15));
        jLabel3 = new javax.swing.JLabel();
        CNPNou = new javax.swing.JTextField();
        filler11 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15));
        jLabel7 = new javax.swing.JLabel();
        NumeNou = new javax.swing.JTextField();
        filler12 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15));
        jLabel8 = new javax.swing.JLabel();
        VarstaNoua = new javax.swing.JTextField();
        filler13 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15));
        jLabel9 = new javax.swing.JLabel();
        SalariuNou = new javax.swing.JTextField();
        filler14 = new javax.swing.Box.Filler(new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15), new java.awt.Dimension(0, 15));
        IntroducereDate = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Evidență angajați");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });
        getContentPane().setLayout(new javax.swing.BoxLayout(getContentPane(), javax.swing.BoxLayout.LINE_AXIS));

        jTabbedPane1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jTabbedPane1.addChangeListener(new javax.swing.event.ChangeListener() {
            public void stateChanged(javax.swing.event.ChangeEvent evt) {
                jTabbedPane1StateChanged(evt);
            }
        });

        jPanel1.setLayout(new javax.swing.BoxLayout(jPanel1, javax.swing.BoxLayout.Y_AXIS));

        TabelDate.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "CNP", "Nume", "Vârsta", "Salariu"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Double.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(TabelDate);

        jPanel1.add(jScrollPane1);
        jPanel1.add(filler8);

        AfisareDate.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        AfisareDate.setText("Afisare angajati");
        AfisareDate.setAlignmentX(0.5F);
        AfisareDate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AfisareDateActionPerformed(evt);
            }
        });
        jPanel1.add(AfisareDate);

        jButton2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jButton2.setText("Raport");
        jButton2.setAlignmentX(0.5F);
        jButton2.setMaximumSize(new java.awt.Dimension(129, 23));
        jButton2.setMinimumSize(new java.awt.Dimension(129, 23));
        jButton2.setPreferredSize(new java.awt.Dimension(129, 23));
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2);
        jPanel1.add(filler9);

        jTabbedPane1.addTab("Afisare angajati", jPanel1);

        jPanel2.setMaximumSize(new java.awt.Dimension(400, 300));
        jPanel2.setMinimumSize(new java.awt.Dimension(400, 300));
        jPanel2.setPreferredSize(new java.awt.Dimension(400, 300));
        jPanel2.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jPanel2FocusGained(evt);
            }
        });
        jPanel2.setLayout(new javax.swing.BoxLayout(jPanel2, javax.swing.BoxLayout.X_AXIS));

        jPanel3.setMaximumSize(new java.awt.Dimension(200, 300));
        jPanel3.setMinimumSize(new java.awt.Dimension(200, 300));
        jPanel3.setPreferredSize(new java.awt.Dimension(200, 300));
        jPanel3.setLayout(new javax.swing.BoxLayout(jPanel3, javax.swing.BoxLayout.Y_AXIS));

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel1.setText("Angajați:");
        jLabel1.setAlignmentX(0.5F);
        jPanel3.add(jLabel1);
        jPanel3.add(filler2);

        jButton1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jButton1.setText("Ștergere angajat");
        jButton1.setAlignmentX(0.5F);
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });
        jPanel3.add(jButton1);
        jPanel3.add(filler3);

        ListaAngajati.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                ListaAngajatiMouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(ListaAngajati);

        jPanel3.add(jScrollPane2);

        jPanel2.add(jPanel3);

        jPanel4.setMaximumSize(new java.awt.Dimension(200, 300));
        jPanel4.setMinimumSize(new java.awt.Dimension(200, 300));
        jPanel4.setPreferredSize(new java.awt.Dimension(200, 300));
        jPanel4.setLayout(new javax.swing.BoxLayout(jPanel4, javax.swing.BoxLayout.Y_AXIS));
        jPanel4.add(filler4);

        jLabel2.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel2.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel2.setText("CNP");
        jLabel2.setAlignmentX(0.5F);
        jLabel2.setMaximumSize(new java.awt.Dimension(150, 20));
        jLabel2.setMinimumSize(new java.awt.Dimension(150, 20));
        jLabel2.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(jLabel2);

        CNP.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        CNP.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        CNP.setAlignmentX(0.5F);
        CNP.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        CNP.setMaximumSize(new java.awt.Dimension(150, 20));
        CNP.setMinimumSize(new java.awt.Dimension(150, 20));
        CNP.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(CNP);
        jPanel4.add(filler5);

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel4.setText("Nume");
        jLabel4.setAlignmentX(0.5F);
        jLabel4.setMaximumSize(new java.awt.Dimension(150, 20));
        jLabel4.setMinimumSize(new java.awt.Dimension(150, 20));
        jLabel4.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(jLabel4);

        Nume.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        Nume.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        Nume.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        Nume.setMaximumSize(new java.awt.Dimension(150, 20));
        Nume.setMinimumSize(new java.awt.Dimension(150, 20));
        Nume.setPreferredSize(new java.awt.Dimension(150, 20));
        Nume.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                NumeActionPerformed(evt);
            }
        });
        jPanel4.add(Nume);
        jPanel4.add(filler6);

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel5.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel5.setText("Vârsta");
        jLabel5.setAlignmentX(0.5F);
        jLabel5.setMaximumSize(new java.awt.Dimension(150, 20));
        jLabel5.setMinimumSize(new java.awt.Dimension(150, 20));
        jLabel5.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(jLabel5);

        Varsta.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        Varsta.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        Varsta.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        Varsta.setMaximumSize(new java.awt.Dimension(150, 20));
        Varsta.setMinimumSize(new java.awt.Dimension(150, 20));
        Varsta.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(Varsta);
        jPanel4.add(filler7);

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel6.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel6.setText("Salariu");
        jLabel6.setAlignmentX(0.5F);
        jLabel6.setMaximumSize(new java.awt.Dimension(150, 20));
        jLabel6.setMinimumSize(new java.awt.Dimension(150, 20));
        jLabel6.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(jLabel6);

        Salariu.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        Salariu.setHorizontalAlignment(javax.swing.JTextField.CENTER);
        Salariu.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        Salariu.setMaximumSize(new java.awt.Dimension(150, 20));
        Salariu.setMinimumSize(new java.awt.Dimension(150, 20));
        Salariu.setPreferredSize(new java.awt.Dimension(150, 20));
        jPanel4.add(Salariu);
        jPanel4.add(filler1);

        SalvareDate.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        SalvareDate.setText("Salvare date");
        SalvareDate.setAlignmentX(0.5F);
        SalvareDate.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                SalvareDateMouseClicked(evt);
            }
        });
        jPanel4.add(SalvareDate);

        jPanel2.add(jPanel4);

        jTabbedPane1.addTab("Editare angajati", jPanel2);

        jPanel5.setLayout(new javax.swing.BoxLayout(jPanel5, javax.swing.BoxLayout.Y_AXIS));
        jPanel5.add(filler10);

        jLabel3.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel3.setText("CNP");
        jLabel3.setAlignmentX(0.5F);
        jLabel3.setMaximumSize(new java.awt.Dimension(200, 20));
        jLabel3.setMinimumSize(new java.awt.Dimension(200, 20));
        jLabel3.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(jLabel3);

        CNPNou.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        CNPNou.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        CNPNou.setMaximumSize(new java.awt.Dimension(200, 20));
        CNPNou.setMinimumSize(new java.awt.Dimension(200, 20));
        CNPNou.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(CNPNou);
        jPanel5.add(filler11);

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel7.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel7.setText("Nume");
        jLabel7.setAlignmentX(0.5F);
        jLabel7.setMaximumSize(new java.awt.Dimension(200, 20));
        jLabel7.setMinimumSize(new java.awt.Dimension(200, 20));
        jLabel7.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(jLabel7);

        NumeNou.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        NumeNou.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        NumeNou.setMaximumSize(new java.awt.Dimension(200, 20));
        NumeNou.setMinimumSize(new java.awt.Dimension(200, 20));
        NumeNou.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(NumeNou);
        jPanel5.add(filler12);

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel8.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel8.setText("Varsta");
        jLabel8.setAlignmentX(0.5F);
        jLabel8.setMaximumSize(new java.awt.Dimension(200, 20));
        jLabel8.setMinimumSize(new java.awt.Dimension(200, 20));
        jLabel8.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(jLabel8);

        VarstaNoua.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        VarstaNoua.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        VarstaNoua.setMaximumSize(new java.awt.Dimension(200, 20));
        VarstaNoua.setMinimumSize(new java.awt.Dimension(200, 20));
        VarstaNoua.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(VarstaNoua);
        jPanel5.add(filler13);

        jLabel9.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jLabel9.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel9.setText("Salariu");
        jLabel9.setAlignmentX(0.5F);
        jLabel9.setMaximumSize(new java.awt.Dimension(200, 20));
        jLabel9.setMinimumSize(new java.awt.Dimension(200, 20));
        jLabel9.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(jLabel9);

        SalariuNou.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        SalariuNou.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        SalariuNou.setMaximumSize(new java.awt.Dimension(200, 20));
        SalariuNou.setMinimumSize(new java.awt.Dimension(200, 20));
        SalariuNou.setPreferredSize(new java.awt.Dimension(200, 20));
        jPanel5.add(SalariuNou);
        jPanel5.add(filler14);

        IntroducereDate.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        IntroducereDate.setText("Salvare date");
        IntroducereDate.setAlignmentX(0.5F);
        IntroducereDate.setMaximumSize(new java.awt.Dimension(200, 40));
        IntroducereDate.setMinimumSize(new java.awt.Dimension(200, 40));
        IntroducereDate.setPreferredSize(new java.awt.Dimension(200, 40));
        IntroducereDate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                IntroducereDateActionPerformed(evt);
            }
        });
        jPanel5.add(IntroducereDate);

        jTabbedPane1.addTab("Introducere angajat nou", jPanel5);

        getContentPane().add(jTabbedPane1);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void AfisareDateActionPerformed(java.awt.event.ActionEvent evt)//GEN-FIRST:event_AfisareDateActionPerformed
    {//GEN-HEADEREND:event_AfisareDateActionPerformed
        Statement stmt = null;
        ResultSet rs = null;

        try
        {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM date");
            
            DefaultTableModel tm = (DefaultTableModel) TabelDate.getModel();
            
            //stergem toate liniile actuale din JTable
            while (tm.getRowCount() > 0)
                tm.removeRow(0);

            //determinam numarul de coloane
            int nr_col = rs.getMetaData().getColumnCount();

            while (rs.next())
            {
                Object[] objects = new Object[nr_col];
                for (int i = 0; i < nr_col; i++)
                    objects[i] = rs.getObject(i + 1);
                tm.addRow(objects);
            }

            rs.close();

        } catch (SQLException ex)
        {
            System.out.println("Eroare la executarea interogarii!");
        }
    }//GEN-LAST:event_AfisareDateActionPerformed

    private void formWindowClosed(java.awt.event.WindowEvent evt)//GEN-FIRST:event_formWindowClosed
    {//GEN-HEADEREND:event_formWindowClosed
        try
        {
            conn.close();
        } catch (SQLException ex)
        {
            Logger.getLogger(Interfara_grafica_BD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_formWindowClosed

    private void jPanel2FocusGained(java.awt.event.FocusEvent evt)//GEN-FIRST:event_jPanel2FocusGained
    {//GEN-HEADEREND:event_jPanel2FocusGained
    }//GEN-LAST:event_jPanel2FocusGained

    private void jTabbedPane1StateChanged(javax.swing.event.ChangeEvent evt)//GEN-FIRST:event_jTabbedPane1StateChanged
    {//GEN-HEADEREND:event_jTabbedPane1StateChanged
        if (((JTabbedPane) evt.getSource()).getSelectedIndex() == 1)
        {
            Statement stmt = null;
            ResultSet rs = null;

            try
            {
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM date");

                DefaultListModel lm = new DefaultListModel();

                while (rs.next())
                    lm.addElement(new Angajat(rs.getString("CNP"), rs.getString("Nume"), rs.getInt("Varsta"), rs.getDouble("Salariu")));

                ListaAngajati.setModel(lm);

                rs.close();

                ListaAngajati.setSelectedIndex(0);
                ListaAngajatiMouseClicked(null);

            } catch (SQLException ex)
            {
                System.out.println("Eroare la executarea interogarii!");
            }
        }
    }//GEN-LAST:event_jTabbedPane1StateChanged

    private void ListaAngajatiMouseClicked(java.awt.event.MouseEvent evt)//GEN-FIRST:event_ListaAngajatiMouseClicked
    {//GEN-HEADEREND:event_ListaAngajatiMouseClicked
        Angajat t = (Angajat) ListaAngajati.getSelectedValue();

        if (t != null)
        {
            CNP.setText(t.getCNP());
            Nume.setText(t.getNume());
            Varsta.setText(t.getVarsta() + "");
            Salariu.setText(t.getSalariu() + "");
        }
    }//GEN-LAST:event_ListaAngajatiMouseClicked

    private void NumeActionPerformed(java.awt.event.ActionEvent evt)//GEN-FIRST:event_NumeActionPerformed
    {//GEN-HEADEREND:event_NumeActionPerformed
    }//GEN-LAST:event_NumeActionPerformed

    private void SalvareDateMouseClicked(java.awt.event.MouseEvent evt)//GEN-FIRST:event_SalvareDateMouseClicked
    {//GEN-HEADEREND:event_SalvareDateMouseClicked
        try
        {
            //Statement stmt = null;
            ResultSet rs = null;
            PreparedStatement pstmt = null;

            String qryActualizare;
            qryActualizare = 
     "UPDATE date SET nume = ? , Varsta =  ? , "
                    + "Salariu = ? WHERE CNP = ?";

            pstmt = conn.prepareStatement(qryActualizare);

            pstmt.setString(1 , Nume.getText());
            pstmt.setInt(2 , Integer.parseInt(Varsta.getText()));
            pstmt.setDouble(3 , Double.parseDouble(Salariu.getText()));
            pstmt.setString(4 , CNP.getText());

            pstmt.executeUpdate();
            
            //jTabbedPane1StateChanged(null);
        } 
        catch (SQLException ex)
        {
            System.out.println("Eroare la executarea interogarii!");
        }
    }//GEN-LAST:event_SalvareDateMouseClicked

    private void jButton1MouseClicked(java.awt.event.MouseEvent evt)//GEN-FIRST:event_jButton1MouseClicked
    {//GEN-HEADEREND:event_jButton1MouseClicked
        try
        {
            Statement stmt = null;
            ResultSet rs = null;
            PreparedStatement pstmt = null;

            String qryActualizare;
            qryActualizare = "DELETE FROM date WHERE CNP = ?";

            pstmt = conn.prepareStatement(qryActualizare);
          
            pstmt.setString(1 , CNP.getText());

            pstmt.executeUpdate();
            
            //jTabbedPane1StateChanged(null);
        } 
        catch (SQLException ex)
        {
            System.out.println("Eroare la executarea interogarii!");
        }
    }//GEN-LAST:event_jButton1MouseClicked

    private void IntroducereDateActionPerformed(java.awt.event.ActionEvent evt)//GEN-FIRST:event_IntroducereDateActionPerformed
    {//GEN-HEADEREND:event_IntroducereDateActionPerformed
        try
        {
            //Statement stmt = null;
            ResultSet rs = null;
            PreparedStatement pstmt = null;

            String qryInserare;
            qryInserare = "INSERT "
                    + "INTO date"
                    + "(CNP,Nume,Varsta,Salariu)"
                    + " VALUES(? , ? , ? , ?)";

            pstmt = conn.prepareStatement(qryInserare);

            pstmt.setString(1 , CNPNou.getText());
            pstmt.setString(2 , NumeNou.getText());
            pstmt.setInt(3 , Integer.parseInt(VarstaNoua.getText()));
            pstmt.setDouble(4 , Double.parseDouble(SalariuNou.getText()));
            
            pstmt.executeUpdate();
            
            //jTabbedPane1StateChanged(null);
        } 
        catch (SQLException ex)
        {
            System.out.println("Eroare la executarea interogarii!");
        }
    }//GEN-LAST:event_IntroducereDateActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
       try{        
        
        JasperReport  raport=JasperCompileManager.compileReport("Raport.jrxml");
        JasperPrint print=JasperFillManager.fillReport(raport, null, conn);
        JasperExportManager.exportReportToPdfFile(print,"test.pdf");
        
        JasperViewer.viewReport(print);
        
       }catch(Exception e)
       {
       }
       
    }//GEN-LAST:event_jButton2ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[])
    {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try
        {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels())
                if ("Nimbus".equals(info.getName()))
                {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
        } catch (ClassNotFoundException ex)
        {
            java.util.logging.Logger.getLogger(Interfara_grafica_BD.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex)
        {
            java.util.logging.Logger.getLogger(Interfara_grafica_BD.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex)
        {
            java.util.logging.Logger.getLogger(Interfara_grafica_BD.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex)
        {
            java.util.logging.Logger.getLogger(Interfara_grafica_BD.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable()
        {
            public void run()
            {
                new Interfara_grafica_BD().setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton AfisareDate;
    private javax.swing.JLabel CNP;
    private javax.swing.JTextField CNPNou;
    private javax.swing.JButton IntroducereDate;
    private javax.swing.JList ListaAngajati;
    private javax.swing.JTextField Nume;
    private javax.swing.JTextField NumeNou;
    private javax.swing.JTextField Salariu;
    private javax.swing.JTextField SalariuNou;
    private javax.swing.JButton SalvareDate;
    private javax.swing.JTable TabelDate;
    private javax.swing.JTextField Varsta;
    private javax.swing.JTextField VarstaNoua;
    private javax.swing.Box.Filler filler1;
    private javax.swing.Box.Filler filler10;
    private javax.swing.Box.Filler filler11;
    private javax.swing.Box.Filler filler12;
    private javax.swing.Box.Filler filler13;
    private javax.swing.Box.Filler filler14;
    private javax.swing.Box.Filler filler2;
    private javax.swing.Box.Filler filler3;
    private javax.swing.Box.Filler filler4;
    private javax.swing.Box.Filler filler5;
    private javax.swing.Box.Filler filler6;
    private javax.swing.Box.Filler filler7;
    private javax.swing.Box.Filler filler8;
    private javax.swing.Box.Filler filler9;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTabbedPane jTabbedPane1;
    // End of variables declaration//GEN-END:variables
}
