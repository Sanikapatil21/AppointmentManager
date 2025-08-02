<%@page import="java.sql.*" %>
<%@page import="com.r3sys.db.*" %>
<%@page import="java.time.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Appointment Manager Employee Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> 
        addEventListener("load", function() { 
            setTimeout(hideURLbar, 0); 
        }, false); 
        function hideURLbar() { 
            window.scrollTo(0, 1); 
        } 
    </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- Font CSS -->
    <link href="css/font-awesome.css" rel="stylesheet"> 
    <!-- Animate CSS -->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <!-- Webfonts -->
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!-- Metis Menu JS -->
    <script src="js/metisMenu.min.js"></script>
    <script src="js/custom.js"></script>
    <link href="css/custom.css" rel="stylesheet">
    <!-- WOW JS -->
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</head> 
<body class="cbp-spmenu-push">
    <div class="main-content">
        <!-- Left-fixed navigation -->
        <div class="sidebar" role="navigation">
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
        <!-- //Left-fixed navigation -->

        <!-- Header section -->
        <div class="sticky-header header-section">
            <div class="header-left">
                <!-- Toggle button -->
                <button id="showLeftPush"><i class="fa fa-bars"></i></button>
                <!-- Logo -->
                <div class="logo">
                    <a href="index.html">
                        <h1>Appointment Manager</h1>
                        <span>EmployeePanel</span>
                    </a>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="header-right">
                <div class="profile_details_left"><!-- Notifications menu --><div class="clearfix"></div></div>
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
        <!-- //Header section -->

        <!-- Main content -->
        <div id="page-wrapper">
            <div class="main-page">
                <div class="tables">
                    <h3 class="title1">Appointment Manager</h3>
                    <div class="bs-example widget-shadow" data-example-id="hoverable-table"> 
                        <h4>Employee Today's Appointment</h4>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>empid</th>
                                        <th>userid</th>
                                        <th>name</th>
                                        <th>designation</th>
                                        <th>department</th>
                                        <th>company name</th>
                                        <th>contact</th>
                                        <th>address</th>
                                        <th>purpose</th>
                                        <th>description</th>
                                        <th>date</th>
                                        <th>time</th>
                                        <th>email</th>
                                        <th>status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    try {
                                        LocalDate today = LocalDate.now();
                                        Date sqlDate = Date.valueOf(today);
                                        Connection connect = ConnectDB.dbcon();
                                        PreparedStatement ps = connect.prepareStatement("select * from appointment where date=?");
                                        ps.setDate(1, sqlDate);
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
        <!-- //Main content -->

        <!-- Footer -->
        <div class="footer">
            <h4>&copy; Appointment Manager. All Rights Reserved | Designed by Sanika Patil</h4>
        </div>
        <!-- //Footer -->
    </div>
    <!-- Classie -->
    <script src="js/classie.js"></script>
    <script>
        var menuLeft = document.getElementById('cbp-spmenu-s1');
        var showLeftPush = document.getElementById('showLeftPush');
        var body = document.body;

        showLeftPush.onclick = function() {
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
    <!-- Scrolling JS -->
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
    <!-- Bootstrap JS -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
