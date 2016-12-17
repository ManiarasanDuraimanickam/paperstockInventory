
 			<div  id="messageRow" class="row hide">
               	<div class="col-lg-12 col-md-12 col-sm-12"id="messagePanel">
               		<div class="panel " id="messageBody">
               		</div>
               	</div>
              </div>

<script type="text/javascript">
function showSuccessMsg(successMsg){
disableMessageBox();
	var messagePanel=$("#messagePanel");
	var messageBody=$("#messageBody");
	var messageRow=$("#messageRow");
	messageRow.removeClass('hide');
	messagePanel.addClass("panel-success");
	messageBody.addClass("panel panel-heading");
	var message="<center>"+successMsg+"</center>";
	messageBody.html(message);
}

function showErrorMsg(errorMsg){
disableMessageBox();
	var messagePanel=$("#messagePanel");
	var messageBody=$("#messageBody");
	var messageRow=$("#messageRow");
	messageRow.removeClass('hide');
	messagePanel.addClass("has-error");
	messageBody.addClass("panel input-group-addon ");
	var message="<center>"+errorMsg+"</center>";
	messageBody.html(message);
}

function showInfoMsg(errorMsg){
disableMessageBox();
	var messagePanel=$("#messagePanel");
	var messageBody=$("#messageBody");
	var messageRow=$("#messageRow");
	messageRow.removeClass('hide');
	messagePanel.addClass("panel-info");
	messageBody.addClass("panel panel-heading");
	var message="<center>"+successMsg+"</center>";
	messageBody.html(message);
}
function showWarningMsg(errorMsg){
disableMessageBox();
	var messagePanel=$("#messagePanel");
	var messageBody=$("#messageBody");
	var messageRow=$("#messageRow");
	messageRow.removeClass('hide');
	messagePanel.addClass("panel-warning");
	messageBody.addClass("panel panel-heading");
	var message="<center>"+successMsg+"</center>";
	messageBody.html(message);
}
function disableMessageBox(){
	var messagePanel=$("#messagePanel");
	var messageBody=$("#messageBody");
	var messageRow=$("#messageRow");
	messageRow.removeAttr("class");
	messagePanel.removeAttr("class");
	messageBody.removeAttr("class");
	
	messageRow.attr("class","row hide");
	messagePanel.attr("class","col-lg-12 col-md-12 col-sm-12");
	messageBody.attr("class","panel");
}
</script>