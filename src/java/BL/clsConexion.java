/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BL;

import java.sql.DriverManager;
import java.sql.Connection;

/**
 *
 * @author paola
 */
public class clsConexion {

    Connection conn = null;
  private static String stServidor, stUsuario, stPassword, stBD = "";

    public clsConexion(){

        try {
            stServidor = "localhost";
            stUsuario = "oliver";
            stPassword = "123456";
            stBD = "dbCRM";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String stConexion = "jdbc:sqlserver://" + stServidor + ":1433;databaseName=" + stBD + ";IntegratedSecurity=true";
            conn = DriverManager.getConnection(stConexion, stUsuario, stPassword);

        } catch (Exception e) {
           
        }

    }

    public Connection getConexion() {
        return conn;
    }

    public void closeConnexion(Connection conn) {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }
}
