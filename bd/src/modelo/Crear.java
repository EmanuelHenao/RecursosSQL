package modelo;

import bd.conecBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Crear extends javax.swing.JInternalFrame {

    conecBD con = new conecBD();

    public Crear() {
        initComponents();
        con.connectar();
        llenarCombo();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jTNomFabri = new javax.swing.JTextField();
        jbGuardarFabricante = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jTNombArti = new javax.swing.JTextField();
        jTPrecio = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jCIDFabri = new javax.swing.JComboBox<>();
        jBGuradarArticulo = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel5.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(new java.awt.Color(0, 153, 204), new java.awt.Color(0, 153, 204)), "Fabricante", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.TOP, new java.awt.Font("Decker", 1, 14), new java.awt.Color(0, 102, 204))); // NOI18N

        jLabel2.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N
        jLabel2.setText("Nombre");

        jTNomFabri.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N

        jbGuardarFabricante.setText("Guardar");
        jbGuardarFabricante.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbGuardarFabricanteActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addGap(22, 22, 22)
                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel2)
                            .addComponent(jTNomFabri, javax.swing.GroupLayout.PREFERRED_SIZE, 201, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addGap(86, 86, 86)
                        .addComponent(jbGuardarFabricante)))
                .addContainerGap(25, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGap(93, 93, 93)
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTNomFabri, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 66, Short.MAX_VALUE)
                .addComponent(jbGuardarFabricante)
                .addGap(35, 35, 35))
        );

        jPanel1.add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 60, 260, 290));

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createEtchedBorder(new java.awt.Color(0, 51, 204), new java.awt.Color(0, 51, 204)), "Articulo", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.TOP, new java.awt.Font("Decker", 1, 14), new java.awt.Color(0, 153, 204))); // NOI18N

        jLabel3.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N
        jLabel3.setText("Nombre");

        jTNombArti.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N

        jTPrecio.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N
        jLabel4.setText("Precio");

        jLabel5.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N
        jLabel5.setText("ID Fabricante");

        jCIDFabri.setFont(new java.awt.Font("Decker", 0, 12)); // NOI18N
        jCIDFabri.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-----" }));

        jBGuradarArticulo.setText("Guardar");
        jBGuradarArticulo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jBGuradarArticuloActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4)
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(jLabel3)
                        .addComponent(jTNombArti)
                        .addComponent(jTPrecio, javax.swing.GroupLayout.DEFAULT_SIZE, 183, Short.MAX_VALUE))
                    .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                        .addComponent(jCIDFabri, javax.swing.GroupLayout.Alignment.LEADING, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(95, Short.MAX_VALUE)
                .addComponent(jBGuradarArticulo)
                .addGap(72, 72, 72))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(29, 29, 29)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTNombArti, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel4)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTPrecio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jCIDFabri, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jBGuradarArticulo, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(27, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(340, 60, 250, 290));

        jLabel1.setFont(new java.awt.Font("Decker", 1, 18)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Agregar Registro");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 10, 270, -1));

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 650, 400));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jbGuardarFabricanteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbGuardarFabricanteActionPerformed
        if (!jTNomFabri.getText().equals("")) {
            try {
                Connection r = con.getconexion();
                String sql = "call ejercicio6.InsertarFabricante(?)";
                PreparedStatement p;
                p = r.prepareStatement(sql);
                p.setString(1, jTNomFabri.getText());
                p.execute();
                JOptionPane.showMessageDialog(null, "se a guardado EXITOSAMENTE", "Dato", JOptionPane.INFORMATION_MESSAGE);
                jTNomFabri.setText("");
                llenarCombo();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "no se pudo GUARDAR" + e.getMessage(), "ERROR: guardar", JOptionPane.INFORMATION_MESSAGE);
            }
            con.desconectar();
            
        } else {
            JOptionPane.showMessageDialog(null, "el formato  no es adecuado", "Error: tipo de dato invalido", JOptionPane.ERROR_MESSAGE);
        }
        
    }//GEN-LAST:event_jbGuardarFabricanteActionPerformed

    private void jBGuradarArticuloActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jBGuradarArticuloActionPerformed
        if (!jTNombArti.getText().equals("") && !jTPrecio.getText().equals("")) {
            if (jCIDFabri.getSelectedIndex() != 0) {
                if (isNumeric(jTPrecio.getText())) {
                    try {
                        Connection r = con.getconexion();

                        String sql = "call ejercicio6.InsertarArticulo(?,?,?)";
                        PreparedStatement p;

                        p = r.prepareStatement(sql);
                        p.setString(1, jTNombArti.getText());
                        p.setInt(2, Integer.parseInt(jTPrecio.getText()));
                        p.setInt(3, Integer.parseInt(jCIDFabri.getSelectedItem().toString()));

                        p.execute();

                        JOptionPane.showMessageDialog(null, "se a guardado EXITOSAMENTE", "Dato", JOptionPane.INFORMATION_MESSAGE);
                    } catch (SQLException e) {
                        JOptionPane.showMessageDialog(null, "no se pudo GUARDAR" + e.getMessage(), "ERROR: guardar", JOptionPane.INFORMATION_MESSAGE);
                    }
                    con.desconectar();

                } else {
                    JOptionPane.showMessageDialog(null, "el formato de Precio no es adecuado", "Error: tipo de dato invalido", JOptionPane.ERROR_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(null, "No se encontro fabricante, Agrege uno", "Error:fabricante", JOptionPane.ERROR_MESSAGE);
            }
        }else{
            JOptionPane.showMessageDialog(null, "campos vacios", "Error:", JOptionPane.ERROR_MESSAGE);
        }
        jCIDFabri.setSelectedIndex(0);
        jTNombArti.setText("");
        jTPrecio.setText("");
    }//GEN-LAST:event_jBGuradarArticuloActionPerformed

    private void llenarCombo() {

        try {
            jCIDFabri.removeAllItems();
            jCIDFabri.addItem("----");
            Connection r = con.getconexion();
            String sql = "SELECT codigo FROM Fabricante ";
            PreparedStatement pstm = r.prepareStatement(sql);
            ResultSet respuesta = pstm.executeQuery();

            while (respuesta.next()) {
                jCIDFabri.addItem(respuesta.getString("codigo"));  
            }
            con.desconectar();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "no se pudo llenar el combo", "ERROR: ", JOptionPane.INFORMATION_MESSAGE);
            System.out.println("errorcombo:"+e.getMessage());
        }

    }

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

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jBGuradarArticulo;
    private javax.swing.JComboBox<String> jCIDFabri;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JTextField jTNomFabri;
    private javax.swing.JTextField jTNombArti;
    private javax.swing.JTextField jTPrecio;
    private javax.swing.JButton jbGuardarFabricante;
    // End of variables declaration//GEN-END:variables
}
