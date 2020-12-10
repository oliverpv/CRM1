<%-- 
    Document   : PosiblesClientes
    Created on : 6/12/2020, 01:28:46 AM
    Author     : author paola
--%>

<%@page import="Models.clsPosiblesClientes"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Posibles Cliente</title>
        <!-- Bootstrap core CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css">
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    </head>
    <body >
        <%
            Models.clsPosiblesClientes obclsPosiblesClientes = new Models.clsPosiblesClientes();

            if (request.getAttribute("obclsPosiblesClientes") != null) {
                obclsPosiblesClientes = (Models.clsPosiblesClientes) request.getAttribute("obclsPosiblesClientes");
            }

            List<Models.clsPosiblesClientes> lstclsPosiblesClientes = new ArrayList<Models.clsPosiblesClientes>();
            if (session.getAttribute("session_lstclsPosiblesClientes") != null) {
                lstclsPosiblesClientes = (List<Models.clsPosiblesClientes>) session.getAttribute("session_lstclsPosiblesClientes");
            }

            if (request.getAttribute("stMensaje") != null
                    && request.getAttribute("stTipo") != null) {

        %>
        <input type="text" id="txtMensaje"   hidden="" value="<%=request.getAttribute("stMensaje")%>"/>
        <input type="text" id="txtTipo"   hidden="" value="<%=request.getAttribute("stTipo")%>"/>
        <script>
            var stMensaje = document.getElementById("txtMensaje").value;
            var tipo = document.getElementById("txtTipo").value;
            swal("Mensaje", stMensaje, tipo);
        </script>
        <%
            }
        %>
        <div class="container">
            <div class="card mx-auto mt-5">
                <div class="card-header">Crear Posibles Clientes</div>
                <div class="card-body">
                    <form action="PosiblesClientesController" method="post">

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <input name="btnGuardar" type="submit" class="btn btn-primary" value="Guardar"/> 
                                    <input name="btnModificar" type="submit" class="btn btn-primary" value="Modificar"/>
                                    <input name="btnCancelar" type="submit" class="btn btn-primary" value="Cancelar"/>
                                    <input type="text" id="codigoModificar" name="codigoModificar" value="<%= obclsPosiblesClientes.getInCodigo()%>" hidden=""/>
                                </div>                                
                            </div>
                        </div>
                        <!-- Titulo -->
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <h1>Información de Posible Cliente</h1>                                   
                                </div>                                
                            </div>
                        </div>
                        <!-- Primera fila -->
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-3">
                                    <label for="lblEmpresa">Empresa</label>
                                    <input class="form-control" name="txtEmpresa" type="text" placeholder="Empresa"
                                           value="<%= obclsPosiblesClientes.getStEmpresa() != null ? obclsPosiblesClientes.getStEmpresa() : ""%>"/>
                                </div>  
                                <div class="col-md-3">
                                    <label for="lblNombres">Nombres</label>
                                    <input class="form-control" name="txtNombres" type="text" placeholder="Nombres"
                                           value="<%= obclsPosiblesClientes.getStNombres() != null ? obclsPosiblesClientes.getStNombres() : ""%>"/>
                                </div> 
                                <div class="col-md-3">
                                    <label for="lblApellidos">Apellidos</label>
                                    <input class="form-control" name="txtApellidos" type="text" placeholder="Apellidos"
                                           value="<%= obclsPosiblesClientes.getStApellidos() != null ? obclsPosiblesClientes.getStApellidos() : ""%>"/>
                                </div> 
                                <div class="col-md-3">
                                    <label for="lblTitulo">Titulo</label>
                                    <input class="form-control" name="txtTitulo" type="text" placeholder="Titulo"
                                           value="<%= obclsPosiblesClientes.getStTitulo() != null ? obclsPosiblesClientes.getStTitulo() : ""%>"/>
                                </div> 
                            </div>
                        </div>
                        <!-- Segunda fila -->
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-3">
                                    <label for="lblCorreoElectronico">Correo Electronico</label>
                                    <input class="form-control" name="txtCorreoElectronico" type="text" placeholder="Correo Electronico"
                                           value="<%= obclsPosiblesClientes.getStCorreoElectronico() != null ? obclsPosiblesClientes.getStCorreoElectronico() : ""%>"/>
                                </div>  
                                <div class="col-md-3">
                                    <label for="lblTelefono">Teléfono</label>
                                    <input class="form-control" name="txtTelefono" type="text" placeholder="Teléfono"
                                           value="<%= obclsPosiblesClientes.getStTelefono() != null ? obclsPosiblesClientes.getStTelefono() : ""%>"/>
                                </div> 
                                <div class="col-md-3">
                                    <label for="lblFax">Fax</label>
                                    <input class="form-control" name="txtFax" type="text" placeholder="Fax"
                                           value="<%= obclsPosiblesClientes.getStFax() != null ? obclsPosiblesClientes.getStFax() : ""%>"/>
                                </div> 
                                <div class="col-md-3">
                                    <label for="lblMovil">Movil</label>
                                    <input class="form-control" name="txtMovil" type="text" placeholder="Movil"
                                           value="<%= obclsPosiblesClientes.getStMovil() != null ? obclsPosiblesClientes.getStMovil() : ""%>"/>
                                </div> 
                            </div>
                        </div>
                        <!-- Tercera fila -->
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-3">
                                    <label for="lblSitioWeb">Sitio Web</label>
                                    <input class="form-control" name="txtSitioWeb" type="text" placeholder="Sitio Web"
                                           value="<%= obclsPosiblesClientes.getStSitioWeb() != null ? obclsPosiblesClientes.getStSitioWeb() : ""%>"/>
                                </div>  
                                <div class="col-md-3">
                                    <label for="ddlFuentePosibleCliente">Fuente de posible cliente</label>
                                    <select  class="form-control" name="ddlFuentePosibleCliente" >
                                        <option value="1" <%= obclsPosiblesClientes.obclsFuentePosibleCliente != null ? obclsPosiblesClientes.obclsFuentePosibleCliente.getInCodigo() == 1 ? "selected" : "" : ""%>>Ninguno</option>
                                        <option value="2" <%= obclsPosiblesClientes.obclsFuentePosibleCliente != null ? obclsPosiblesClientes.obclsFuentePosibleCliente.getInCodigo() == 2 ? "selected" : "" : ""%>>Aviso</option>
                                        <option value="3" <%= obclsPosiblesClientes.obclsFuentePosibleCliente != null ? obclsPosiblesClientes.obclsFuentePosibleCliente.getInCodigo() == 3 ? "selected" : "" : ""%>>Lamada no solicitada</option>
                                        <option value="4" <%= obclsPosiblesClientes.obclsFuentePosibleCliente != null ? obclsPosiblesClientes.obclsFuentePosibleCliente.getInCodigo() == 4 ? "selected" : "" : ""%>>Recomendacion de empleado</option>
                                        <option value="5" <%= obclsPosiblesClientes.obclsFuentePosibleCliente != null ? obclsPosiblesClientes.obclsFuentePosibleCliente.getInCodigo() == 5 ? "selected" : "" : ""%>>Recomendacion externa</option>
                                        <option value="6" <%= obclsPosiblesClientes.obclsFuentePosibleCliente != null ? obclsPosiblesClientes.obclsFuentePosibleCliente.getInCodigo() == 6 ? "selected" : "" : ""%>>Tienda en linea</option>
                                    </select>
                                </div> 
                                <div class="col-md-3">
                                    <label for="ddlEstadoPosibleCliente">Estado de posible cliente</label>
                                    <select  class="form-control" name="ddlEstadoPosibleCliente" >
                                        <option value="1" <%= obclsPosiblesClientes.obclsEstadoPosibleCliente != null ? obclsPosiblesClientes.obclsEstadoPosibleCliente.getInCodigo() == 1 ? "selected" : "" : ""%>>Ninguno</option>
                                        <option value="2" <%= obclsPosiblesClientes.obclsEstadoPosibleCliente != null ? obclsPosiblesClientes.obclsEstadoPosibleCliente.getInCodigo() == 2 ? "selected" : "" : ""%>>Intento de contacto</option>
                                        <option value="3" <%= obclsPosiblesClientes.obclsEstadoPosibleCliente != null ? obclsPosiblesClientes.obclsEstadoPosibleCliente.getInCodigo() == 3 ? "selected" : "" : ""%>>Contactar en el futuro</option>
                                        <option value="4" <%= obclsPosiblesClientes.obclsEstadoPosibleCliente != null ? obclsPosiblesClientes.obclsEstadoPosibleCliente.getInCodigo() == 4 ? "selected" : "" : ""%>>Contactado</option>
                                        <option value="5" <%= obclsPosiblesClientes.obclsEstadoPosibleCliente != null ? obclsPosiblesClientes.obclsEstadoPosibleCliente.getInCodigo() == 5 ? "selected" : "" : ""%>>Posible cliente no solicitado</option>
                                        <option value="6" <%= obclsPosiblesClientes.obclsEstadoPosibleCliente != null ? obclsPosiblesClientes.obclsEstadoPosibleCliente.getInCodigo() == 6 ? "selected" : "" : ""%>>Posible cliente perdido</option>
                                    </select>
                                </div> 
                                <div class="col-md-3">
                                    <label for="ddlSector">Sector</label>
                                    <select  class="form-control" name="ddlSector" >
                                        <option value="1" <%= obclsPosiblesClientes.obclsSector != null ? obclsPosiblesClientes.obclsSector.getInCodigo() == 1 ? "selected" : "" : ""%>>Ninguno</option>
                                        <option value="2" <%= obclsPosiblesClientes.obclsSector != null ? obclsPosiblesClientes.obclsSector.getInCodigo() == 2 ? "selected" : "" : ""%>>APS(Proveedor de servicios de aplicaciones)</option>
                                        <option value="3" <%= obclsPosiblesClientes.obclsSector != null ? obclsPosiblesClientes.obclsSector.getInCodigo() == 3 ? "selected" : "" : ""%>>OEM de datos</option>
                                        <option value="4" <%= obclsPosiblesClientes.obclsSector != null ? obclsPosiblesClientes.obclsSector.getInCodigo() == 4 ? "selected" : "" : ""%>>ERP(Planificacion de recursos de empresa)</option>
                                        <option value="5" <%= obclsPosiblesClientes.obclsSector != null ? obclsPosiblesClientes.obclsSector.getInCodigo() == 5 ? "selected" : "" : ""%>>Gobierno/Ejercito</option>
                                        <option value="6" <%= obclsPosiblesClientes.obclsSector != null ? obclsPosiblesClientes.obclsSector.getInCodigo() == 6 ? "selected" : "" : ""%>>Empresa grande</option>
                                    </select>
                                </div> 
                            </div>
                        </div>
                        <!-- Cuarta fila -->
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-3">
                                    <label for="lblCantidaEmpleados">Cantidad de empleados</label>
                                    <input class="form-control" name="txtCantidaEmpleados" type="number" placeholder="Cantidad de Empleados"
                                           value="<%= obclsPosiblesClientes.getInCantidadEmpleados() != 0 ? obclsPosiblesClientes.getInCantidadEmpleados() : ""%>"/>
                                </div>  
                                <div class="col-md-3">
                                    <label for="lblIngresosAnuales">Ingresos anuales</label>
                                    <input class="form-control" name="txtIngresosAnuales" type="number" placeholder="Ingresos Anuales"
                                           value="<%= obclsPosiblesClientes.getDbIngresosAnuales() != 0 ? obclsPosiblesClientes.getDbIngresosAnuales() : ""%>"/>
                                </div> 
                                <div class="col-md-3">
                                    <label for="ddlClasificacion">Clasificación</label>
                                    <select  class="form-control" name="ddlClasificacion" >
                                        <option value="1" <%= obclsPosiblesClientes.obclsCalificacion != null ? obclsPosiblesClientes.obclsCalificacion.getInCodigo() == 1 ? "selected" : "" : ""%>>Ninguno</option>
                                        <option value="2" <%= obclsPosiblesClientes.obclsCalificacion != null ? obclsPosiblesClientes.obclsCalificacion.getInCodigo() == 2 ? "selected" : "" : ""%>>Adquirido</option>
                                        <option value="3" <%= obclsPosiblesClientes.obclsCalificacion != null ? obclsPosiblesClientes.obclsCalificacion.getInCodigo() == 3 ? "selected" : "" : ""%>>Activo</option>
                                        <option value="4" <%= obclsPosiblesClientes.obclsCalificacion != null ? obclsPosiblesClientes.obclsCalificacion.getInCodigo() == 4 ? "selected" : "" : ""%>>Fallo de mercado</option>
                                        <option value="5" <%= obclsPosiblesClientes.obclsCalificacion != null ? obclsPosiblesClientes.obclsCalificacion.getInCodigo() == 5 ? "selected" : "" : ""%>>Proyecto cancelado</option>
                                        <option value="6" <%= obclsPosiblesClientes.obclsCalificacion != null ? obclsPosiblesClientes.obclsCalificacion.getInCodigo() == 6 ? "selected" : "" : ""%>>Apagar</option>
                                    </select>
                                </div> 
                                <div class="col-md-3">
                                    <label for="lblNoParticipacionCorreoElectronico">
                                        <input name="chkNoParticipacionCorreoElectronico" type="checkbox" 
                                               <%= obclsPosiblesClientes.chNoParticipacionCorreo == 'S' ? "checked" : ""%>/>
                                        No participación correo electronico
                                    </label>                                    
                                </div> 
                            </div>
                        </div>
                        <!-- Quinta fila -->
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-3">
                                    <label for="lblIDSkype">ID de Skype</label>
                                    <input class="form-control" name="txtIDSkype" type="text" placeholder="ID de Skype"
                                           value="<%= obclsPosiblesClientes.getStIDSkype() != null ? obclsPosiblesClientes.getStIDSkype() : ""%>"/>
                                </div>  
                                <div class="col-md-3">
                                    <label for="lblTwitter">Twitter</label>
                                    <input class="form-control" name="txtTwitter" type="text" placeholder="Twitter"
                                           value="<%= obclsPosiblesClientes.getStTwitter() != null ? obclsPosiblesClientes.getStTwitter() : ""%>"/>
                                </div> 
                                <div class="col-md-6">
                                    <label for="lblCorreoSecundario">Correo electronico secundario</label>
                                    <input class="form-control" name="txtCorreoSecundario" type="email" placeholder="Correo electronico secundario"
                                           value="<%= obclsPosiblesClientes.getStCorreoElectronicoSecundario() != null ? obclsPosiblesClientes.getStCorreoElectronicoSecundario() : ""%>"/>
                                </div> 
                            </div>
                        </div>
                        <!--  fila -->
                        <div class="form-group">
                            <div class="form-row">                                 
                                <div class="col-md-12">
                                    <b>
                                        <i class="fa fa-clipboard"></i>
                                        Registros: <%= lstclsPosiblesClientes.size()%>
                                    </b>
                                </div>
                            </div>
                        </div>

                        <!-- Sexta fila -->
                        <div class="form-group">
                            <div class="form-row">                                 
                                <div class="col-md-12">
                                    <table class="table table-bordered table-primary table-responsive">
                                        <tr>
                                            <td>Modificar</td>
                                            <td>Eliminar</td>
                                            <td>Empresa</td>
                                            <td>Nombres</td>
                                            <td>Apellidos</td>
                                            <td>Titulo</td>
                                            <td>Correo Electronico</td>
                                            <td>Teléfono</td>
                                            <td>Fax</td>
                                            <td>Movil</td>
                                            <td>Sitio Web</td>
                                            <td>Fuente posible cliente</td>
                                            <td>Estado posible cliente</td>
                                            <td>Sector</td>
                                            <td>Cantidad de empleado</td>
                                            <td>Ingresos anuales</td>
                                            <td>Calificacion</td>
                                            <td>No participacion correo electronico</td>
                                            <td>ID de skype</td>
                                            <td>Twitter</td>
                                            <td>Correo electronico secundario</td>
                                        </tr>
                                        <%
                                            for (Models.clsPosiblesClientes item : lstclsPosiblesClientes) {
                                                Models.clsFuentePosibleCliente obclsFuentePosibleCliente = item.getObclsFuentePosibleCliente();
                                                Models.clsEstadoPosibleCliente obclsEstadoPosibleCliente = item.getObclsEstadoPosibleCliente();
                                                Models.clsSector obclsSector = item.getObclsSector();
                                                Models.clsCalificacion obclsCalificacion = item.getObclsCalificacion();
                                        %>
                                        <tr>
                                            <td>
                                                <a class="btn btn-success btn-sm"
                                                   href="PosiblesClientesController?stOpcion=M&codigoSeleccionado=<%= item.getInCodigo()%>"> 
                                                    Modificar
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-danger btn-sm"
                                                   href="PosiblesClientesController?stOpcion=E&codigoSeleccionado=<%= item.getInCodigo()%>"> 
                                                    Eliminar
                                                </a>
                                            </td>
                                            <td><%= item.getStEmpresa()%></td>
                                            <td><%= item.getStNombres()%></td>
                                            <td><%= item.getStApellidos()%></td>
                                            <td><%= item.getStTitulo()%></td>
                                            <td><%= item.getStCorreoElectronico()%></td>
                                            <td><%= item.getStTelefono()%></td>
                                            <td><%= item.getStFax()%></td>
                                            <td><%= item.getStMovil()%></td>
                                            <td><%= item.getStSitioWeb()%></td>
                                            <td><%= obclsFuentePosibleCliente.getStDescripcion()%></td>
                                            <td><%= obclsEstadoPosibleCliente.getStDescripcion()%></td>
                                            <td><%= obclsSector.getStDescripcion()%></td>
                                            <td><%= item.getInCantidadEmpleados()%></td>
                                            <td><%= item.getDbIngresosAnuales()%></td>
                                            <td><%= obclsCalificacion.getStDescripcion()%></td>
                                            <td><%= item.getChNoParticipacionCorreo()%></td>
                                            <td><%= item.getStIDSkype()%></td>
                                            <td><%= item.getStTwitter()%></td>
                                            <td><%= item.getStCorreoElectronicoSecundario()%></td> 

                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div> 
                            </div>
                        </div>
                    </form>                    
                </div>
            </div>
        </div>
    </body>
</html>
