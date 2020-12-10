/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers;

import Models.clsPosiblesClientes;
import Models.clsSector;
import com.sun.org.apache.xpath.internal.operations.Mod;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author paola
 */
@WebServlet(name = "PosiblesClientesController", urlPatterns = {"/PosiblesClientesController"})
public class PosiblesClientesController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btnGuardar") != null) {
            btnGuardar(request, response);
        } else if (request.getParameter("btnModificar") != null) {
            btnModificar(request, response);
        } else if (request.getParameter("btnCancelar") != null) {
        } else if (request.getParameter("codigoSeleccionado") != null) {
            if (request.getParameter("stOpcion").equals("M")) {
                Modificar(request, response);
            } else if (request.getParameter("stOpcion").equals("E")) {
                Eliminar(request, response);
            }
        }
    }

    public void Modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Instanciando objetos
            Models.clsPosiblesClientes obclsPosiblesClientes = new Models.clsPosiblesClientes();

            //Lista de objetos
            List<Models.clsPosiblesClientes> lstclsPosiblesClientes = new ArrayList<Models.clsPosiblesClientes>();

            HttpSession session = request.getSession(true);

            if (session.getAttribute("session_lstclsPosiblesClientes") != null) {
                lstclsPosiblesClientes = (List<Models.clsPosiblesClientes>) session.getAttribute("session_lstclsPosiblesClientes");
            }

            for (Models.clsPosiblesClientes item : lstclsPosiblesClientes) {
                if (item.getInCodigo() == Integer.parseInt(request.getParameter("codigoSeleccionado"))) {
                    obclsPosiblesClientes = item;
                }
            }
            request.setAttribute("obclsPosiblesClientes", obclsPosiblesClientes);
            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("stMensaje", e.getMessage());
            request.setAttribute("stTipo", "error");
            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);
        }

    }

    public void Eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Instanciando objetos
            Models.clsPosiblesClientes obclsPosiblesClientes = new Models.clsPosiblesClientes();

            //Lista de objetos
            List<Models.clsPosiblesClientes> lstclsPosiblesClientes = new ArrayList<Models.clsPosiblesClientes>();
            List<Models.clsPosiblesClientes> lstclsPosiblesClientesNueva = new ArrayList<Models.clsPosiblesClientes>();

            HttpSession session = request.getSession(true);

            if (session.getAttribute("session_lstclsPosiblesClientes") != null) {
                lstclsPosiblesClientes = (List<Models.clsPosiblesClientes>) session.getAttribute("session_lstclsPosiblesClientes");
            }

            for (Models.clsPosiblesClientes item : lstclsPosiblesClientes) {
                if (item.getInCodigo() == Integer.parseInt(request.getParameter("codigoSeleccionado"))) {
                    obclsPosiblesClientes = item;
                    lstclsPosiblesClientes.remove(item);
                    break;
                }
            }
            session.setAttribute("session_lstclsPosiblesClientes", lstclsPosiblesClientes);
            request.setAttribute("stMensaje", "Se realizo proceso con exito.");
            request.setAttribute("stTipo", "success");
            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("stMensaje", e.getMessage());
            request.setAttribute("stTipo", "error");
            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);
        }

    }

    public void btnModificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Lista de objetos
            List<Models.clsPosiblesClientes> lstclsPosiblesClientes = new ArrayList<Models.clsPosiblesClientes>();
            HttpSession session = request.getSession(true);
            if (session.getAttribute("session_lstclsPosiblesClientes") != null) {
                lstclsPosiblesClientes = (List<Models.clsPosiblesClientes>) session.getAttribute("session_lstclsPosiblesClientes");
            }
            int inPosicion = 0;
            for (clsPosiblesClientes item : lstclsPosiblesClientes) {
                if (item.getInCodigo() == Integer.parseInt(request.getParameter("codigoModificar"))) {
                    break;
                }
                inPosicion++;
            }
            
            
            Models.clsFuentePosibleCliente obclsFuentePosibleCliente = new Models.clsFuentePosibleCliente();
            Models.clsEstadoPosibleCliente obclsEstadoPosibleCliente = new Models.clsEstadoPosibleCliente();
            Models.clsSector obclsSector = new Models.clsSector();
            Models.clsCalificacion obclsCalificacion = new Models.clsCalificacion();

            //Asignacion de atributos o propiedades
            if (request.getParameter("txtEmpresa") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStEmpresa(request.getParameter("txtEmpresa"));
            }
            if (request.getParameter("txtNombres") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStNombres(request.getParameter("txtNombres"));
            }
            if (request.getParameter("txtApellidos") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStApellidos(request.getParameter("txtApellidos"));
            }
            if (request.getParameter("txtTitulo") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStTitulo(request.getParameter("txtTitulo"));
            }
            if (request.getParameter("txtCorreoElectronico") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStCorreoElectronico(request.getParameter("txtCorreoElectronico"));
            }
            if (request.getParameter("txtTelefono") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStTelefono(request.getParameter("txtTelefono"));
            }
            if (request.getParameter("txtFax") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStFax(request.getParameter("txtFax"));
            }
            if (request.getParameter("txtMovil") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStMovil(request.getParameter("txtMovil"));
            }
            if (request.getParameter("txtSitioWeb") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStSitioWeb(request.getParameter("txtSitioWeb"));
            }
            if (request.getParameter("ddlFuentePosibleCliente") != null) {
                obclsFuentePosibleCliente.setInCodigo(Integer.parseInt(request.getParameter("ddlFuentePosibleCliente")));

                String stDescripcion = "";
                if (request.getParameter("ddlFuentePosibleCliente").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("2")) {
                    stDescripcion = "Aviso";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("3")) {
                    stDescripcion = "Lamada no solicitada";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("4")) {
                    stDescripcion = "Recomendacion de empleado";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("5")) {
                    stDescripcion = "Recomendacion externa";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("6")) {
                    stDescripcion = "Tienda en linea";
                }
                obclsFuentePosibleCliente.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                lstclsPosiblesClientes.get(inPosicion).setObclsFuentePosibleCliente(obclsFuentePosibleCliente);
            }
            if (request.getParameter("ddlEstadoPosibleCliente") != null) {
                obclsEstadoPosibleCliente.setInCodigo(Integer.parseInt(request.getParameter("ddlEstadoPosibleCliente")));

                String stDescripcion = "";
                if (request.getParameter("ddlEstadoPosibleCliente").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("2")) {
                    stDescripcion = "Intento de contacto";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("3")) {
                    stDescripcion = "Contactar en el futuro";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("4")) {
                    stDescripcion = "Contactado";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("5")) {
                    stDescripcion = "Posible cliente no solicitado";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("6")) {
                    stDescripcion = "Posible cliente perdido";
                }
                obclsEstadoPosibleCliente.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                lstclsPosiblesClientes.get(inPosicion).setObclsEstadoPosibleCliente(obclsEstadoPosibleCliente);
            }
            if (request.getParameter("ddlSector") != null) {
                obclsSector.setInCodigo(Integer.parseInt(request.getParameter("ddlSector")));

                String stDescripcion = "";
                if (request.getParameter("ddlSector").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlSector").equals("2")) {
                    stDescripcion = "APS(Proveedor de servicios de aplicaciones)";
                } else if (request.getParameter("ddlSector").equals("3")) {
                    stDescripcion = "OEM de datos";
                } else if (request.getParameter("ddlSector").equals("4")) {
                    stDescripcion = "ERP(Planificacion de recursos de empresa)";
                } else if (request.getParameter("ddlSector").equals("5")) {
                    stDescripcion = "Gobierno/Ejercito";
                } else if (request.getParameter("ddlSector").equals("6")) {
                    stDescripcion = "Empresa grande";
                }

                obclsSector.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                lstclsPosiblesClientes.get(inPosicion).setObclsSector(obclsSector);
            }
            if (request.getParameter("txtCantidaEmpleados") != null) {
                lstclsPosiblesClientes.get(inPosicion).setInCantidadEmpleados(Integer.parseInt(request.getParameter("txtCantidaEmpleados")));
            }
            if (request.getParameter("txtIngresosAnuales") != null) {
                lstclsPosiblesClientes.get(inPosicion).setDbIngresosAnuales(Double.parseDouble(request.getParameter("txtIngresosAnuales")));
            }
            if (request.getParameter("ddlClasificacion") != null) {
                obclsCalificacion.setInCodigo(Integer.parseInt(request.getParameter("ddlClasificacion")));

                String stDescripcion = "";
                if (request.getParameter("ddlClasificacion").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlClasificacion").equals("2")) {
                    stDescripcion = "Adquirido";
                } else if (request.getParameter("ddlClasificacion").equals("3")) {
                    stDescripcion = "Activo";
                } else if (request.getParameter("ddlClasificacion").equals("4")) {
                    stDescripcion = "Fallo de mercado";
                } else if (request.getParameter("ddlClasificacion").equals("5")) {
                    stDescripcion = "Proyecto cancelado";
                } else if (request.getParameter("ddlClasificacion").equals("6")) {
                    stDescripcion = "Apagar";
                }
                obclsCalificacion.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                lstclsPosiblesClientes.get(inPosicion).setObclsCalificacion(obclsCalificacion);
            }
            if (request.getParameter("chkNoParticipacionCorreoElectronico") != null) {
                char chSeleccion = request.getParameter("chkNoParticipacionCorreoElectronico").equals("on")
                        ? 'S' : 'N';
                lstclsPosiblesClientes.get(inPosicion).setChNoParticipacionCorreo(chSeleccion);
            }
            if (request.getParameter("txtIDSkype") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStIDSkype(request.getParameter("txtIDSkype"));
            }
            if (request.getParameter("txtTwitter") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStTwitter(request.getParameter("txtTwitter"));
            }
            if (request.getParameter("txtCorreoSecundario") != null) {
                lstclsPosiblesClientes.get(inPosicion).setStCorreoElectronicoSecundario(request.getParameter("txtCorreoSecundario"));
            }
            
            //Actualizamos la variable de session
            session.setAttribute("session_lstclsPosiblesClientes", lstclsPosiblesClientes);

            //Definmos parametros desde el controlador
            request.setAttribute("stMensaje", "Se realizo proceso con exito");
            request.setAttribute("stTipo", "success");

            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);
            
            
        } catch (Exception e) {
            //Definmos parametros desde el controlador
            request.setAttribute("stMensaje", e.getMessage());
            request.setAttribute("stTipo", "error");

            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);
        }
    }

    public void btnGuardar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Instanciando objetos
            Models.clsPosiblesClientes obclsPosiblesClientes = new Models.clsPosiblesClientes();
            Models.clsFuentePosibleCliente obclsFuentePosibleCliente = new Models.clsFuentePosibleCliente();
            Models.clsEstadoPosibleCliente obclsEstadoPosibleCliente = new Models.clsEstadoPosibleCliente();
            Models.clsSector obclsSector = new Models.clsSector();
            Models.clsCalificacion obclsCalificacion = new Models.clsCalificacion();

            //Asignacion de atributos o propiedades
            if (request.getParameter("txtEmpresa") != null) {
                obclsPosiblesClientes.setStEmpresa(request.getParameter("txtEmpresa"));
            }
            if (request.getParameter("txtNombres") != null) {
                obclsPosiblesClientes.setStNombres(request.getParameter("txtNombres"));
            }
            if (request.getParameter("txtApellidos") != null) {
                obclsPosiblesClientes.setStApellidos(request.getParameter("txtApellidos"));
            }
            if (request.getParameter("txtTitulo") != null) {
                obclsPosiblesClientes.setStTitulo(request.getParameter("txtTitulo"));
            }
            if (request.getParameter("txtCorreoElectronico") != null) {
                obclsPosiblesClientes.setStCorreoElectronico(request.getParameter("txtCorreoElectronico"));
            }
            if (request.getParameter("txtTelefono") != null) {
                obclsPosiblesClientes.setStTelefono(request.getParameter("txtTelefono"));
            }
            if (request.getParameter("txtFax") != null) {
                obclsPosiblesClientes.setStFax(request.getParameter("txtFax"));
            }
            if (request.getParameter("txtMovil") != null) {
                obclsPosiblesClientes.setStMovil(request.getParameter("txtMovil"));
            }
            if (request.getParameter("txtSitioWeb") != null) {
                obclsPosiblesClientes.setStSitioWeb(request.getParameter("txtSitioWeb"));
            }
            if (request.getParameter("ddlFuentePosibleCliente") != null) {
                obclsFuentePosibleCliente.setInCodigo(Integer.parseInt(request.getParameter("ddlFuentePosibleCliente")));

                String stDescripcion = "";
                if (request.getParameter("ddlFuentePosibleCliente").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("2")) {
                    stDescripcion = "Aviso";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("3")) {
                    stDescripcion = "Lamada no solicitada";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("4")) {
                    stDescripcion = "Recomendacion de empleado";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("5")) {
                    stDescripcion = "Recomendacion externa";
                } else if (request.getParameter("ddlFuentePosibleCliente").equals("6")) {
                    stDescripcion = "Tienda en linea";
                }
                obclsFuentePosibleCliente.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                obclsPosiblesClientes.setObclsFuentePosibleCliente(obclsFuentePosibleCliente);
            }
            if (request.getParameter("ddlEstadoPosibleCliente") != null) {
                obclsEstadoPosibleCliente.setInCodigo(Integer.parseInt(request.getParameter("ddlEstadoPosibleCliente")));

                String stDescripcion = "";
                if (request.getParameter("ddlEstadoPosibleCliente").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("2")) {
                    stDescripcion = "Intento de contacto";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("3")) {
                    stDescripcion = "Contactar en el futuro";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("4")) {
                    stDescripcion = "Contactado";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("5")) {
                    stDescripcion = "Posible cliente no solicitado";
                } else if (request.getParameter("ddlEstadoPosibleCliente").equals("6")) {
                    stDescripcion = "Posible cliente perdido";
                }
                obclsEstadoPosibleCliente.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                obclsPosiblesClientes.setObclsEstadoPosibleCliente(obclsEstadoPosibleCliente);
            }
            if (request.getParameter("ddlSector") != null) {
                obclsSector.setInCodigo(Integer.parseInt(request.getParameter("ddlSector")));

                String stDescripcion = "";
                if (request.getParameter("ddlSector").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlSector").equals("2")) {
                    stDescripcion = "APS(Proveedor de servicios de aplicaciones)";
                } else if (request.getParameter("ddlSector").equals("3")) {
                    stDescripcion = "OEM de datos";
                } else if (request.getParameter("ddlSector").equals("4")) {
                    stDescripcion = "ERP(Planificacion de recursos de empresa)";
                } else if (request.getParameter("ddlSector").equals("5")) {
                    stDescripcion = "Gobierno/Ejercito";
                } else if (request.getParameter("ddlSector").equals("6")) {
                    stDescripcion = "Empresa grande";
                }

                obclsSector.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                obclsPosiblesClientes.setObclsSector(obclsSector);
            }
            if (request.getParameter("txtCantidaEmpleados") != null) {
                obclsPosiblesClientes.setInCantidadEmpleados(Integer.parseInt(request.getParameter("txtCantidaEmpleados")));
            }
            if (request.getParameter("txtIngresosAnuales") != null) {
                obclsPosiblesClientes.setDbIngresosAnuales(Double.parseDouble(request.getParameter("txtIngresosAnuales")));
            }
            if (request.getParameter("ddlClasificacion") != null) {
                obclsCalificacion.setInCodigo(Integer.parseInt(request.getParameter("ddlClasificacion")));

                String stDescripcion = "";
                if (request.getParameter("ddlClasificacion").equals("1")) {
                    stDescripcion = "Ninguno";
                } else if (request.getParameter("ddlClasificacion").equals("2")) {
                    stDescripcion = "Adquirido";
                } else if (request.getParameter("ddlClasificacion").equals("3")) {
                    stDescripcion = "Activo";
                } else if (request.getParameter("ddlClasificacion").equals("4")) {
                    stDescripcion = "Fallo de mercado";
                } else if (request.getParameter("ddlClasificacion").equals("5")) {
                    stDescripcion = "Proyecto cancelado";
                } else if (request.getParameter("ddlClasificacion").equals("6")) {
                    stDescripcion = "Apagar";
                }
                obclsCalificacion.setStDescripcion(stDescripcion);
                //Asigno al modelo padre
                obclsPosiblesClientes.setObclsCalificacion(obclsCalificacion);
            }
            if (request.getParameter("chkNoParticipacionCorreoElectronico") != null) {
                char chSeleccion = request.getParameter("chkNoParticipacionCorreoElectronico").equals("on")
                        ? 'S' : 'N';
                obclsPosiblesClientes.setChNoParticipacionCorreo(chSeleccion);
            }
            if (request.getParameter("txtIDSkype") != null) {
                obclsPosiblesClientes.setStIDSkype(request.getParameter("txtIDSkype"));
            }
            if (request.getParameter("txtTwitter") != null) {
                obclsPosiblesClientes.setStTwitter(request.getParameter("txtTwitter"));
            }
            if (request.getParameter("txtCorreoSecundario") != null) {
                obclsPosiblesClientes.setStCorreoElectronicoSecundario(request.getParameter("txtCorreoSecundario"));
            }

            HttpSession session = request.getSession(true);

            //Lista de objetos
            List<Models.clsPosiblesClientes> lstclsPosiblesClientes = new ArrayList<Models.clsPosiblesClientes>();

            //Validamos la existencia de la variable de session
            if (session.getAttribute("session_lstclsPosiblesClientes") != null) {
                lstclsPosiblesClientes = (List<Models.clsPosiblesClientes>) session.getAttribute("session_lstclsPosiblesClientes");
            }

            //Calculo automatico que identifica ese registro
            int inCodigo = lstclsPosiblesClientes.size() + 1;
            obclsPosiblesClientes.setInCodigo(inCodigo);

            //Agregamos el objeto a la lista
            lstclsPosiblesClientes.add(obclsPosiblesClientes);

            //Creamos la variable de session
            session.setAttribute("session_lstclsPosiblesClientes", lstclsPosiblesClientes);

            //Definmos parametros desde el controlador
            request.setAttribute("stMensaje", "Se realizo proceso con exito");
            request.setAttribute("stTipo", "success");

            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);

        } catch (Exception e) {
            //Definmos parametros desde el controlador
            request.setAttribute("stMensaje", e.getMessage());
            request.setAttribute("stTipo", "error");

            request.getRequestDispatcher("PosiblesClientes.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
