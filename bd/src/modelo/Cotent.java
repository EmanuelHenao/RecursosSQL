package modelo;

import bd.conecBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import static modelo.Interfaz.jDesktopPane1;

public class Cotent extends javax.swing.JInternalFrame {

    conecBD con = new conecBD();

    public Cotent() {
        initComponents();
        con.connectar();

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setClosable(true);
        setMinimumSize(new java.awt.Dimension(523, 358));

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(new java.awt.Color(0, 0, 255), new java.awt.Color(0, 0, 204)), "Consultas", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Decker", 0, 24))); // NOI18N
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jButton1.setBackground(new java.awt.Color(255, 102, 51));
        jButton1.setFont(new java.awt.Font("Decker", 0, 18)); // NOI18N
        jButton1.setText("Uno");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(80, 90, 100, 50));

        jButton2.setBackground(new java.awt.Color(255, 102, 51));
        jButton2.setFont(new java.awt.Font("Decker", 0, 18)); // NOI18N
        jButton2.setText("Dos A");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(190, 90, 100, 50));

        jButton3.setBackground(new java.awt.Color(255, 102, 51));
        jButton3.setFont(new java.awt.Font("Decker", 0, 18)); // NOI18N
        jButton3.setText("Dos B");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 90, 90, 50));

        jButton4.setBackground(new java.awt.Color(255, 102, 51));
        jButton4.setFont(new java.awt.Font("Decker", 0, 18)); // NOI18N
        jButton4.setText("Tres");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton4, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 150, 90, 50));

        jButton5.setBackground(new java.awt.Color(255, 102, 51));
        jButton5.setFont(new java.awt.Font("Decker", 0, 18)); // NOI18N
        jButton5.setText("Quinto");
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton5, new org.netbeans.lib.awtextra.AbsoluteConstraints(250, 150, 90, 50));

        jLabel1.setFont(new java.awt.Font("Decker", 1, 14)); // NOI18N
        jLabel1.setText("** No logre realizar el punto 4**");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 270, -1, -1));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 507, javax.swing.GroupLayout.PREFERRED_SIZE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 325, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        //dos B
        DefaultTableModel modelo;
        Object[][] datosC = {};
        String[] columNamesC = {"Nombre", "Precio"};
        modelo = new DefaultTableModel(datosC, columNamesC);
        Connection r = con.getconexion();

        try {
            String sql = "call ejercicio6.dosB()";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                String[] te = {
                    respuesta.getString("nombre"),
                    String.valueOf(respuesta.getInt("precio"))
                };
                modelo.addRow(te);
            }

        } catch (SQLException e) {
        }

        jDesktopPane1.removeAll();
        jDesktopPane1.repaint();
        Consultar a = new Consultar(modelo, "Dos B");
        jDesktopPane1.add(a);
        a.show();


    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
//tres
        DefaultTableModel modelo;
        Object[][] datosC = {};
        String[] columNamesC = {"Nombre", "PromedioArticulos"};
        modelo = new DefaultTableModel(datosC, columNamesC);
        Connection r = con.getconexion();

        try {
            String sql = "call ejercicio6.tres()";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                String[] te = {
                    respuesta.getString("nombre"),
                    String.valueOf(respuesta.getInt("PromedioArticulos"))
                };
                modelo.addRow(te);
            }

        } catch (SQLException e) {
        }

        jDesktopPane1.removeAll();
        jDesktopPane1.repaint();
        Consultar a = new Consultar(modelo, "Tres");
        jDesktopPane1.add(a);
        a.show();

    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        //uno
        DefaultTableModel modelo;
        Object[][] datosC = {};
        String[] columNamesC = {"Promedio"};
        modelo = new DefaultTableModel(datosC, columNamesC);
        Connection r = con.getconexion();

        try {
            String sql = "call ejercicio6.uno()";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                String[] te = {
                    respuesta.getString("promedio")
                };
                modelo.addRow(te);
            }

        } catch (SQLException e) {
        }

        jDesktopPane1.removeAll();
        jDesktopPane1.repaint();
        Consultar a = new Consultar(modelo, "Uno");
        jDesktopPane1.add(a);
        a.show();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
//dos a
        DefaultTableModel modelo;
        Object[][] datosC = {};
        String[] columNamesC = {"Nombre", "Precio"};
        modelo = new DefaultTableModel(datosC, columNamesC);
        Connection r = con.getconexion();

        try {
            String sql = "call ejercicio6.dosA()";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                String[] te = {
                    respuesta.getString("nombre"),
                    String.valueOf(respuesta.getInt("precio"))
                };
                modelo.addRow(te);
            }

        } catch (SQLException e) {
        }

        jDesktopPane1.removeAll();
        jDesktopPane1.repaint();
        Consultar a = new Consultar(modelo, "Dos A");
        jDesktopPane1.add(a);
        a.show();

    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
//quinto

        DefaultTableModel modelo;
        Object[][] datosC = {};
        String[] columNamesC = {"Codigo", "Nombre", "Precio"};
        modelo = new DefaultTableModel(datosC, columNamesC);
        Connection r = con.getconexion();
        lk();
        try {
            String sql = "call ejercicio6.show5()";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                String[] te = {
                    respuesta.getString("codigo"),
                    respuesta.getString("nombre"),
                    String.valueOf(respuesta.getInt("precio"))
                };
                modelo.addRow(te);
            }

        } catch (SQLException e) {
        }

        jDesktopPane1.removeAll();
        jDesktopPane1.repaint();
        Consultar a = new Consultar(modelo, "Cinco");
        jDesktopPane1.add(a);
        a.show();

    }//GEN-LAST:event_jButton5ActionPerformed
    private void lk() {
        try {
            Connection r = con.getconexion();
            String sql = "call ejercicio6.quinto()";
            PreparedStatement p;
            p = r.prepareStatement(sql);
            p.execute();
            JOptionPane.showMessageDialog(null, "se ha echo el descuento", "Dato", JOptionPane.INFORMATION_MESSAGE);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "no se pudo GUARDAR" + e.getMessage(), "ERROR: guardar", JOptionPane.INFORMATION_MESSAGE);
        }
        con.desconectar();
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
