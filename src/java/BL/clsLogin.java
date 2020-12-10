/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BL;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author paola
 */
public class clsLogin {

    clsConexion obclsConexion = new clsConexion();
    Connection conn = null;

    public clsLogin() {

        conn = obclsConexion.getConexion();
    }

    public boolean validarLogin(Models.clsLogin obclsLogin) {
        try {
//
//            PreparedStatement ps = conn.prepareCall("{call spConsultarUsuario(?,?)}");
//
//            ps.setString(1, obclsLogin.getStEmail());
//            ps.setString(2, obclsLogin.getStPassword());
//
//            ResultSet rs = ps.executeQuery();
//
//            boolean blExiste = false;
//
//            while (rs.next()) {
//                blExiste = true;
//            }
////
//            return blExiste;

//----------------------------------------------------

            if (obclsLogin.getStEmail().equals("prueba@gmail.com")
                    && obclsLogin.getStPassword().equals("12")) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            throw e;
//            return false;
        }
    }

    public String addUsuario(Models.clsLogin obclsLogin) {
        try {
            PreparedStatement ps = conn.prepareStatement("{call spInsertarUsuarios(?,?)}");
            ps.setString(1, obclsLogin.getStEmail());
            ps.setString(2, obclsLogin.getStPassword());

            ps.execute();

            return "OK";

        } catch (Exception e) {
            return e.getMessage();
        } finally {
            obclsConexion.closeConnexion(conn);
        }
    }
}
