<%-- 
    Document   : Registrar
    Created on : 6/12/2020, 12:10:33 AM
    Author     : author paola
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Registrar</title>
        <!-- Bootstrap core CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css">

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
    </head>
    <body class="bg-dark">
        <%
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
            <div class="card card-register mx-auto mt-5">
                <div class="card-header">Registrar</div>
                <div class="card-body">
                    <form action="LoginController" method="post">
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="lblIdentificacion">Identificación</label>
                                    <input class="form-control" name="txtIdentificacion" type="text" placeholder="Ingrese Identificación">
                                </div>                                
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="lblPrimerNombre">Primer Nombre</label>
                                    <input class="form-control" name="txtPrimerNombre" type="text" placeholder="Ingrese Primer Nombre">
                                </div>  
                                <div class="col-md-6">
                                    <label for="lblSegundoNombre">Segundo Nombre</label>
                                    <input class="form-control" name="txtSegundoNombre" type="text" placeholder="Ingrese Segundo Nombre">
                                </div> 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="lblPrimerApellido">Primer Apellido</label>
                                    <input class="form-control" name="txtPrimerApellido" type="text" placeholder="Ingrese Primer Apellido">
                                </div>  
                                <div class="col-md-6">
                                    <label for="lblSegundoApellido">Segundo Apellido</label>
                                    <input class="form-control" name="txtSegundoApellido" type="text" placeholder="Ingrese Segundo Apellido">
                                </div> 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="lblDireccion">Dirección</label>
                                    <input class="form-control" name="txtDireccion" type="text" placeholder="Ingrese Dirección">
                                </div>  
                                <div class="col-md-6">
                                    <label for="lblTelefono">Teléfono</label>
                                    <input class="form-control" name="txtTelefono" type="text" placeholder="Ingrese Teléfono">
                                </div> 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-12">
                                    <label for="lblCorreo">Correo</label>
                                    <input class="form-control" name="txtEmail" type="text" placeholder="Ingrese Correo">
                                </div>                                 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label for="lblPassword">Password</label>
                                    <input class="form-control" name="txtPassword" type="password" placeholder="Ingrese Password">
                                </div>  
                                <div class="col-md-6">
                                    <label for="lblConfirmarPassword">Confirmar Password</label>
                                    <input class="form-control" name="txtConfirmarPassword" type="password" placeholder="Confirmar Password">
                                </div> 
                            </div>
                        </div>
                        <input name="btnRegistrar" type="submit" class="btn btn-primary btn-block" value="Aceptar"/>                      
                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="Login.jsp">Login</a>                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
