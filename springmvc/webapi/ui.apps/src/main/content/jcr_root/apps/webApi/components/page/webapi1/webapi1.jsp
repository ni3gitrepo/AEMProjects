<html>
<body>
first aem project jsp
</body>
</html>
<%@include file="/libs/foundation/global.jsp" %>
<%@page session="false" contentType="text/html; charset=utf-8" %>
<% %><%@taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<% %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html> 
    <% %><head> <cq:include script="/libs/wcm/core/components/init/init.jsp"/>
    <% currentDesign.writeCssIncludes(out); %> MyCustomerHead 
    </head> <body> MyCustomerBody </body>
</html>


<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/style.css" />       
</head> 

 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajax.js"></script>
<script> 
function onload(){
	var message = document.getElementById('message').value;
	 if(message!=null && message!=''){
		 render(1);
		   document.getElementById('divMessage').innerHTML=message;
	 }else{
		 render(1);
	 } 
}
 
</script> 



<body  onload="onload()">
<!-- if this form is there when submit multipart form also this main form gets submitted and go to upload page again it wont go to servlet
   <form name='frmMain'  id='frmMain' method="POST">-->   
<table  class="mainHeader" >
		<tr>
			<td colspan="2" valign="top"><jsp:include
					page=/apps/webApi/components/page/layouts/header.jsp></jsp:include></td>
		</tr>

		<tr>
		  <td colspan="2" valign="top">Welcome ADMIN!!!</td>
		</tr>
		
		<tr>
			<td valign="top">
				<table class="mainHeader">
					<tr>
						<td width="20%" id="leftPanel" valign="top" class="leftpanel">
 							 <jsp:include page="/apps/webApi/components/page/jsps/leftpanel.jsp"></jsp:include> 
						</td>
						<td width="1%">
						</td>
						<td width="79%" id="content" valign="top">
						
						
						
						</td>

					</tr>

				</table>
			</td>

		</tr>

		<tr>
			<td valign="top"> 
				<input type="hidden" value="<%=request.getContextPath() %>" id="context" />
				<input type="hidden" value="${status}" id="status" />
				<input type="hidden" value="${message}" id="message" />
			</td>
		</tr>
			</table>
</form>
</body>

<html>