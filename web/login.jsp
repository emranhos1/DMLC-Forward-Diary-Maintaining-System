<%-- 
    Document   : login
    Created on : May 25, 2017, 9:01:24 AM
    Author     : Md. Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>DMLC Forward Diary Maintaining System</title>

    <!-- Bootstrap Core CSS -->
        <link href="../allStyles/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- MetisMenu CSS -->
        <link href="../allStyles/css/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="../allStyles/css/custom/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Fonts -->
        <link href="../allStyles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="" required>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <input type="submit" name="submit" value="Login" class="btn btn-lg btn-success btn-block"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
        <script src="../allStyles/js/jquery/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../allStyles/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../allStyles/js/metisMenu/metisMenu.min.js" type="text/javascript"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../allStyles/js/custom/sb-admin-2.js" type="text/javascript"></script>

</body>

</html>

