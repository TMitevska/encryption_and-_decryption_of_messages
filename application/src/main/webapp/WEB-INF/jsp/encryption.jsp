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
		.margin_bottom10px{
		    margin-bottom : 10px;
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
		<div class="margin_bottom10px"><h1>${encryptionType}</h1></div>
		<div>&nbsp;</div>
		
		<table>
			<tr>
				<td><div><h5>${plaintext}</h5><h5>${message}</h5></div></td>
				<td><div class="margin_left30px"></div></td>
				<td><div class="margin_left30px"></div></td>
				<td><div></div></td>
				<td><div class="margin_left30px"><h5>${plaintext}</h5><h5>${message}</h5></div></td>
			</tr>
			<tr>
				<td><div ><img src="user1.png" width="200" height="200"  alt="img"></div></td>
				<td><div class="margin_left30px"><img src="arrow_right.jpg" alt="pointer_down" height="50" width="50"></div></td>
				<td><div class="margin_left30px"><h5>${cipher}</h5><h5>${encryptedMessage}</h5></div></td>
				<td><div><img src="arrow_right.jpg" alt="pointer_down" height="50" width="50"></div></td>
				<td><div class="margin_left30px"><img src="user2.png" width="200" height="200"  alt="img"></div></td>
			</tr>
			<tr>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
				<td><div class="margin_left30px"><img src="arrow.jpg" alt="pointer_down" height="42" width="42"></div></td>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
			</tr>
			<tr>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
				<td><div class="margin_left30px"><img src="arrow.jpg" alt="pointer_down" height="42" width="42"></div></td>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
			</tr>
			<tr>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
				<td><div class="margin_left30px"><img src="arrow.jpg" alt="pointer_down" height="42" width="42"></div></td>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
			<tr>
				<td><div></div></td>
				<td><div class="margin_left30px"></div></td>
				<td><div class="margin_left30px"><img src="user3.png" width="200" height="200" alt="img"></div></td>
				<td><div class="margin_left30px"><h5>${cipher}</h5><h5>${encryptedMessage}</h5></div></td>
				<td><div class="margin_left30px"></div></td>
			</tr>
		</table>
		<div>&nbsp;</div>
	
	</div>
	
	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>