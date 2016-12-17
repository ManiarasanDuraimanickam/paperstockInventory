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
                            <small><i class="fa fa-table"></i> Stockout</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
 					<#include 'messagepanel.ftl'/>
                <div class="row">
	                <div class="col-lg-4 col-md-4 col-xs-12">
		                <div class="table-responsive">
		                <form method="post" id="stockoutform"name="stockoutform" action="stockout">
	                        <table class="table table-hover borderless tblcontentalignrigth">
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
		                                   	  <td><span id="stockInHand">0</span>
		                                   	  <input id="currentStock" type="hidden" name="currentStock" value="0"/>
		                                   	  </td>
	                                   	  </tr>
	                                   	  </tr>
	                                    	<th>Stock Out</th>
	                                    	<td><input type="text" class="cursorNotAllowed" name="stockout" disabled="" value="0"/></td>
	                                    <tr>
	                                    <tr>
	                                    	<th>remarks</th>
	                                    	<td><textarea name="remarks"></textarea>
	                                    </tr>
	                                    <th>Remaning</th>
	                                    <td><span id="remaningtotal" class="totalstock">0</span></td>
	                                	</tr>
	                                	<tr>
	                                	<th></th>
	                                	<td>
		                                	<input id="selectedMill" type="hidden" name="selectedMill" value="0"/>
		                                	<input type="submit" value="Submit" id="purchaseSubmit" class="btn-primary"/>
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
	filterValueByMill();	
	filterValueByGsm();
	filterValueByGrade();
	filterValueBySize();
	stockoutAllowNumber();
	stockoutKeyPress()
	stockoutBlur(); 			   
	submitFormValidation();
	<#if (savestatus?? && savestatus?length>0 )>
		<#if savestatus=="Your record has been saved successfully..!">
			showSuccessMsg("${savestatus}");
		<#elseif savestatus=="We are facing some technical issue so cannot save your record.">
			showErrorMsg("${savestatus}");
		</#if>
	</#if>
	
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
function stockoutAllowNumber(){
		$("input[name=stockout]").keydown(function(event){
			 var keycode = event.keyCode || event.which;
			 if(event.ctrlKey || event.shiftKey)
			 	return false;
			 else if(((keycode>=48 && keycode<=57) || (keycode>=96 && keycode<=105)) || (keycode===8 || keycode===46 ))
				return true;
			 else
				return false;
		});
	}
function stockoutKeyPress(){
	$("input[name=stockout]").click(function(){
		if(parseInt($(this).val())===0){
			$(this).val("");
		}
	});
}
function stockoutBlur(){
	$("input[name=stockout]").blur(function(){
		var stockInHand=parseInt($("#stockInHand").text());
		var stockout=parseInt($(this).val());
		var total=0;
		if(isNaN(stockout)){
			$(this).val(0);
		}
		else{
			if(stockout>stockInHand){
				$(this).val(stockInHand)
				total=stockInHand;
			}else{
			total=stockInHand-stockout;
			}
		}
		$("#remaningtotal").text(total);
	});
}
	
function submitFormValidation(){
		$("form").submit(function(){
			var millname=$("select[name=millname]").val();
			hideError($("select[name=millname]"));
			hideError($("select[name=gsm]"));
			hideError($("select[name=grade]"));
			hideError($("select[name=size]"));
			hideError($("input[name=stockout]"));
			if(millname.length===0){
				showError($("select[name=millname]"));
				return false;
			}
			else if($("select[name=gsm]").val().length==0){
				showError($("select[name=gsm]"));
				return false;
			}
			else if($("select[name=grade]").val().length==0){
				showError($("select[name=grade]"));
				return false;
			}
			else if($("select[name=size]").val().length==0){
				showError($("select[name=size]"));
				return false;
			}
			else if(!($("input[name=stockout]").val()>0)){
				showError($("input[name=stockout]"));
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
		var millid=responseJson.millid;
		$("input#selectedMill").val(millid);
		displayAvaliableStock(0,true);
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
				displayAvaliableStock(paperDetails===undefined?0:paperDetails[0].stock,false);
			break;
		}
	}
	
	function ajaxCall(data){
		var url="http://localhost:8080/paperstock/stockfilter"
		data=data+"&pageid=stockout";
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
	function displayAvaliableStock(stock,close){
		$("#stockInHand").text(stock);
		$("input#currentStock").val(stock);
		if(!close){
			$("input[name=stockout]").removeClass("cursorNotAllowed");
			$("input[name=stockout]").removeAttr("disabled");
		}
		else{
			$("input[name=stockout]").val(0);
			$("input[name=stockout]").addClass("cursorNotAllowed");
			$("input[name=stockout]").attr("disabled","");
		}
	}
	function hideError(element){
		$(element).removeClass('errorMsgBorder');
	}
	function showError(element){
		$(element).addClass('errorMsgBorder');
		scrollToErrorMsg($("select[name=millname]").scrollTop());
		return false;
	}
	
	function scrollToErrorMsg(position){
		 $('html, body').animate({
            scrollTop: 0
        }, position);
	}
</script>
    </body>
    </html>