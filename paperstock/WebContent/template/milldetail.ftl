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
                            <i class="fa fa-desktop"></i> Mill Detail
                        </h4>
                    </div>
                </div>
                <!-- /.row -->

             <#include 'messagepanel.ftl'/>

                <div class="row">
	                <div class="col-lg-4 col-md-4 col-xs-12">
		               
		                <form method="post" id="milldetailsform" name="milldetailsform" action="milldetails">
	                        <table class="table table-hover borderless tblcontentalignrigth">
	                            <tbody>
	                                <tr>
	                                	<th>Mill Name<i class="mandatoryIcon">*</i></th> 
	                                    <td>
		                                    <input name="millname" type="text" class="inputsize"/>
		                                 </td>
	                                  </tr>
	                                  <tr>
	                                 	 <th>GSM<i class="mandatoryIcon">*</i></th>
		                                    <td>
		                                    <input name="gsm" type="text" class="inputsize"/>
		                                    </td>
		                                  </tr>
		                                  <tr>
		                                  	<th>Grade<i class="mandatoryIcon">*</i></th>
	                                    	<td>
	                                    	<input name="grade" type="text" class="inputsize"/>
	                                    	</td>
	                                      </tr>
	                                      <tr>
	                                      	<th>SIZE<i class="mandatoryIcon">*</i></th>
	                                      	<td>
	                                      	<input name="size" type="text" class="inputsize"/>
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
	                                				<input id="editselected" type="hidden" name="editselected" value="0"/>
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
                     <div class="col-lg-8 col-md-8 col-xs-12">
                     <table id="subsituteHeader" class="hide table-bordered theadBgColor subsitituteHeader">
                     <thead>
		                	 <tr>
		                		<th id="millid">ID</th> 
		                	 	<th id="name">Name</th> 
	                            <th id="gsm">GSM</th>
	                            <th id="grade">Grade</th>
		                        <th id="size">SIZE</th>
	                          <!--   <th>Phone</th>
	                           <th id="email">Email</th>-->
		                        <th id="address">address</th>
		                      <!--  <th>Remarks</th>-->
		                        <th id="edit">Edit</th>
		                        </tr>
		                	 </thead>
                     </table>
		                <div id="milldetailDiv" class="table-responsive table-fixed-height412px">
		                	 <table id="milldetailTBL" class="table table-bordered table-hover theadBgColor">
		                	 <thead>
		                	 <tr>
		                		<th id="millid">ID</th> 
		                	 	<th id="name">Name</th> 
	                            <th id="gsm">GSM</th>
	                            <th id="grade">Grade</th>
		                        <th id="size">SIZE</th>
	                          <!--   <th>Phone</th>
	                           <th id="email">Email</th>-->
		                        <th id="address">address</th>
		                      <!--  <th>Remarks</th>-->
		                        <th id="edit">Edit</th>
		                        </tr>
		                	 </thead>
	                            <tbody>
	                           <#list milldetails as stockdetail>
	                			 <#list stockdetail.paperDetail as paperdetail>
	                             <tr millname="${stockdetail.millname!}" gsm="${paperdetail.gsm!}" grade="${paperdetail.grade!}" size="${paperdetail.size!}" phone="${stockdetail.contactNum!}" mailid="${stockdetail.mailId!}" address="${stockdetail.address!}" remarks="${paperdetail.remarks!}">
                                    <td>
		                            	${stockdetail.millid!}
		                            </td>
		                            <td>
		                            	${stockdetail.millname!}
		                            </td>
		                            <td>
		                            	${paperdetail.gsm!}
		                            </td>
		                             <td>
		                            	${paperdetail.grade!}
		                            </td>
		                            <td>
		                            	${paperdetail.size!}
		                            </td>
		                           <#--   <td>
		                            	${stockdetail.contactNum!}
		                            </td>
		                            <td>
		                            	${stockdetail.mailId!}
		                            </td>-->
		                             <td>
		                            	${stockdetail.address!}
		                            </td>
		                         <#--   <td>
		                            	${paperdetail.remarks!}
		                            </td>-->
		                            <td>
			                            <input type="button" value="Edit " edit="true" millid="${stockdetail.millid!}" name="millEditSelectBtn_${stockdetail.millid!}" class="btn-warning"/>
		                            </td>
	                             </tr>
	                             </#list>
								</#list>
	                            </tbody>
	                        </table>
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
	milldetailsEditSelect();
	detectmilldetailDivScroll();
	<#if (savestatus?? && savestatus?length>0 )>
		<#if savestatus=="Your record has been saved successfully..!">
			showSuccessMsg("${savestatus}");
		<#else>
			showErrorMsg("${savestatus}");
		</#if>
	</#if>
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
		if(!data || data.length===0){
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
			return false;
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
			if(data==="false")
			showSuccessMsg("Mill details not Exists, Please save now...");
			else
			showErrorMsg("Mill Already Saved..You cannot save this Mill now.");
					},
			error:function(data){
					showErrorMsg(data);
				  }
		});
}
var editrowselected=false;
function milldetailsEditSelect(){
	$("input[name^=millEditSelectBtn_]").click(function(){
		var edit=$(this).attr("edit");
		if(editrowselected===true && edit==="true"){
			alert("already an edit row has selected...");
			return false;
		}
		if(edit==="true"){
			$("input#editselected").val($(this).attr("millid"));
			$(this).parent().parent("tr").addClass("millTReditSelected");
			$(this).val("clear");
			$(this).attr("edit","false");
			editrowselected=true;
			fillInputVal($(this).parent().parent("tr"));
		}else{
			$("input#editselected").val("0");
			$(this).parent().parent("tr").removeClass("millTReditSelected");
			$(this).val("Edit ");
			$(this).attr("edit","true");
			editrowselected=false;
			clearInputVal();
		}
	});
	
	function fillInputVal(selectedTR){
		$("input[name=millname]").val(selectedTR.attr("millname"));
		$("input[name=gsm]").val(selectedTR.attr("gsm"));
		$("input[name=grade]").val(selectedTR.attr("grade"));
		$("input[name=size]").val(selectedTR.attr("size"));	
		$("input[name=phone]").val(selectedTR.attr("phone"));
		$("input[name=email]").val(selectedTR.attr("mailid"));
		$("[name=address]").val(selectedTR.attr("address"));
		$("[name=remarks]").val(selectedTR.attr("remarks"));
	}
	function clearInputVal(){
		$("input[name=millname]").val("");
		$("input[name=gsm]").val("");
		$("input[name=grade]").val("");
		$("input[name=size]").val("");
		$("input[name=phone]").val("");
		$("input[name=email]").val("");
		$("[name=address]").val("");
		$("[name=remarks]").val("");
	}
}
function detectmilldetailDivScroll(){
	var millDetailTBL=$("div#milldetailDiv").find("table#milldetailTBL");
	var subsituteHeader=$("table#subsituteHeader");
	subsituteHeader.find("th#millid").width(millDetailTBL.find("th#millid").width());
	subsituteHeader.find("th#name").width(millDetailTBL.find("th#name").width());
	subsituteHeader.find("th#gsm").width(millDetailTBL.find("th#gsm").width());
	subsituteHeader.find("th#grade").width(millDetailTBL.find("th#grade").width());
	subsituteHeader.find("th#size").width(millDetailTBL.find("th#size").width());
	subsituteHeader.find("th#address").width(millDetailTBL.find("th#address").width());
	subsituteHeader.find("th#edit").width(millDetailTBL.find("th#edit").width());
	$("div#milldetailDiv").scroll(function(event){
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