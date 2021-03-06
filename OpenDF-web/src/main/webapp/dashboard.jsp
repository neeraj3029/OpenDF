<% Object idUser = session.getAttribute("user"); if(idUser == null ) response.sendRedirect("login.jsp");%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" ng-app="OpenDFApp">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>OpenDF - Digital Forensics Cloud Tool</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/styles.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="css/plugins/timeline.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body  ng-init="" ng-controller="dashboardController">

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top main-menu" role="navigation" style="margin-bottom: 0;z-index: 10000">
                <div class="navbar-header">
                    
                    <a class="navbar-brand" href="index.jsp">OpenDF
                        <small class="title">/ {{sectionTitle}}</small>
                    </a>

                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                <!--<li class="dropdown" ng-controller="processesController">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="">
                            <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-tasks">
                            <li ng-repeat-start="(key, value) in processes ">
                                <a href="#">
                                    <div>
                                        <p>
                                            <strong >{{value.name}}</strong>
                                            <span class="pull-right text-muted">{{value.percentage}}% Complete</span>
                                        </p>
                                        <div class="progress progress-striped active">
                                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="{{value.percentage}}" aria-valuemin="0" aria-valuemax="100" style="width: {{value.percentage}}%">
                                                <span class="sr-only">{{value.percentage}}% Complete (success)</span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="divider" ng-repeat-end></li>
                            
                            <li ng-show="isEmpty()">
                                <a href="#">
                                    <div>
                                        <p> No active processes at the moment! </p>
                                    </div>
                                </a>
                            </li>
                            <li class="divider" ng-show="isEmpty()"></li>
                            <li>
                                <a class="text-center" href="#">
                                    <strong>See All Tasks</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </li>-->
                    <!-- /.dropdown -->
                    <!--<li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell fa-fw"></i> 
                            <span class="notification-counter">3</span> 
                            <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts" ng-controller="NotificationController">
                            <li>
                                <a href="#" ng-repeat="notification in notifications">
                                    <div>
                                        <i class="fa fa-comment fa-fw"></i> {{notification[index].quantity}} {{notification[index].type}}
                                        <span class="pull-right text-muted small">{{notification[index].time}} minutes ago</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            
                        </ul>
                    </li>-->
                    <ul class="nav navbar-top-links navbar-right">
                    
                    <li ng-controller="notificationsController">
                        <a  href="#/{{idProject}}/settings/notifications">
                            <i class="fa fa-bell-o"></i> Notifications 
                            <span class="notification-counter" ng-show="notifications.length">{{notifications.length}}</span> 
                        </a>
                    </li>
                    <li>
                        <a  href="Logout">
                            <i class="fa fa-sign-out"></i> Logout
                        </a>
                    </li>
                </ul>
                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu" ng-controller="userController">
                            <li class="sidebar-user" >
                                <div class="row">
                                    <div class="col-lg-4" >
                                        <img ng-src="{{user.avatar}}" ></div>
                                    <div class="col-lg-8" ><h4 >{{user.name}}</h4></div>                         
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li class="active">
                                <a href="#/{{idProject}}/"> Dashboard</a>
                            </li>
                            <li>
                                <a href="#/{{idProject}}/browse-by-hierarchy/-1"> File System<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#/{{idProject}}/browse-by-hierarchy/-1"><i class="fa fa-sitemap"></i> Browse by hierarchy </a>
                                    </li>
                                    <li>
                                        <a href="#/{{idProject}}/browse-by-type/"><i class="fa fa-files-o"></i> Browse by file type</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#/{{idProject}}/bookmarks"> Notes</a>
                            </li>
                            <li>
                                <a href="#/{{idProject}}/reports"> Reports</a>
                            </li>
                            <li>
                                <a href=""> Settings<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#/{{idProject}}/disk-images"><i class="fa fa-hdd-o"></i> Disk Images</a>
                                    </li>
                                    <li>
                                        <a href="notifications.html"><i class="fa fa-bell-o"></i> Notifications</a>
                                    </li>
                                    <li>
                                        <a href="#/{{idProject}}/settings/modules"><i class="fa fa-cube"></i> Modules</a>
                                    </li>
                                    <li>
                                        <a href="#/{{idProject}}/settings/investigators"><i class="fa fa-user-secret"></i> Investigators</a>
                                    </li>
                                    <li>
                                        <a href="#/{{idProject}}/settings/project"><i class="fa fa-cog"></i> Project</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="context-wrapper" class="ng-view">

            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery Version 1.11.0 -->
        <script src="js/jquery-1.11.0.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/plugins/ngUpload/angular-file-upload-shim.min.js"></script> 
        <!-- AngularJS  JavaScript -->
        <script src="js/angular.js"></script>
        <script src="js/angular-route.js"></script>
        <script src="js/angular-resource.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="js/main.js"></script>
        
        <script src="js/plugins/ngUpload/angular-file-upload.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="js/dashboard.js"></script>
        
    </body>

</html>

