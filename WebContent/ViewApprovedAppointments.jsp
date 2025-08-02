<%@page import ="java.sql.*" %>
<%@page import ="com.r3sys.db.* " %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Appointment Manager Employee Panel </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
<style>
    /* Custom styles for the table */
    .widget-shadow {
        margin-top: 20px;
    }
    .widget-shadow h4 {
        margin-bottom: 20px;
    }
    .table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        background-color: #fff;
        box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14);
        border-radius: 4px;
        overflow: hidden;
    }
    .table th,
    .table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    .table thead th {
        background-color: #f5f5f5;
        color: #333;
        font-weight: bold;
        vertical-align: middle;
    }
    .table-striped tbody tr:nth-of-type(odd) {
        background-color: #f9f9f9;
    }
    .table-striped tbody tr:nth-of-type(even) {
        background-color: #fff;
    }
    .table-striped tbody tr:hover {
        background-color: #f5f5f5;
    }
</style>
</head> 
<body class="cbp-spmenu-push">
<div class="main-content">
    <!--left-fixed -navigation-->
    <div class="sidebar" role="navigation">
        <div class="navbar-collapse">
            <nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="EmployeeLogin.html"><i class="fa fa-check-square-o nav_icon"></i>Employee LogIn</a>
                    </li>
                    <li>
                        <a href="ViewPendingAppointments.jsp"><i class="fa fa-table nav_icon"></i>View Pending Appointments</a>
                    </li>
                    <li>
                        <a href="ViewApprovedAppointments.jsp"><i class="fa fa-cogs nav_icon"></i>View Approved Appointments</a>
                    </li>
                    <li>
                        <a href="ViewDisapprovedAppointments.jsp"><i class="fa fa-table nav_icon"></i>View Disapproved Appointments</a>
                    </li>
                    <li>
                        <a href="TodayAppoinment.jsp"><i class="fa fa-table nav_icon"></i>View Today's Appointments</a>
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-table nav_icon"></i>Go to HomePage</a>
                    </li>
                </ul>
                <div class="clearfix"></div>
                <!-- //sidebar-collapse -->
            </nav>
        </div>
    </div>
    <!--left-fixed -navigation-->
    <!-- header-starts -->
    <div class="sticky-header header-section">
        <div class="header-left">
            <!--toggle button start-->
            <button id="showLeftPush"><i class="fa fa-bars"></i></button>
            <!--toggle button end-->
            <!--logo -->
            <div class="logo">
                <a href="index.html">
                    <h1>Appointment Manager</h1>
                    <span>EmployeePanel</span>
                </a>
            </div>
            <!--//logo-->
            <div class="clearfix"></div>
        </div>
        <div class="header-right">
            <div class="profile_details_left"><!--notifications of menu start -->
                <div class="clearfix"></div>
            </div>
            <!--notification menu end -->
            <div class="profile_details">     
                <ul>
                    <li class="dropdown profile_details_drop">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <div class="profile_img">    
                                <div class="user-name">
                                    <p>Welcome</p>
                                    <span>Administrator</span>
                                </div>
                                <i class="fa fa-angle-down lnr"></i>
                                <i class="fa fa-angle-up lnr"></i>
                                <div class="clearfix"></div>    
                            </div>    
                        </a>
                        <ul class="dropdown-menu drp-mnu">
                            <li><a href="EmployeeLogin.html"><i class="fa fa-sign-out"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="clearfix"></div>    
        </div>
        <div class="clearfix"></div>    
    </div>
    <!-- //header-ends -->
    <!-- main content start-->
    <div id="page-wrapper">
        <div class="main-page">
            <div class="tables">
                <h3 class="title1">Appointment Manager</h3>
                <div class="bs-example widget-shadow" data-example-id="hoverable-table"> 
                    <h4>Approved Appointments</h4>
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Employee ID</th>
                                    <th>User ID</th>
                                    <th>Name</th>
                                    <th>Designation</th>
                                    <th>Department</th>
                                    <th>Company Name</th>
                                    <th>Contact</th>
                                    <th>Address</th>
                                    <th>Purpose</th>
                                    <th>Description</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                try {
                                	int id=Employee.getEmpID();
                                    Connection connect = ConnectDB.dbcon();
                                    
                                    PreparedStatement ps = connect.prepareStatement("select * from appointment where empID=? and status=?");
                                    ps.setInt(1,id);
                                    ps.setString(2, "Approved");
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getString("id") %></td>
                                    <td><%= rs.getString("empID") %></td>
                                    <td><%= rs.getString("userID") %></td>
                                    <td><%= rs.getString("name") %></td>
                                    <td><%= rs.getString("designation") %></td>
                                    <td><%= rs.getString("department") %></td>
                                    <td><%= rs.getString("companyName") %></td>
                                    <td><%= rs.getString("contact") %></td>
                                    <td><%= rs.getString("address") %></td>
                                    <td><%= rs.getString("purpose") %></td>
                                    <td><%= rs.getString("description") %></td>
                                    <td><%= rs.getString("date") %></td>
                                    <td><%= rs.getString("time") %></td>
                                    <td><%= rs.getString("email") %></td>
                                    <td><%= rs.getString("status") %></td>
                                </tr>
                                <% 
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer-->
    <div class="footer">
        <h4>&copy; Appointment Manager. All Rights Reserved | Designed by Sanika Patil </h4>
    </div>
    <!--//footer-->
</div>
<!-- Classie -->
<script src="js/classie.js"></script>
<script>
    var menuLeft = document.getElementById('cbp-spmenu-s1'),
        showLeftPush = document.getElementById('showLeftPush'),
        body = document.body;

    showLeftPush.onclick = function () {
        classie.toggle(this, 'active');
        classie.toggle(body, 'cbp-spmenu-push-toright');
        classie.toggle(menuLeft, 'cbp-spmenu-open');
        disableOther('showLeftPush');
    };

    function disableOther(button) {
        if (button !== 'showLeftPush') {
            classie.toggle(showLeftPush, 'disabled');
        }
    }
</script>
<!--scrolling js-->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"></script>
</body>
</html>
