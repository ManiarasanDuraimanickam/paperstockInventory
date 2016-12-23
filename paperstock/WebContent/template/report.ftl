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
                        <h4 class="page-header">
                            <i class="fa fa-edit"></i> Report
                        </h4>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-lg-6 col-md-6 col-xs-6">
                	<div style="text-align:right">
                		<input value="search" type="button" class="btn-search-own" id="search"/>
                	</div>
                	</div>
                	<div class="col-lg-6 col-md-6 col-xs-12">
                		<#include "/linked-datepicker.ftl"/>
                	</div>
                </div>
                <div class="clear">
                </div>
                <div class="row">
                <div class="col-lg-6 col-md-6 col-xs-12" style="max-height:450px;overflow:auto">
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
					<table id="subsituteHeader" class="hide table-bordered theadBgColor subsitituteHeader">
                     <thead>
	                	 <tr>
	                		<th id="millid">Sno</th>
	             	 		<th id="name">Mill</th>
	             	 		<th id="gsm">Gsm</th>
	             	 		<th id="grade">Grade</th>
	             	 		<th id="size">Size</th>
	             	 		<th id="opening">opening</th>
	             	 		<th id="purchase">Purchase</th>
	             	 		<th id="stock-out">Stock-out</th>
	             	 		<th id="closing">closing</th>
	             	 		<th id="created">Created</th>
	                        </tr>
	                	 </thead>
                     </table>
		                <div id="reportdetailDiv" class="table-responsive table-fixed-height412px" style="max-height:450px">
	                     	<table id="reportdetailTBL" class="table table-bordered table-hover theadBgColor">
		                     	 <thead>
		                     	 	<tr>
		                     	 		<th id="millid">Sno</th>
				             	 		<th id="name">Mill</th>
				             	 		<th id="gsm">Gsm</th>
				             	 		<th id="grade">Grade</th>
				             	 		<th id="size">Size</th>
				             	 		<th id="opening">opening</th>
				             	 		<th id="purchase">Purchase</th>
				             	 		<th id="stock-out">Stock-out</th>
				             	 		<th id="closing">closing</th>
				             	 		<th id="created">Created</th>
		                     	 	</tr>
		                     	 </thead>
		                     	 <tbody id="reportdetailTBLBD">
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
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
<script type="text/javascript">
$(document).ready(function(){
searchRecord();
detectreportdetailDivScroll();
});
function searchRecord(){
	$("input#search").click(function(){
		var startDate=$("input[name=startDate]").val();
		var endDate=$("input[name=endDate]").val();
		if(startDate ===undefined || startDate.length===0 || endDate===undefined || endDate.length===0){
		alert("please select Start and End Date");
		return false;
		}
		var url="http://localhost:8080/paperstock/report";
		var data="startDate="+startDate+"&endDate="+endDate;
		$.ajax({
		url:url,
		type:"GET",
		data:data,
		dataType:"json",
		success:function(data){successFn(data);},
		error:function(data){errorFn(data);}
		});
	});
	
	var successFn=function(response){
		var tblBody=$("tbody#reportdetailTBLBD");
		tblBody.html("");
		if(response===undefined || response.length===0){
			tblBody.html("<tr><td colspan=\"5\">No record found....</td></tr>");
			return false;
		}
		var details="";
		var index=0;
		response.forEach(function(data){
			var paper=data.paperDetail;
			paper.forEach(function(paperDetails){
			var respData="<tr>";
			index=index+1;
				var paperData="<td>"+index+"</td>";
				paperData=paperData+"<td>"+data.millname+"</td>";
				paperData=paperData+"<td>"+paperDetails.gsm+"</td>";
				paperData=paperData+"<td>"+paperDetails.grade+"</td>";
				paperData=paperData+"<td>"+paperDetails.size+"</td>";
			    paperData=paperData+"<td>"+paperDetails.opening+"</td>";
			    paperData=paperData+"<td>"+paperDetails.stockIn+"</td>";
			    paperData=paperData+"<td>"+paperDetails.stockOut+"</td>";
			   	paperData=paperData+"<td>"+paperDetails.closing+"</td>";
			  	paperData=paperData+"<td>"+paperDetails.createdon+"</td>";
			  	respData=respData+paperData;
			  	respData=respData+"</tr>";
			  	details=details+respData;
			});
			
		});
		tblBody.html(details);
	};
	var errorFn=function(data){
		alert("At the time error occured, Please try later..");
	};
}
function detectreportdetailDivScroll(){
	var reportDetailTBL=$("div#reportdetailDiv").find("table#reportdetailTBL");
	var subsituteHeader=$("table#subsituteHeader");
	subsituteHeader.find("th#millid").width(reportDetailTBL.find("th#millid").width());
	subsituteHeader.find("th#name").width(reportDetailTBL.find("th#name").width());
	subsituteHeader.find("th#gsm").width(reportDetailTBL.find("th#gsm").width());
	subsituteHeader.find("th#grade").width(reportDetailTBL.find("th#grade").width());
	subsituteHeader.find("th#size").width(reportDetailTBL.find("th#size").width());
	subsituteHeader.find("th#opening").width(reportDetailTBL.find("th#opening").width());
	subsituteHeader.find("th#stock-out").width(reportDetailTBL.find("th#stock-out").width());
	subsituteHeader.find("th#closing").width(reportDetailTBL.find("th#closing").width());
	subsituteHeader.find("th#created").width(reportDetailTBL.find("th#created").width());
	$("div#reportdetailDiv").scroll(function(event){
		//alert("scrollTop-"++" innerHeigth-"+$(this).innerHeight());
		var scrollHeigth=$(this).scrollTop();
		if(scrollHeigth>=10){
		subsituteHeader.removeClass("hide");
		}
		else{
		subsituteHeader.addClass("hide");
		}
	});
}
</script>
    </body>
    </html>