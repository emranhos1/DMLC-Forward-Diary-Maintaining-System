<%-- 
    Document   : login
    Created on : May 25, 2017, 9:01:24 AM
    Author     : Md. Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin Login For DMLC</title>
        <!-- Bootstrap Core CSS -->
        <link href="allStyles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- MetisMenu CSS -->
        <link href="allStyles/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="allStyles/dist/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Fonts -->
        <link href="allStyles/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery -->
        <script src="allStyles/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="allStyles/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="allStyles/vendor/metisMenu/metisMenu.min.js" type="text/javascript"></script>
        <!-- Custom Theme JavaScript -->
        <script src="allStyles/dist/js/sb-admin-2.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="row">
                        <div class="top-logo">
                            <div class="col-sm-6"><img class="img img-responsive" src="Image/alogo.png" alt=""/></div>
                            <div class="col-sm-6"><img class="img img-responsive pull-right" src="Image/slogo.png" alt=""></div>
                        </div>
                    </div>
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                            <div id="message">
                                <center><h3>${message}</h3></center>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form role="form" role="form" action="LoginBean" method="post" class="form-horizontal">
                                <fieldset>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Username" name="username" type="text" autofocus required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" placeholder="Password" name="password" type="password" value="" required>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <div>
                                        <input type="submit" value="Login" class="btn btn-lg btn-success btn-block"/>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);
        </script>
    </body>
</html>