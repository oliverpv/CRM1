<%-- 
    Document   : Login
    Created on : 6/12/2020, 12:10:07 AM
    Author     : author paola
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Login</title>
        <!-- Bootstrap core CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!--link href="vendor/bootstrap/css/bootstrap.css" rel="stylesheet"-->
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
    <body class="bg-dark" onload="mensaje()">
        <!-- Scriptlets -->
        <%            
            if (request.getAttribute("stError") != null) {              
        %>
        <input type="text" id="txtMensaje"   hidden="" value="<%=request.getAttribute("stError")%>"/>
        <script>
            var stMensaje = document.getElementById("txtMensaje").value;
                swal("Mensaje", stMensaje, "error");          
        </script>
        <%
            }
        %>
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div class="card-header">Login</div>    
                <div class="card-body">
                    <form action="LoginController" method="post">
                        <div class="form-group">
                            <label for="lblEmail">Email</label>
                            <input class="form-control" name="txtEmail" type="email" aria-describedby="emailHelp" placeholder="Ingrese email">
                        </div>
                        <div class="form-group">
                            <label for="lblPassword">Password</label>
                            <input class="form-control" name="txtPassword" type="password" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="chkRecordar"> Remember Password</label>
                            </div>
                        </div>
                        <input name="btnAutenticar" type="submit" class="btn btn-primary btn-block" value="Aceptar"/>

                    </form>
                    <div class="text-center">
                        <a class="d-block small mt-3" href="Registrar.jsp">Registrar</a>
                        <a class="d-block small" href="#">Forgot Password?</a>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

