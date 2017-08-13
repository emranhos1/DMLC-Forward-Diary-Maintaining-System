<%-- 
    Document   : allNewWork
    Created on : Jun 15, 2017, 1:07:25 PM
    Author     : Md. Emran Hossain
--%>

<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>DMLC - All New Document</title>
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
                    <a class="navbar-brand" href="dashboard.jsp">DMLC Employee</a>
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
                                <a href="allNewWork.jsp"><i class="fa fa-users fa-fw"></i>সব নতুন কাজ</a>
                            </li>

                            <li>
                                <a href="allReturnWork.jsp"><i class="fa fa-users fa-fw"></i>ফিরে আসা সকল কাজ</a>
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
                        <h1 class="page-header">নতুন নথিপত্র সমূহ</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                সকল নথিপত্র দেখুন
                            </div>
                            <div class="panel-body">
                                <div id="message">
                                    <center><h3>${message}</h3></center>
                                </div>
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ক্রমিক নং</th>
                                            <th>মূল বিভাগ</th>
                                            <th>চিঠির বিষয়</th>
                                            <th>শেষ তারিখ</th>
                                            <th>ছোট বিবরণ</th>
                                            <th>অগ্রাধিকার</th>
                                            <th>স্ক্যান ফাইল</th>
                                            <th>আপনার মন্তব্য</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tebleRow">

                                    </tbody>
                                </table>
                                <div class="well">
                                    <h4>Document</h4>
                                    <p>View this Document more click on table row</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Specification Dialog-->
        <div class="modal fade" id="addSpec" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">মন্তব্য করুন ও পাঠান</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" method="post" action="../AddRecDocForEmp">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="100%" width="100%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="subjectOfLetter" class="col-sm-4 control-label">পত্রের বিষয়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="subjectOfLetter" name="subjectOfLetter" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="depOfOrigin" class="col-sm-4 control-label">মূল বিভাগ়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="depOfOrigin" name="depOfOrigin" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="endDate" class="col-sm-4 control-label">শেষ তারিখ়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="endDate" name="endDate" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="shortDesc" class="col-sm-4 control-label">ছোট বিবরণ়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="shortDesc" name="shortDesc" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example-spce">
                                    <thead>
                                        <tr>
                                            <th>ক্রমিক নং</th>
                                            <th>যারা মন্তব্য করেছেন</th>
                                            <th>মন্তব্য</th>
                                        </tr>
                                    </thead>
                                    <tbody id="spceTebleRow">

                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <label for="comment" class="col-sm-4 control-label">যাকে পাঠাতে চান</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="goingTo" id="goingTo" required>
                                        <option value="">কর্মচারী নির্বাচন করুন</option>

                                    </select>
                                </div>
                            </div>
                            <input  type="hidden" id="documentId" name="documentId" class="form-control" required/>
                            <input  type="hidden" id="letterId" name="letterId" class="form-control" required/>
                            <input  type="hidden" id="forwardingId" name="forwardingId" class="form-control" required/>
                            <center>
                                <input id="btn-confirm" type="submit" name="submit" value="পাঠান" class="btn btn-success"/>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">Cancel</span>
                                </button>
                            </center>
                        </form>
                    </div>
                </div>
            </div>
        </div>    

        <!--Specification Dialog for comment-->
        <div class="modal fade" id="addSpecComment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">মন্তব্য করুন</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" method="post" action="../InsertComment">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="100%" width="100%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="shortDesc" class="col-sm-4 control-label">আপনার মন্তব্য দিন</label>
                                <div class="col-sm-12">
                                    <textarea id="comment" name="comment" class="form-control" required></textarea>
                                </div>
                            </div>

                            <input  type="hidden" id="documentId" name="documentId" class="form-control" value=""/>

                            <center>
                                <input id="btn-confirm" type="submit" name="submit" value="মন্তব্য দিন" class="btn btn-success"/>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">Cancel</span>
                                </button>
                            </center>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Specification Dialog for return running document-->
        <div class="modal fade" id="addSpecReturn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">ফেরত পাঠান</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" method="post" action="../ReturnErrorDocument">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="100%" width="100%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="acknowledgedByEmployeeUsername" class="col-sm-4 control-label">যার কাছে ফেরত যাবে</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="acknowledgedByEmployeeUsername" name="acknowledgedByEmployeeUsername" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment" class="col-sm-4 control-label">আপনার মন্তব্য দিন</label>
                                <div class="col-sm-12">
                                    <textarea id="comment" name="comment" class="form-control" required></textarea>
                                </div>
                            </div>
                            <input  type="hidden" id="forwardedToEmployeeUsername" name="forwardedToEmployeeUsername" class="form-control" value="" readonly/>
                            <input  type="hidden" id="documentId" name="documentId" class="form-control" value=""/>
                            <input  type="hidden" id="letterId" name="letterId" class="form-control" value=""/>
                            <input  type="hidden" id="forwardingId" name="forwardingId" class="form-control" value=""/>

                            <center>
                                <input id="btn-confirm" type="submit" name="submit" value="মন্তব্য দিন" class="btn btn-success"/>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">Cancel</span>
                                </button>
                            </center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!--Specification Dialog for document computer operator-->
        <div class="modal fade" id="addSpecComtypwritter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">কম্পিউটার টাইপ রাইটার কে পাঠান</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" method="post" action="../CTRAddRecDocFor">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="100%" width="100%"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="subjectOfLetter" class="col-sm-4 control-label">পত্রের বিষয়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="subjectOfLetter" name="subjectOfLetter" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="depOfOrigin" class="col-sm-4 control-label">মূল বিভাগ়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="depOfOrigin" name="depOfOrigin" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="endDate" class="col-sm-4 control-label">শেষ তারিখ়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="endDate" name="endDate" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="shortDesc" class="col-sm-4 control-label">ছোট বিবরণ়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="shortDesc" name="shortDesc" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example-ctr">
                                    <thead>
                                        <tr>
                                            <th>ক্রমিক নং</th>
                                            <th>যারা মন্তব্য করেছেন</th>
                                            <th>মন্তব্য</th>
                                        </tr>
                                    </thead>
                                    <tbody id="ctrTebleRow">

                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group">
                                <label for="comment" class="col-sm-4 control-label">যাকে পাঠাতে চান</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="goingToCTR" id="goingToCTR" required>
                                        <option value="">কর্মচারী নির্বাচন করুন</option>

                                    </select>
                                </div>
                            </div>
                            <input  type="hidden" id="documentId" name="documentId" class="form-control" required/>
                            <input  type="hidden" id="letterId" name="letterId" class="form-control" required/>
                            <input  type="hidden" id="forwardingId" name="forwardingId" class="form-control" required/>
                            <center>
                                <input id="btn-confirm" type="submit" name="submit" value="পাঠান" class="btn btn-success"/>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">Cancel</span>
                                </button>
                            </center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <script>
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);

            $(window).on("load", function () {
                $.ajax({
                    type: "POST",
                    url: "../AllNewWorkEmp",
                    success: function (data) {
                        $("#tebleRow").show();
                        $("#tebleRow").html(data);
                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });

            $(document).on("click", ".open-spceDialog-comment", function () {

                var scanfile = $(this).data('scanfile');
                var documentid = $(this).data('documentid');

                $(".modal-body #scanFile").attr('src', '../Uplopded_file/' + scanfile);
                $(".modal-body #documentId").val(documentid);
            });

            $(document).on("click", ".open-spceDialog", function () {

                var letterid = $(this).data('letterid');
                var documentid = $(this).data('documentid');
                var currentstatus = $(this).data('currentstatus');
                var depoforigin = $(this).data('depoforigin');
                var requestid = $(this).data('requestid');
                var subjectofletter = $(this).data('subjectofletter');
                var enddate = $(this).data('enddate');
                var shortdesc = $(this).data('shortdesc');
                var scanfile = $(this).data('scanfile');
                var prioritys = $(this).data('prioritys');
                var forwardingid = $(this).data('forwardingid');

                $(".modal-body #letterId").val(letterid);
                $(".modal-body #documentId").val(documentid);
                $(".modal-body #status").val(currentstatus);
                $(".modal-body #depOfOrigin").val(depoforigin);
                $(".modal-body #requestId").val(requestid);
                $(".modal-body #subjectOfLetter").val(subjectofletter);
                $(".modal-body #endDate").val(enddate);
                $(".modal-body #shortDesc").val(shortdesc);
                $(".modal-body #prioritys").val(prioritys);
                $(".modal-body #scanFile").attr('src', '../Uplopded_file/' + scanfile);
                $(".modal-body #forwardingId").val(forwardingid);

                $.ajax({
                    type: "POST",
                    url: "../AllComment",
                    data: 'documentId=' + documentid,
                    success: function (data) {
                        $("#spceTebleRow").show();
                        $("#spceTebleRow").html(data);
                        var table = $('#dataTables-example-spce').DataTable({
                            responsive: true
                        });
                        table.destroy();
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "../AllEmpUnderEmp",
                    success: function (data) {
                        $("#goingTo").show();
                        console.log(data);
                        $("#goingTo").append(data);

                    }
                });
            });

            $(document).on("click", ".open-spceDialog-comtypwritter", function () {

                var letterid = $(this).data('letterid');
                var documentid = $(this).data('documentid');
                var currentstatus = $(this).data('currentstatus');
                var depoforigin = $(this).data('depoforigin');
                var requestid = $(this).data('requestid');
                var subjectofletter = $(this).data('subjectofletter');
                var enddate = $(this).data('enddate');
                var shortdesc = $(this).data('shortdesc');
                var scanfile = $(this).data('scanfile');
                var prioritys = $(this).data('prioritys');
                var forwardingid = $(this).data('forwardingid');

                $(".modal-body #letterId").val(letterid);
                $(".modal-body #documentId").val(documentid);
                $(".modal-body #status").val(currentstatus);
                $(".modal-body #depOfOrigin").val(depoforigin);
                $(".modal-body #requestId").val(requestid);
                $(".modal-body #subjectOfLetter").val(subjectofletter);
                $(".modal-body #endDate").val(enddate);
                $(".modal-body #shortDesc").val(shortdesc);
                $(".modal-body #prioritys").val(prioritys);
                $(".modal-body #scanFile").attr('src', '../Uplopded_file/' + scanfile);
                $(".modal-body #forwardingId").val(forwardingid);
                
                $.ajax({
                    type: "POST",
                    url: "../AllComment",
                    data: 'documentId=' + documentid,
                    success: function (data) {
                        $("#ctrTebleRow").show();
                        $("#ctrTebleRow").html(data);
                        var table = $('#dataTables-example-ctr').DataTable({
                            responsive: true
                        });
                        table.destroy();
                    }
                });
                
                $.ajax({
                    type: "POST",
                    url: "../CTRUnderDept",
                    success: function (data) {
                        $("#goingToCTR").show();
                        console.log(data);
                        $("#goingToCTR").append(data);

                    }
                });
            });
            
            $(document).on("click", "#tebleRow tr", function () {
                var letterid = $("#letterId").val();
                $.ajax({
                    type: "POST",
                    url: "../UpdateRecDoc",
                    data: 'letterId=' + letterid,
                    success: function (data) {
                        console.log(data);
                    }
                });
            });

            $(document).on("click", ".open-spceDialog-return", function () {
                var forwardedtoemployeeusername = $(this).data('forwardedtoemployeeusername');
                var acknowledgedbyemployeeusername = $(this).data('acknowledgedbyemployeeusername');
                var documentid = $(this).data('documentid');
                var letterid = $(this).data('letterid');
                var forwardingid = $(this).data('forwardingid');
                var scanfile = $(this).data('scanfile');

                $(".modal-body #forwardedToEmployeeUsername").val(forwardedtoemployeeusername);
                $(".modal-body #acknowledgedByEmployeeUsername").val(acknowledgedbyemployeeusername);
                $(".modal-body #documentId").val(documentid);
                $(".modal-body #letterId").val(letterid);
                $(".modal-body #forwardingId").val(forwardingid);
                $(".modal-body #scanFile").attr('src', '../Uplopded_file/' + scanfile);
            });
        </script>
    </body>
</html>