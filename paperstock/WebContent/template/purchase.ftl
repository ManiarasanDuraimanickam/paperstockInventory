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
               <!-- <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>-->
                <!--<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>-->
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
                            <small><i class="fa fa-bar-chart-o"></i> Purchase</small>
                        </h1>
                        <!--<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-bar-chart-o"></i> Purchase
                            </li>
                        </ol>
                        <div class="dividerborder">
                        </div>-->
                    </div>
                </div>
                <!-- /.row -->

               <!-- <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i>  <strong>Like Paper Stock?</strong> Try out <a href="#" class="alert-link">Paper Stock</a> for additional features!
                        </div>
                    </div>
                </div>-->
                <!-- /.row -->

                <div class="row">
	                <div class="col-lg-6 col-md-6 col-xs-12">
		                <div class="table-responsive">
		                <form method="post" id="purchaseform"name="purchaseform" action="stockin">
	                        <table class="table table-bordered table-hover table-striped">
	                            <tbody>
	                                <tr>
	                                	<th>Mill</th> 
	                                    <td>
		                                    <select name="millname" class="stockFilterSelect">
		                                    <option value="">Select Mill</option>
		                                     <#list PSIDatavo.stockDetails as stockdetail>
		                                      <option value="${stockdetail.millname}">${stockdetail.millname}</option>
											</#list>
		                                    </seclect>
		                                    </td>
	                                  </tr>
	                                  <tr>
	                                 	 <th>GSM</th>
		                                    <td>
			                                    <#assign gsm=[]>
			                                    <select name="gsm" class="stockFilterSelect">
			                                    <option value="">Select GSM</option>
			                                     <#list PSIDatavo.stockDetails as stockdetail>
				                                    <#list stockdetail.paperDetail as paperdetail>
				                                    <#if !(gsm?seq_contains(paperdetail.gsm))>
				                                    <option value="${paperdetail.gsm}">${paperdetail.gsm}</option>
				                                    <#assign gsm=gsm+[paperdetail.gsm]/>
				                                    </#if>
				                 					</#list>
												</#list>
			                                    </select>
		                                    </td>
		                                  </tr>
		                                  <tr>
		                                  	<th>Grade</th>
	                                    	<td>
	                                    		<#assign grade=[]>
			                                    <select name="grade" class="stockFilterSelect">
			                                    <option value="">Select Grade</option>
			                                     <#list PSIDatavo.stockDetails as stockdetail>
				                                    <#list stockdetail.paperDetail as paperdetail>
				                                    <#if !(grade?seq_contains(paperdetail.grade))>
				                                    <option value="${paperdetail.grade}">${paperdetail.grade}</option>
				                                    <#assign grade=grade+[paperdetail.grade]/>
				                                    </#if>
				                 					</#list>
												</#list>
			                                    </select>
	                                    	</td>
	                                      </tr>
	                                      <tr>
	                                      	<th>SIZE</th>
	                                      	<td>
	                                   	  		<#assign size=[]>
			                                    <select name="size" class="stockFilterSelect">
			                                    <option value="">Select Size</option>
			                                     <#list PSIDatavo.stockDetails as stockdetail>
				                                    <#list stockdetail.paperDetail as paperdetail>
				                                    <#if !(size?seq_contains(paperdetail.size))>
				                                    <option value="${paperdetail.size}">${paperdetail.size}</option>
				                                    <#assign size=size+[paperdetail.size]/>
				                                    </#if>
				                 					</#list>
												</#list>
			                                    </select>
		                                    </td>
	                                   	  </tr>
	                                   	  <tr>
		                                   	  <th>Stock In Hand</th>
		                                   	  <td><span id="stockInHand">0</span></td>
	                                   	  </tr>
	                                   	  </tr>
	                                    	<th>Purchase</th>
	                                    	<td><input type="text" class="cursorNotAllowed" name="purchase" disabled="" value="0"/></td>
	                                    <tr>
	                                    <th>Total</th>
	                                    <td><span id="purchasetotal" class="totalstock">0</span></td>
	                                	</tr>
	                                	<tr>
	                                	<th></th>
	                                	<td><input type="submit" value="Submit" id="purchaseSubmit"/></td>
	                                	</tr>
	                            </tbody>
	                        </table>
	                        </form>
	                     </div>
                     </div>
                </div>
             </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>

<script type="text/javascript">
$(document).ready(function(){ 	
	filterValueByMill();	
	filterValueByGsm();
	filterValueByGrade();
	filterValueBySize();
	purchaseAllowNumber();
	purchaseKeyPress()
	purchaseBlur(); 			   
	submitFormValidation();
	
});

function filterValueByMill(){
	$("select[name=millname]").change(function(){
		var queryIndex="queryIndex=0";
		var data=queryIndex;
		var millname="millname="+$("select[name=millname]").val();
		if($("select[name=millname]").val().length==0){
			alert("please select the Mill name");
			$("select[name=millname]").val("");
			return false;
		}
		data=data+"&"+millname;
		ajaxCall(data);
	});
}
function filterValueByGsm(){
	$("select[name=gsm]").change(function(){
		var queryIndex="queryIndex=1";
		var data=queryIndex;
		var millname="millname="+$("select[name=millname]").val();
		var gsm="gsm="+$("select[name=gsm]").val();
		if($("select[name=millname]").val().length==0){
			alert("please select the Mill name");
			$("select[name=millname]").val("");
			$("select[name=gsm]").val("");
			return false;
		}
		else if($("select[name=gsm]").val().length==0){
			alert("please select the GSM");
			$("select[name=gsm]").val("");
			return false;
		}
		data=data+"&"+millname;
		data=data+"&"+gsm;
		ajaxCall(data);
	});
}
function filterValueByGrade(){
	$("select[name=grade]").change(function(){
		var queryIndex="queryIndex=2";
		var data=queryIndex;
		var millname="millname="+$("select[name=millname]").val();
		var gsm="gsm="+$("select[name=gsm]").val();
		var grade="grade="+$("select[name=grade]").val();
		if($("select[name=millname]").val().length==0){
			alert("please select the Mill name");
			$("select[name=millname]").val("");
			$("select[name=grade]").val("");
			return false;
		}
		else if($("select[name=gsm]").val().length==0){
			alert("please select the GSM");
			$("select[name=gsm]").val("");
			$("select[name=grade]").val("");
			return false;
		}
		else if($("select[name=grade]").val().length==0){
			alert("please select the Grade");
			$("select[name=grade]").val("");
			return false;
		}
		data=data+"&"+millname;
		data=data+"&"+gsm;
		data=data+"&"+grade;
		ajaxCall(data);
	});
}
function filterValueBySize(){
	$("select[name=size]").change(function(){
		var queryIndex="queryIndex=3";
		var data=queryIndex;
		var millname="millname="+$("select[name=millname]").val();
		var gsm="gsm="+$("select[name=gsm]").val();
		var grade="grade="+$("select[name=grade]").val();
		var size="size="+$("select[name=size]").val();
		if($("select[name=millname]").val().length==0){
			alert("please select the Mill name");
			$("select[name=millname]").val("");
			$("select[name=size]").val("");
			return false;
		}
		else if($("select[name=gsm]").val().length==0){
			alert("please select the GSM");
			$("select[name=gsm]").val("");
			$("select[name=size]").val("");
			return false;
		}
		else if($("select[name=grade]").val().length==0){
			alert("please select the Grade");
			$("select[name=grade]").val("");
			$("select[name=size]").val("");
			return false;
		}
		else if($("select[name=size]").val().length==0){
			alert("please select the Size");
			$("select[name=size]").val("");
			return false;
		}
		data=data+"&"+millname;
		data=data+"&"+gsm;
		data=data+"&"+grade;
		data=data+"&"+size;
		ajaxCall(data);
	});
}
function purchaseAllowNumber(){
		$("input[name=purchase]").keydown(function(event){
			 var keycode = event.keyCode || event.which;
			 if(event.ctrlKey || event.shiftKey)
			 	return false;
			 else if(((keycode>=48 && keycode<=57) || (keycode>=96 && keycode<=105)) || (keycode===8 || keycode===46 ))
				return true;
			 else
				return false;
		});
	}
function purchaseKeyPress(){
	$("input[name=purchase]").click(function(){
		if(parseInt($(this).val())===0){
			$(this).val("");
		}
	});
}
function purchaseBlur(){
	$("input[name=purchase]").blur(function(){
		var stockInHand=parseInt($("#stockInHand").text());
		var purchase=parseInt($(this).val());
		var total=0;
		if(isNaN(purchase)){
			$(this).val(0);
		}
		else{
			total=stockInHand+purchase;
		}
		$("#purchasetotal").text(total);
	});
}
	
function submitFormValidation(){
		$("form").submit(function(event){
			event.preventDefault();
			var millname=$("select[name=millname]").val();
			if(millname.length===0){
				$("select[name=millname]").addClass('errorMsgBorder');
				scrollToErrorMsg($("select[name=millname]").scrollTop());
				return false;
			}
		});
	}
	
	function scrollToErrorMsg(position){
		 $('html, body').animate({
            scrollTop: 0
        }, position);
	}
	var successFN=function(data,textStatus){
		var responseJson=data[0];
		var queryIndex=responseJson.queryIndex;
		var paperDetails=responseJson.paperDetail;
		displayAvaliableStock(0);
		switch(queryIndex){
			case "0":
				updateGSMSelect(paperDetails);
				updateGradeSelect(paperDetails);
				updateSizeSelect(paperDetails);
			break;
			case "1":
				updateGradeSelect(paperDetails);
				updateSizeSelect(paperDetails);
			break;
			case "2":
				updateSizeSelect(paperDetails);
			break;
			case "3":
				displayAvaliableStock(paperDetails[0].stock);
			break;
		}
	}
	
	function ajaxCall(data){
		var url="http://localhost:8080/paperstock/stockfilter"
		/*$.ajax({
			type:"POST",
			url:url,
			data:data,
			success:successFN,
			dataType:"text/json"
		});*/
		$.post(url,data,successFN);
	}
	function updateGSMSelect(paperDetails){
		var gsmArray=new Array();
		var gsmSelect=$("select[name=gsm]");
		var options="<option value=\"\">Select GSM</option>";
		paperDetails.forEach(function(data){
		if(gsmArray.length===0 || gsmArray.indexOf(data.gsm)===-1){
			options=options+"<option value=\""+data.gsm+"\">"+data.gsm+"</option>";
			gsmArray.push(data.gsm);
		}
		});
		gsmSelect.html("");
		gsmSelect.html(options);
	}
	function updateGradeSelect(paperDetails){
		var gradeArray=new Array();
		var gradeSelect=$("select[name=grade]");
		var options="<option value=\"\">Select Grade</option>";
		paperDetails.forEach(function(data){
		if(gradeArray.length===0 || gradeArray.indexOf(data.grade)===-1){
			options=options+"<option value=\""+data.grade+"\">"+data.grade+"</option>"
			gradeArray.push(data.grade);
		}
		});
		gradeSelect.html("");
		gradeSelect.html(options);
	}
	function updateSizeSelect(paperDetails){
		var sizeArray=new Array();
		var sizeSelect=$("select[name=size]");
		var options="<option value=\"\">Select Size</option>";
		paperDetails.forEach(function(data){
		if(sizeArray.length===0 || sizeArray.indexOf(data.size)===-1){
			options=options+"<option value=\""+data.size+"\">"+data.size+"</option>"
			sizeArray.push(data.size);
		}
		});
		sizeSelect.html("");
		sizeSelect.html(options);
	}
	function displayAvaliableStock(stock){
		$("#stockInHand").text(stock);
		if(stock>0){
			$("input[name=purchase]").removeClass("cursorNotAllowed");
			$("input[name=purchase]").removeAttr("disabled");
		}
		else{
			$("input[name=purchase]").val(0);
			$("input[name=purchase]").addClass("cursorNotAllowed");
			$("input[name=purchase]").attr("disabled","");
		}
	}	
</script>
    </body>
    </html>