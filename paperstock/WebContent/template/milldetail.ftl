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
                            <small><i class="fa fa-desktop"></i> Mill Detail</small>
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

              <div class="row">
               	<div class="col-lg-12 col-md-12 col-sm-12">
               		<div class="panel" id="messagePanel">
               		</div>
               	</div>
              </div>

                <div class="row">
	                <div class="col-lg-6 col-md-6 col-xs-12">
		                <div class="table-responsive">
		                <form method="post" id="milldetailsform" name="milldetailsform" action="milldetails">
	                        <table class="table table-hover borderless">
	                            <tbody>
	                                <tr>
	                                	<th>Mill Name</th> 
	                                    <td>
		                                    <input name="millname" type="text" class="inputsize"/><i class="mandatoryIcon">*</i>
		                                 </td>
	                                  </tr>
	                                  <tr>
	                                 	 <th>GSM</th>
		                                    <td>
		                                    <input name="gsm" type="text" class="inputsize"/><i class="mandatoryIcon">*</i>
		                                    </td>
		                                  </tr>
		                                  <tr>
		                                  	<th>Grade</th>
	                                    	<td>
	                                    	<input name="grade" type="text" class="inputsize"/><i class="mandatoryIcon">*</i>
	                                    	</td>
	                                      </tr>
	                                      <tr>
	                                      	<th>SIZE</th>
	                                      	<td>
	                                      	<input name="size" type="text" class="inputsize"/><i class="mandatoryIcon">*</i>
		                                    </td>
	                                   	  </tr>
	                                    	<th>Phone</th>
	                                    	<td><input type="text" name="phone" class="inputsize"/></td>
	                                    <tr>
		                                    <th>Email</th>
		                                    <td><input type="text" name="email" class="inputsize"/></td>
	                                	</tr>
	                                	 <tr>
		                                   	  <th>address</th>
		                                   	  <td><textarea name="address" maxlength="45" class="inputsize"></textarea></td>
	                                   	  </tr>
	                                   	  </tr>
	                                	<tr>
		                                   	  <th>Remarks</th>
		                                   	  <td><textarea name="remarks" maxlength="255" class="inputsize"></textarea></td>
	                                   	  </tr>
	                                	<tr>
	                                	<th></th>
	                                	<td>
	                                		<div class="row">
	                                			<div class="col-lg-12 col-md-12 col-xs-12">
		                                			<input type="button" value="Availability" id="milldetailsAvailable" class="btn-primary"/>
		                                			<input type="submit" value="Save" id="milldetailsSubmit"class="btn-success" />
	                                			</div>
	                                		</div>
	                                	</td>
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
	formValidation();
	millavailabilityCheck();
});
function formValidation(){
	$("form").submit(function(){
		enableDisableInput(true);
		if(!mandatoryFieldCheck()){
			scrollToErrorMsg($("input[name=gsm]").scrollTop());
			alert("Enter the values in all the given Mandatory Fields(Millname, GSM, Grade & Size)");
			return false;
		}
	});
}


function millavailabilityCheck(){
	$("#milldetailsAvailable").click(function(){
		enableDisableInput(true);
		var data=mandatoryFieldCheck();
		if(data.length===0){
			scrollToErrorMsg($("input[name=gsm]").scrollTop());
			alert("Enter the values in all the given Mandatory Fields(Millname, GSM, Grade & Size)");
			enableDisableInput(false);
			return false;
		}
		ajaxCall(data);
		enableDisableInput(false);
	});
}
function enableDisableInput(isDisable){
	if(isDisable){
		$("#milldetailsSubmit").attr('disabled','');
		$("#milldetailsAvailable").attr('disabled','');
	}
	else{
		$("#milldetailsSubmit").removeAttr('disabled');
		$("#milldetailsAvailable").removeAttr('disabled');
	}
}
function mandatoryFieldCheck(){
		var mill=$("input[name=millname]").val();
		var gsm=$("input[name=gsm]").val();
		var grade=$("input[name=grade]").val();
		var size=$("input[name=size]").val();
		if(mill.length===0||gsm.length===0||grade.length===0||size.length===0){
			return "";
		}
		var data="millname="+mill;
		data=data+"&gsm="+gsm;
		data=data+"&grade="+grade;
		return data+"&size="+size;
}
function scrollToErrorMsg(position){
	 $('html, body').animate({ scrollTop: 0}, position);
}
function ajaxCall(data){
		var url="http://localhost:8080/paperstock/milldetails"
		$.ajax({
			type:"OPTIONS",
			url:url+"?"+data,
			data:data,
			dataType:"text",
			success:function(data){
					alert("success "+data);
					},
			error:function(data){
					alert("error "+data);
				  }
		});
}
</script>
    </body>
    </html>