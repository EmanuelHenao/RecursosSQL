package modelo;

import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import bd.conecBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consultar extends javax.swing.JInternalFrame {

    private Object[][] datosC = {};
    private String[] columNamesC = {"Codigo", "Denomionacion"};
    private DefaultTableModel modelo;
    conecBD con = new conecBD();

    public Consultar() {
        initComponents();
        con.connectar();
        
        modelo = new DefaultTableModel(datosC, columNamesC);

        llenarTabla();

    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jSeparator1 = new javax.swing.JSeparator();
        jScrollPane2 = new javax.swing.JScrollPane();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTConsulta = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        jTCodConsulta = new javax.swing.JTextField();
        jbConsultar = new javax.swing.JButton();
        jbModificar = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        addInternalFrameListener(new javax.swing.event.InternalFrameListener() {
            public void internalFrameActivated(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameClosed(javax.swing.event.InternalFrameEvent evt) {
                formInternalFrameClosed(evt);
            }
            public void internalFrameClosing(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameDeactivated(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameDeiconified(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameIconified(javax.swing.event.InternalFrameEvent evt) {
            }
            public void internalFrameOpened(javax.swing.event.InternalFrameEvent evt) {
            }
        });

        jLabel1.setFont(new java.awt.Font("Decker", 1, 36)); // NOI18N
        jLabel1.setText("Consultar Cuerpo");

        jSeparator1.setBackground(new java.awt.Color(0, 0, 0));

        jTConsulta.setFont(new java.awt.Font("Decker", 0, 10)); // NOI18N
        jTConsulta.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(jTConsulta);

        jScrollPane2.setViewportView(jScrollPane1);

        jLabel2.setFont(new java.awt.Font("Decker", 0, 14)); // NOI18N
        jLabel2.setText("codigo");

        jTCodConsulta.setFont(new java.awt.Font("Decker", 0, 14)); // NOI18N

        jbConsultar.setFont(new java.awt.Font("Decker", 0, 14)); // NOI18N
        jbConsultar.setText("Consultar");
        jbConsultar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbConsultarActionPerformed(evt);
            }
        });

        jbModificar.setFont(new java.awt.Font("Decker", 0, 14)); // NOI18N
        jbModificar.setText("Modificar");
        jbModificar.setEnabled(false);
        jbModificar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbModificarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 548, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                            .addGap(159, 159, 159)
                            .addComponent(jLabel1))
                        .addGroup(layout.createSequentialGroup()
                            .addGap(125, 125, 125)
                            .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 387, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(layout.createSequentialGroup()
                            .addGap(93, 93, 93)
                            .addComponent(jLabel2)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                            .addComponent(jTCodConsulta, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGap(18, 18, 18)
                            .addComponent(jbConsultar)
                            .addGap(18, 18, 18)
                            .addComponent(jbModificar))))
                .addContainerGap(46, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(jTCodConsulta, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jbConsultar)
                    .addComponent(jbModificar, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 42, Short.MAX_VALUE)
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 128, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(31, 31, 31))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jbConsultarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbConsultarActionPerformed
        jbModificar.setEnabled(false);
        if (!jTCodConsulta.getText().equals("")) {

            String cod = jTCodConsulta.getText();
            ConsultaSimple(cod);
            if (modelo.getRowCount() != 0) {
                jbModificar.setEnabled(true);
            } else {
                JOptionPane.showMessageDialog(null, "el registro " + cod + " no se encuentra", "ERROR: ", JOptionPane.INFORMATION_MESSAGE);
            }

        }
    }//GEN-LAST:event_jbConsultarActionPerformed

    private void jbModificarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbModificarActionPerformed
//        Interfaz.jDesktopPane1.removeAll();
//        Interfaz.jDesktopPane1.repaint();
//        
//        Modificar a = new Modificar(temp);
//        Interfaz.jDesktopPane1.add(a);
//        
//        a.show();
//        con.desconectar();
//
//        this.dispose();
    }//GEN-LAST:event_jbModificarActionPerformed

    private void formInternalFrameClosed(javax.swing.event.InternalFrameEvent evt) {//GEN-FIRST:event_formInternalFrameClosed
        try {
            con.desconectar();
        } catch (Exception e) {
        }
    }//GEN-LAST:event_formInternalFrameClosed

    public static boolean isNumeric(String cadena) {

        boolean resultado;

        try {
            Integer.parseInt(cadena);
            resultado = true;
        } catch (NumberFormatException excepcion) {
            resultado = false;
        }

        return resultado;
    }

    private void Clear_Table1() {
        for (int i = 0; i < jTConsulta.getRowCount(); i++) {
            modelo.removeRow(i);
            i -= 1;
        }
    }

    private void llenarTabla() {
        //fill
        Connection r = con.getconexion();

        try {
            String sql = "SELECT * FROM Cuerpo";
            //String sql = "SELECT placa,marca,modelo FROM Vehiculo WHERE placa = '?'";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                String[] te = {
                    String.valueOf(respuesta.getInt("cod_cuerpo")),
                    respuesta.getString("denominacion")                    
                };

                modelo.addRow(te);

            }
            jTConsulta.setModel(modelo);
        } catch (SQLException e) {
        }
    }

    private void ConsultaSimple(String clave) {
        Connection r = con.getconexion();

        try {
            String sql = "SELECT * FROM Cuerpo WHERE cod_cuerpo = '" + clave + "'";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            Clear_Table1();
            while (respuesta.next()) {
                
                String[] te = {
                    String.valueOf(respuesta.getInt("cod_cuerpo")),
                    respuesta.getString("denominacion")                    
                };

                modelo.addRow(te);

            }
            jTConsulta.setModel(modelo);
           

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "no se pudo consultar: " + e.getMessage(), "ERROR: ConsultaSimple", JOptionPane.INFORMATION_MESSAGE);
        }

    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTextField jTCodConsulta;
    private javax.swing.JTable jTConsulta;
    private javax.swing.JButton jbConsultar;
    private javax.swing.JButton jbModificar;
    // End of variables declaration//GEN-END:variables
}
