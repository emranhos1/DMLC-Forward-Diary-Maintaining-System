<%-- 
    Document   : addOrganogram
    Created on : May 30, 2017, 10:40:58 AM
    Author     : Md. Emran Hossain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dao.SelectQueryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DMLC - All Organogram</title>
        <!-- Bootstrap Core CSS -->
        <link href="../allStyles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- MetisMenu CSS -->
        <link href="../allStyles/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="../allStyles/dist/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Fonts -->
        <link href="../allStyles/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- DataTables CSS -->
        <link href="../allStyles/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- DataTables Responsive CSS -->
        <link href="../allStyles/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery -->
        <script src="../allStyles/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../allStyles/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../allStyles/vendor/metisMenu/metisMenu.min.js" type="text/javascript"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../allStyles/dist/js/sb-admin-2.js" type="text/javascript"></script>
        <!-- DataTables JavaScript -->
        <script src="../allStyles/vendor/datatables/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/datatables-plugins/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/datatables-responsive/dataTables.responsive.js" type="text/javascript"></script>
    </head>

    <body>
        <%
            if ((session.getAttribute("idUser") == null) || (session.getAttribute("idUser") == "")) {
                response.sendRedirect("../login.jsp");
            } else {%>
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
                    <a class="navbar-brand" href="dashboard.jsp">DMLC Web Admin</a>
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
                            <li><a href="userProfile.jsp"><i class="fa fa-user fa-fw"></i> ব্যবহারকারী প্রোফাইল</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> সেটিংস</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> প্রস্থান</a>
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
                                <a href="dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> ড্যাশবোর্ড</a>
                            </li>

                            <li>
                                <a href="addOrganogram.jsp"><i class="fa fa-users fa-fw"></i> নতুন অর্গানোগ্রাম</a>
                            </li>

                            <li>
                                <a href="allOrganogram.jsp"><i class="fa fa-users fa-fw"></i> সকল অর্গানোগ্রাম</a>
                            </li>

                            <li>
                                <a href="addEmployee.jsp"><i class="fa fa-user fa-fw"></i> নতুন কর্মচারী</a>
                            </li>

                            <li>
                                <a href="allEmployee.jsp"><i class="fa fa-user fa-fw"></i> সকল কর্মচারী</a>
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
                            <li>
                                <a href="../logout.jsp"><i class="fa fa-user fa-fw"></i>প্রস্থান
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            <!--Page Body Part-->
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
                                সকল অর্গানোগ্রাম দেখুন
                            </div>
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>SL</th>
                                            <th>Designation</th>
                                            <th>Department</th>
                                            <th>Has Parent</th>
                                            <th>Parent</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tebleRow">
                                        <tr>
                                            <td>1</td>
                                            <td>মহাপরিচালক</td>
                                            <td>প্রশাসন</td>
                                            <td>না</td>
                                            <td>না</td>
                                            <td></td>
                                        </tr>

                                    </tbody>
                                </table>
                                <!-- /.table-responsive -->
                                <div class="well">
                                    <h4>Organugram</h4>
                                    <p>View this organugram <a href="#">Click Here</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Specification Dialog-->
        <div class="modal fade" id="newSpec" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">অর্গানোগ্রাম পরিবর্তন করুন</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" method="post" action="">
                            <div class="form-group">
                                <label for="designation" class="col-sm-8 control-label">উপাধি</label>
                                <div class="col-sm-8">
                                    <input type="text" name="designation" value="" id="designation" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="department" class="col-sm-8 control-label">বিভাগ</label>
                                <div class="col-sm-8">
                                    <input type="text" name="department" value="" id="department" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="pdesignation" class="col-sm-8 control-label">ঊর্ধ্বতন পদ</label>
                                <div class="col-sm-8">
                                    <input type="text" name="pdesignation" value="" id="pdesignation" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <center>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">Cancel</span>
                                    </button>
                                    <input type="submit" name="submit" value="Update"  class="btn btn-large btn-primary" />
                                </center>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "../AllOrganogramBean",
                    success: function (data) {
                        $("#tebleRow").show();
                        $("#tebleRow").append(data);

                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });

            $(document).on("click", ".open-newDialog", function () {

                var designation = $(this).data('designation');
                var department = $(this).data('department');
                var pdesignation = $(this).data('pdesignation');
                console.log(designation);
                console.log(department);
                console.log(pdesignation);

                $(".modal-body #designation").val(designation);
                $(".modal-body #department").val(department);
                $(".modal-body #pdesignation").val(pdesignation);
            });
        </script>
    </body>
</html>

