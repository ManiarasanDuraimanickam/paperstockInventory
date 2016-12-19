<#include "header.ftl"/>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Paper Stock</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <!-- logged in user profiles and other stuffs here-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${(PSIDatavo.userinfo.username)!"User"} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="/paperstock/authenticate?logout=true"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            
            <div class="collapse navbar-collapse navbar-ex1-collapse">
               <#include "navigationmenus.ftl"/>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <small><i class="fa fa-edit"></i> Report</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                <div class="col-lg-6 col-md-6 col-xs-12">
                <#assign index=0/>
                 <#list PSIDatavo.stockDetails as stockdetail>
	                 <#list stockdetail.paperDetail as paperdetail>
	                 <#assign index=index+1/>
	                 	<div class="col-lg-6 col-md-6">
                     		<div class="panel <#if (paperdetail.stock?eval gt 130)>panel-green<#elseif (paperdetail.stock?eval gt 100 )>panel-primary<#elseif (paperdetail.stock?eval gt 50 )>panel-yellow<#elseif (paperdetail.stock?eval < 50 )> panel-red</#if>">
	                            <div class="panel-heading">
	                                <div class="row">
	                                    <div class="col-xs-3">
	                                        <i class="fa fa-comments fa-2x"></i>
	                                        ${stockdetail.millname!}
											<div>
												<ul style="padding-left: 1em;margin: 0;">
				                                    <li>${paperdetail.gsm!}GSM</li>
				                                    <li>${paperdetail.size!}</li>
		                                    	</ul>
											</div>
	                                    </div>
	                                    
	                                    <div class="col-xs-9 text-right">
	                                        <div class="huge">${paperdetail.stock!}kg</div>
	                                        <div>${paperdetail.grade!}</div>
	                                    </div>
	                                </div>
	                            </div>
	                            <a href="#">
	                                <div class="panel-footer">
	                                    <span class="pull-left">View Details</span>
	                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
	                                    <div class="clearfix"></div>
	                                </div>
	                            </a>
		                      </div>
		                  </div>
	                 </#list>
                 </#list>
				</div>
				<div class="col-lg-6 col-md-6 col-xs-12">
					<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
		                     	 <thead>
		                     	 	<tr>
		                     	 		<th>Sno</th>
		                     	 		<th>Mill</th>
		                     	 		<th>Gsm</th>
		                     	 		<th>Grade</th>
		                     	 		<th>Size</th>
		                     	 		<th>opening</th>
		                     	 		<th>Purchase</th>
		                     	 		<th>StockOut</th>
		                     	 		<th>closing</th>
		                     	 		<th>Created</th>
		                     	 	</tr>
		                     	 </thead>
		                     	 <tbody>
		                     	 	<#assign index=0/>
		                     	 	<#list last30DaysTrans as milldetails>
		                     	 		<#list milldetails.paperDetail as paperdetails>
		                     	 		<#assign index=index+1/>
		                     	 		<tr>
			                     	 		<td id="millid_${paperdetails_index}" mill="${milldetails.millid}">${index!}</td>
			                     	 		<td id="millname_${paperdetails_index}">${milldetails.millname!}</td>
			                     	 		<td id="gsm_${paperdetails_index}">${paperdetails.gsm!}</td>
			                     	 		<td id="grade_${paperdetails_index}">${paperdetails.grade!}</td>
			                     	 		<td id="size_${paperdetails_index}">${paperdetails.size!}</td>
			                     	 		<td id="opening_${paperdetails_index}">${paperdetails.opening!}</td>
			                     	 		<td id="stockin_${paperdetails_index}">${paperdetails.stockIn!0}</td>
			                     	 		<td id="stockout_${paperdetails_index}">${paperdetails.stockOut!0}</td>
			                     	 		<td id="closing_${paperdetails_index}">${paperdetails.closing!}</td>
			                     	 		<td id="created_${paperdetails_index}">${paperdetails.createdon!}</td>
			                     	 	</tr>
		                     	 		</#list>
		                     	 	</#list>
		                     	 </tbody>
						</table>
					</div>
				</div>
                </div>
                   <!-- <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">12</div>
                                        <div>New Tasks!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">124</div>
                                        <div>New Orders!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">13</div>
                                        <div>Support Tickets!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>-->
                <!-- /.row -->
	<!--waves chart--
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Area Chart</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-area-chart"></div>
                            </div>
                        </div>
                    </div>
                </div-->
                <!-- /.row -->
<!--waves chart-- circle chart--
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-long-arrow-right fa-fw"></i> Donut Chart</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                                <div class="text-right">
                                    <a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!-- task panel
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Tasks Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="list-group">
                                    <a href="#" class="list-group-item">
                                        <span class="badge">just now</span>
                                        <i class="fa fa-fw fa-calendar"></i> Calendar updated
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">4 minutes ago</span>
                                        <i class="fa fa-fw fa-comment"></i> Commented on a post
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">23 minutes ago</span>
                                        <i class="fa fa-fw fa-truck"></i> Order 392 shipped
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">46 minutes ago</span>
                                        <i class="fa fa-fw fa-money"></i> Invoice 653 has been paid
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">1 hour ago</span>
                                        <i class="fa fa-fw fa-user"></i> A new user has been added
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">2 hours ago</span>
                                        <i class="fa fa-fw fa-check"></i> Completed task: "pick up dry cleaning"
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">yesterday</span>
                                        <i class="fa fa-fw fa-globe"></i> Saved the world
                                    </a>
                                    <a href="#" class="list-group-item">
                                        <span class="badge">two days ago</span>
                                        <i class="fa fa-fw fa-check"></i> Completed task: "fix error on sales page"
                                    </a>
                                </div>
                                <div class="text-right">
                                    <a href="#">View All Activity <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!-- transaction panel--
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Transactions Panel</h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>Order #</th>
                                                <th>Order Date</th>
                                                <th>Order Time</th>
                                                <th>Amount (USD)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>3326</td>
                                                <td>10/21/2013</td>
                                                <td>3:29 PM</td>
                                                <td>$321.33</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
                                                <td>10/21/2013</td>
                                                <td>3:20 PM</td>
                                                <td>$234.34</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
                                                <td>10/21/2013</td>
                                                <td>3:03 PM</td>
                                                <td>$724.17</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
                                                <td>10/21/2013</td>
                                                <td>3:00 PM</td>
                                                <td>$23.71</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
                                                <td>10/21/2013</td>
                                                <td>2:49 PM</td>
                                                <td>$8345.23</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
                                                <td>10/21/2013</td>
                                                <td>2:23 PM</td>
                                                <td>$245.12</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
                                                <td>10/21/2013</td>
                                                <td>2:15 PM</td>
                                                <td>$5663.54</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
                                                <td>10/21/2013</td>
                                                <td>2:13 PM</td>
                                                <td>$943.45</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="text-right">
                                    <a href="#">View All Transactions <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    </body>
    </html>