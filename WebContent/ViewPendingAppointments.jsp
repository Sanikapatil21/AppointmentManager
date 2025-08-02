<%@page import ="java.sql.*" %>
<%@page import ="com.r3sys.db.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Manager Employee Panel</title>
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Google Fonts - Roboto Condensed -->
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!-- Animate CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS for Tables -->
    <link href="css/custom-table.css" rel="stylesheet">
</head>
<body class="cbp-spmenu-push">
    <div class="main-content">
        <!-- Left Fixed Navigation -->
        <div class="sidebar" role="navigation">
            <div class="navbar-collapse">
                <!-- Sidebar Navigation Menu -->
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
                </nav>
            </div>
        </div>
        <!-- Header Section -->
        <div class="sticky-header header-section">
            <div class="header-left">
                <!-- Toggle Button -->
                <button id="showLeftPush"><i class="fa fa-bars"></i></button>
                <!-- Logo -->
                <div class="logo">
                    <a href="index.html">
                        <h1>Appointment Manager</h1>
                        <span>Employee Panel</span>
                    </a>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- Profile Section -->
            <div class="header-right">
                <div class="profile_details_left">
                    <div class="clearfix"></div>
                </div>
                <!-- Profile Dropdown Menu -->
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
        <!-- Main Content Section -->
        <div id="page-wrapper">
            <div class="main-page">
                <div class="tables">
                    <h3 class="title1">Appointment Manager</h3>
                    <div class="bs-example widget-shadow" data-example-id="hoverable-table">
                        <h4>Pending Appointments</h4>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
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
                                        <th>Action</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    try {
                                    	int id=Employee.getEmpID();
                                        Connection connect = ConnectDB.dbcon();
                                        
                                        PreparedStatement ps = connect.prepareStatement("select * from appointment where empID=? and status=?");
                                        ps.setInt(1,id);
                                        ps.setString(2, "pending");
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
                                            <td><a href="Approve.jsp?id=<%= rs.getString(1) %>" class="btn btn-success">Approve</a></td>
                                            <td><a href="Disapprove.jsp?id=<%= rs.getString(1) %>" class="btn btn-danger">Disapprove</a></td>
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
        <!-- Footer Section -->
        <div class="footer">
            <h4>&copy; Appointment Manager. All Rights Reserved | Designed by Sanika Patil</h4>
        </div>
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
    <!-- Scrolling JS -->
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
    <!-- Bootstrap JS -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
