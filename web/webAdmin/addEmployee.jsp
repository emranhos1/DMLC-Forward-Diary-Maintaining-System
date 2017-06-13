<%-- 
    Document   : addEmployee
    Created on : May 25, 2017, 11:49:29 AM
    Author     : Md. Emran Hossain
--%>

<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>DMLC - Add Employee</title>
        <!-- Bootstrap Core CSS -->
        <link href="../allStyles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- MetisMenu CSS -->
        <link href="../allStyles/vendor/metisMenu/metisMenu.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom CSS -->
        <link href="../allStyles/dist/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Fonts -->
        <link href="../allStyles/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery -->
        <script src="../allStyles/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../allStyles/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="../allStyles/vendor/metisMenu/metisMenu.min.js" type="text/javascript"></script>
        <!-- Custom Theme JavaScript -->
        <script src="../allStyles/dist/js/sb-admin-2.js" type="text/javascript"></script>

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
                    <a class="navbar-brand" href="index.html">DMLC Web Admin</a>
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
                        <h1 class="page-header">কর্মচারী</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                নতুন কর্মচারী সৃষ্টি করুন
                            </div>

                            <div id="message">
                                <center><h3>${addEmpInfo}</h3></center>
                            </div>

                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-offset-2 col-md-6">
                                        <form role="form" action="../AddEmployeeBean" method="post" class="form-horizontal">
                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="uName">ইউজারনেম</label>
                                                <div class="col-md-9">
                                                    <input type="text" id="uName" name="uName" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="password">পাসওয়ার্ড</label>
                                                <div class="col-md-9">
                                                    <input type="password" id="password" name="password" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="fullName">পুরো নাম</label>
                                                <div class="col-md-9">
                                                    <input type="text" id="fullName" name="fullName" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="address">ঠিকানা</label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control" name="address" id="address" required></textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="cellNo">মোবাইল নম্বর</label>
                                                <div class="col-md-9">
                                                    <input type="text" id="cellNo" name="cellNo" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="email">ইমেইল</label>
                                                <div class="col-md-9">
                                                    <input type="email" id="email" name="email" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group hidden">
                                                <div class="col-md-9">
                                                    <input type="hidden" id="task" name="task" value="0" class="form-control" required>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label" for="designation">বিভাগ এবং পদবী</label>
                                                <div class="col-md-9">
                                                    <select class="form-control" name="designation" id="designation" required>
                                                        <option value="0">নির্বাচন করুন</option>
                                                        <%
                                                            int i = 0;
                                                            ResultSet rs;
                                                            String columnName = "*";
                                                            String tableName = "employee_organogram";
                                                            rs = SelectQueryDao.selectQueryWithOutWhereClause(columnName, tableName);
                                                            rs.last();
                                                            int orgRow = rs.getRow();
                                                            int[] empOrgId = new int[orgRow];
                                                            String[] designation = new String[orgRow];
                                                            String[] department = new String[orgRow];
                                                            int[] hasParent = new int[orgRow];
                                                            int[] parentId = new int[orgRow];
                                                            rs.beforeFirst();
                                                            while (rs.next()) {
                                                                empOrgId[i] = rs.getInt("employee_organogram_id");
                                                                designation[i] = rs.getString("designation");
                                                                department[i] = rs.getString("department");
                                                                hasParent[i] = rs.getInt("has_parent");
                                                                parentId[i] = rs.getInt("parent_id");
                                                                i++;
                                                            }
                                                            for (i = 0; i < orgRow; i++) {
                                                        %>
                                                        <option value="<%=empOrgId[i]%>"><%=designation[i]%> (<%=department[i]%>)</option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                    <input type="hidden" id="empOrgId" name="empOrgId" class="form-control" required>
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
        
        <script type="text/javascript">
            $("#designation").change(function () {
                var empOrgId = $(this).val();
                $("#empOrgId").val(empOrgId);
            });
            
            function getrole(el) {
                console.log(el);
            }

            setTimeout(function () {
                $('#message').fadeOut('slow');
            }, 2000);
        </script>
    </body>
</html>

