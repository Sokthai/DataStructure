<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Student</title>
</head>
<body>
	<table border="1px solid">
		<tr><th>Student Name: </th> <td>Student Age:</td></tr>
		<% System.out.println("you can write java code in jsp with this tag"); %>
		<c:forEach var="student" items="${students}"}
			<tr><td>${student.name}</td><td>${student.age}</td></tr>
		</c:forEach>
		<hr>
		<h4>use form below to add a new student</h4>
		<form method="post">
			Name: <input type="text" name="name"/>
			<br/>
			Age: <input type="number" name="age"/>
				<input type="submit" value="submit"/>
			
		</form>
	</table>
</body>
</html>