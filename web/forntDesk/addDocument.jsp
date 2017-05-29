<%-- 
    Document   : addDocument
    Created on : May 29, 2017, 11:36:12 AM
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

        <title>DMLC - Add Document</title>
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

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">DMLC FrontDesk</a>
                </div>

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
                        <!-- /.dropdown-messages -->
                    </li>
                    <!-- /.dropdown -->
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
                        <!-- /.dropdown-tasks -->
                    </li>
                    <!-- /.dropdown -->
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
                        <!-- /.dropdown-alerts -->
                    </li>
                    <!-- /.dropdown -->
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
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>


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
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-dashboard fa-fw"></i> ড্যাশবোর্ড</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-file-o fa-fw"></i> নতুন ফাইল</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> সকল ফাইল</a>
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

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">নথিপত্র</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                নতুন নথিপত্র সৃষ্টি করুন
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-6">
                                        <form action="" method="post" role="form" class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="subject">বিষয়</label>
                                                <div class="col-md-9">
                                                    <input id="subject" name="subject" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="description">বিবরণ</label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control" name="description" id="desc" required></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="scanfile">স্ক্যান ফাইল</label>
                                                <div class="col-md-9">
                                                    <input type="file" id="scanfile" name="scanfile" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="requestId">অনুরোধ আইডি</label>
                                                <div class="col-md-9">
                                                    <input id="requestId" name="requestId" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="depOfOrigin">উত্পত্তি বিভাগ</label>
                                                <div class="col-md-9">
                                                    <input id="depOfOrigin" name="depOfOrigin" class="form-control" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="endDate">শেষ তারিখ</label>
                                                <div class="col-md-9">
                                                    <input id="endDate" name="endDate" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="status">অবস্থা</label>
                                                <div class="col-md-9">
                                                    <select class="form-control" name="status" id="status" required>
                                                        <option value="">নির্বাচন করুন</option>
                                                        <option value="1">সক্রিয়</option>
                                                        <option value="0">নিষ্ক্রিয়</option>
                                                    </select>
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
        <script src="../allStyles/js/jquery/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../allStyles/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../allStyles/js/metisMenu/metisMenu.min.js" type="text/javascript"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../allStyles/js/custom/sb-admin-2.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                // function getparent(el){
                //   console.log("click on parent");
                // }
            });
            function getparent(el) {
                console.log(el);
            }


        </script>

    </body>

</html>

