<%@page import="metier.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%
	User user = null;

		if(session.getAttribute("updated_user") != null){
		 user = (User) session.getAttribute("updated_user");
		}
		else {
			response.sendRedirect("UserServlet");
		}	

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>

<style type="text/css">
	body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        form {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h4 {
            text-align: center;
            color: #3498db;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type='submit'] {
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            font-size: 18px;
        }

        input[type='submit']:hover {
            background-color: #2980b9;
        }
</style>
</head>
<body>

	<div>
		
	</div>
	<form action="updateUserServlet" method="post">
		<h4>Edit User</h4>
		
			<label>ID : <strong><%=user.getId()  %></strong></label>
			<input type="hidden" name="id"  value="<%=user.getId()  %>">
				<br> 
				
			<label>Name : </label>
			<input type="text" name="name" required value="<%=user.getName()  %>">
		
		
			<label>Age : </label>
			<input type="text" name="age" required value="<%=user.getAge() %>">
		
		
		<div>
			<input type='submit' value="UPDATE" >
		</div>	
	</form>
	

</body>
</html>