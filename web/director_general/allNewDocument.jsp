<%-- 
    Document   : allNewDocument
    Created on : Jun 5, 2017, 1:07:25 PM
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
                    <a class="navbar-brand" href="dashboard.jsp">DMLC মহাপরিচালক</a>
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
                                <a href="allNewDocument.jsp"><i class="fa fa-users fa-fw"></i>নতুন নথি সমুহ</a>
                            </li>
                            <li>
                                <a href="runningDocument.jsp"><i class="fa fa-users fa-fw"></i>চলমান নথি সমুহ</a>
                            </li>
                            <li>
                                <a href="runningReturnDocument.jsp"><i class="fa fa-users fa-fw"></i>চলমান ফেরত নথি</a>
                            </li>
                            <li>
                                <a href="endDocument.jsp"><i class="fa fa-user fa-fw"></i>শেষ নথি সমুহ</a>
                            </li>
                            <li>
                                <a href="../logout.jsp"><i class="fa fa-user fa-fw"></i>প্রস্থান</a>
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
                            <div id="message">
                                <center><h3>${message}</h3></center>
                            </div>
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>ক্রমিক নং</th>
                                            <th>বর্তমান অবস্থা</th>
                                            <th>প্রাপ্তির তারিখ</th>
                                            <th>মূল বিভাগ</th>
                                            <th>অনুরোধ আইডি</th>
                                            <th>চিঠি বিষয়</th>
                                            <th>শেষ তারিখ</th>
                                            <th>নথি আইডি</th>
                                            <th>ছোট বিবরণ</th>
                                            <th>স্ক্যান ফাইল</th>
                                            <th>অগ্রাধিকার</th>
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
                        <h4 class="modal-title" id="myModalLabel">অগ্রাধিকার নির্ধারন কর</h4>
                    </div>
                    <div class="modal-body">
                        <form role="form" class="form-horizontal" method="post" action="../AddReceivesDocument">
                            <div class="form-group">
                                <label for="status" class="col-sm-4 control-label">অবস্থা</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="status" name="status" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="subjectOfLetter" class="col-sm-4 control-label">পত্রের বিষয়</label>
                                <div class="col-sm-8">
                                    <input  type="text" id="subjectOfLetter" name="subjectOfLetter" class="form-control" value="" readonly/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="scanFile" class="col-sm-4 control-label">স্ক্যান ফাইল</label>
                                <div class="col-sm-8">
                                    <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="300px" width="300px"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment" class="col-sm-4 control-label">আপনার মন্তব্য</label>
                                <div class="col-sm-8">
                                    <textarea id="comment" name="comment" class="form-control" value="" required></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="priority" class="col-sm-4 control-label">অগ্রাধিকার</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="priority" id="priority" required>
                                        <option value="">নির্বাচন করুন</option>
                                        <option value="1">উচ্চ</option>
                                        <option value="2">মাঝারি</option>
                                        <option value="3">নিম্ন</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment" class="col-sm-4 control-label">যাকে পাঠাতে চান</label>
                                <div class="col-sm-8">
                                    <select class="form-control" name="goingTo" id="goingTo" required>
                                        <option value="">কর্মচারী নির্বাচন করুন</option>
                                        <%
                                            int i = 0;
                                            ResultSet rs;
                                            int user_Id = Integer.parseInt(session.getAttribute("idUser").toString());
                                            String columnName = " * ";
                                            String tableName = " employee_emp_org ";
                                            String whereCondition = " parent_id = '" + user_Id + "'";
                                            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
                                            rs.last();
                                            int orgRow = rs.getRow();
                                            int[] employeeId = new int[orgRow];
                                            int[] empOrgId = new int[orgRow];
                                            String[] uName = new String[orgRow];
                                            String[] designation = new String[orgRow];
                                            String[] department = new String[orgRow];
                                            int[] hasParent = new int[orgRow];
                                            int[] parentId = new int[orgRow];
                                            rs.beforeFirst();
                                            while (rs.next()) {
                                                employeeId[i] = rs.getInt("employee_id");
                                                uName[i] = rs.getString("user_name");
                                                empOrgId[i] = rs.getInt("employee_organogram_id");
                                                designation[i] = rs.getString("designation");
                                                department[i] = rs.getString("department");
                                                hasParent[i] = rs.getInt("has_parent");
                                                parentId[i] = rs.getInt("parent_id");
                                                i++;
                                            }
                                            for (i = 0; i < orgRow; i++) {
                                        %>
                                        <option value="<%=employeeId[i]%>"><%=uName[i]%> : <%=designation[i]%> (<%=department[i]%>)</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <input type="hidden" id="letterId" name="letterId" class="form-control" required>
                            </div>
                            <center>
                                <input id="btn-confirm" type="submit" name="submit" value="Confirm" class="btn btn-success"/>
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
                $('#message').fadeOut('slow');
            }, 2000);
            
            $(window).on("load", function () {
                $.ajax({
                    type: "POST",
                    url: "../AllNewDocument",
                    success: function (data) {
                        $("#tebleRow").show();
                        $("#tebleRow").html(data);
                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });

            $(document).on("click", ".open-spceDialog", function () {

                var letterId = $(this).data('letterid');
                var status = $(this).data('status');
                var receivingDate = $(this).data('receivingdate');
                var depOfOrigin = $(this).data('depoforigin');
                var requestId = $(this).data('requestid');
                var subjectOfLetter = $(this).data('subjectofletter');
                var endDate = $(this).data('enddate');
                var documentId = $(this).data('documentid');
                var shortDesc = $(this).data('shortdesc');
                var scanFile = $(this).data('scanfile');

                $(".modal-body #letterId").val(letterId);
                $(".modal-body #status").val(status);
                $(".modal-body #receivingDate").val(receivingDate);
                $(".modal-body #depOfOrigin").val(depOfOrigin);
                $(".modal-body #requestId").val(requestId);
                $(".modal-body #subjectOfLetter").val(subjectOfLetter);
                $(".modal-body #endDate").val(endDate);
                $(".modal-body #documentId").val(documentId);
                $(".modal-body #shortDesc").val(shortDesc);
                $(".modal-body #scanFile").attr('src', '../Uplopded_file/' + scanFile);
            });
        </script>
    </body>
</html>