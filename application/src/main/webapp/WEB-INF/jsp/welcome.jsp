<!DOCTYPE html>
<%@page import="com.tamara.security.encryption.application.stringData.NS"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<title>${title}</title>
	<!-- Access the bootstrap Css like this, 
		Spring boot will handle the resource mapping automcatically -->
	<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
	<c:url value="/css/main.css" var="jstlCss" />
	<style type="text/css">
		@charset "ISO-8859-1";
		
		.displayInline{
			display: inline;
		}
		.margin_top20px{
		    margin-top: 20px;
		}
		.margin_bottom30px{
		    margin-bottom : 30px;
		}
		
		.margin_left30px{
		    margin-left: 30px;
		}
		
		.width_50px{
			width : 50px;
		}
		.width_200px{
			width : 200px;
		}
		.width_100px{
			width : 100px;
		}
		.width_300px{
			width : 300px;
		}
	</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">${title}</a>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="margin_bottom30px"><h1>${exchange}</h1></div>
		<div>&nbsp;</div>
		
		<form action="/" method="post">
			<table>
				<tr>
					<td><div><h3>${encryptionType}</h3></div></td>
					<td>
						<div class=" margin_left30px margin_top20px">
							<select name="encryptionType">
								<option value="0"><%=NS.noEncryption %></option>
								<option value="1"><%=NS.caesar %></option>
								<option value="2"><%=NS.railFence1 %></option>
								<option value="3"><%=NS.railFence2 %></option>
							</select>
						</div>
					</td>
				</tr>
				
				<tr>
					<td><div><h3>${message}</h3></div></td>
					<td><div class="margin_left30px margin_top20px" ><input name="message" type="text" /></div></td>
				</tr>
			</table>
			
			<div>&nbsp;</div>
			<div ><input type="submit" value="${send}"/></div>
			<div>&nbsp;</div>
			
		</form>
		
	</div>
	
	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>