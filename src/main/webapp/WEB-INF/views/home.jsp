<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<c:url value="/logout" var="urlLogout" />
	<c:url value="/get-all-users" var="urlGetAllUsers" />
	<form:form action="${urlLogout}" method="post" id="logout" />
	<form:form action="${urlGetAllUsers}" method="post" id="getAllUser" />
	<span>${message}</span>
	<sec:authentication property="principal" var="user" />
	<div class="w3-bar w3-black">
		<a href="${urlHome}" class="w3-bar-item w3-button">Home</a> 
		<a href="#" class="w3-bar-item w3-button" onclick="document.getElementById('getAllUser').submit()">Show
		All Users</a>
		<a href="#" class="w3-bar-item w3-button">My Account</a>
		<a href="#" class="w3-bar-item w3-button" onclick="document.getElementById('logout').submit()">Logout</a>
		<a href="#" id="a" class="w3-bar-item w3-button">Check</a>
	</div>

	<h1 align="center" class="w3-bar">
		Hello, <span>${user.firstName} ${user.lastName}</span>
	</h1>
	<select id="options">
	<option>1</option>
	<option>2</option>
	<option>3</option>
	<option>4</option>
	<option>5</option>
	
	</select>
	<input type="date" id="from"/>
	<input type="date" id="to">
	<button type="reset" id="reset">Reset</button>
	<button type="submit" id="submit">Get</button>
	<table id="table"></table>
	<h3 align="center">
		Users Detail
	</h3>
	<table class="w3-table-all w3-content" id="table" >
		<thead align="center" valign="top">
		</thead>
		<tbody align="left">
			<tr>
				<th>User Name</th>
				<td>${user.username}</td>
			</tr>
			<tr>
				<th>First Name</th>
				<td>${user.firstName}</td>
			</tr>
			<tr>
				<th>Last Name</th>
				<td>${user.lastName}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${user.email}</td>
			</tr>
			<tr>
				<th>Authorities</th>
				<td>${user.authorities}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	  $('#a').attr('href','show?option='+$('#options').val());
	  $('#options').change(function(){
		  console.log($(this).val());
		  $('#a').attr('href','show?option='+$(this).val()+'&from='+$('#from').val()+'&to='+$('#to').val());
	  });
	  $('#reset').click(function(){
		  $('#from').val(null);
		  $('#to').val(null);
	  });
	  $('#submit').click(function(){
		  $.ajax({
			  url: "get-all-user",
			  data: "",
			  success: function(data){
				  console.log(data);
			  }
			});
	  });
  });
  
  </script>
  
