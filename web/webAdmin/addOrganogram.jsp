<%-- 
    Document   : addOrganogram
    Created on : May 27, 2017, 10:40:58 AM
    Author     : Softcell-4
--%>

<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DMLC - Organogram</title>
        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="../css/custom/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Fonts -->
        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div id="wrapper">
            <!-- Navigation Bar-->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

                <!--Navigation Bar Head-->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">DMLC Admin</a>
                </div>

                <!--Navigation Bar Head(User)-->
                <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> ব্যবহারকারী প্রোফাইল</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> সেটিংস</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> প্রস্থান</a>
                        </li>
                    </ul>
                </li>
            </ul>

                <!--Navigation Side Bar-->
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-dashboard fa-fw"></i> ড্যাশবোর্ড</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-users fa-fw"></i> নতুন অর্গানোগ্রাম</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-users fa-fw"></i> সকল অর্গানোগ্রাম</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> নতুন কর্মচারী</a>
                            </li>

                            <li>
                                <a href="#"><i class="fa fa-user fa-fw"></i> সকল কর্মচারী</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> অন্যান্য<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">বার্তা পাঠান</a>
                                    </li>
                                    <li>
                                        <a href="#">বার্তা দেখুন</a>
                                    </li>
                                    <li>
                                        <a href="#">প্রজ্ঞাপন</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!--Body Part--> 
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">অর্গানোগ্রাম</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                নতুন অর্গানোগ্রাম সৃষ্টি করুন
                            </div>

                            <div id="message">
                                <center><h3>${addOrgInfo}</h3></center>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-6">
                                        <form action="../AddOrganogramBean" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="depertment">বিভাগ</label>
                                                <div class="col-md-9">
                                                    <input id="depertment" name="depertment" class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="designation">উপাধি</label>
                                                <div class="col-md-9">
                                                    <input id="designation" name="designation" class="form-control" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="mainSection">মুখ্য বিভাগ</label>
                                                <div class="col-md-9">
                                                    <input id="mainSection" name="mainSection" onclick="getparent(this)" class="form-control" required>
                                                    <input type="hidden" id="parentId" name="parentId">
                                                    <input type="hidden" id="hasParent" name="hasParent" value="0">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-md-3"></div>
                                                <div class="col-md-6">
                                                    <button type="submit" class="btn btn-default">দাখিল করুন</button>
                                                    <button type="reset" class="btn btn-default">পুনরায় বসান</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../js/jquery/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu/metisMenu.min.js" type="text/javascript"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../js/custom/sb-admin-2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                // function getparent(el){
                //   console.log("click on parent");
                // }
            });
            function getparent(el) {
                console.log(el);
            }

            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);

        </script>

    </body>

</html>
