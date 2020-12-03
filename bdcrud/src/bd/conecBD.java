package bd;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class conecBD {

    String bd = "Milicia";
    String usr = "root";
    String pass = "";
    String Drive = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1/" + bd;

    protected Connection con;

    public void connectar() {
        try {
            Class.forName(Drive);

            con = DriverManager.getConnection(url, usr, pass);
            System.out.println("Conexion exitosa");
        } catch (SQLException | ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null,"No se pudo establecer la coneccion a al base de datos:\n "+e.getMessage(),"Conexion a bd", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Connection getconexion(){
        return  this.con;
    }
    
    public void desconectar(){
        try {
            con.close();
           
        } catch (SQLException e) {
            Logger.getLogger(conecBD.class.getName()).log(Level.SEVERE, null,e);
        }
    }
}
