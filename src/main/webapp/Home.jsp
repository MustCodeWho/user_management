<%@page import="java.util.List"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="metier.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="metier.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	UserModel userModel;

		if(session.getAttribute("users") != null){
		 userModel = (UserModel) session.getAttribute("users");
		}
		else {
			userModel = new UserModel();
		}	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User Manager</title>

	<style type="text/css">
	
		body {
			background-color: #f3f4f6;
			margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
		}
		
		.main {
			padding: 25px;
		}
		
		  table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 6px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        a:hover {
            color: #2980b9;
        }
        
         .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            color: #3498db;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
            cursor: pointer;
        }

        .pagination a.active {
            background-color: #3498db;
            color: white;
        }
        
        .delete {
        	text-decoration: none;
            color: red;
        }
        
        .navbar {
        	display: flex;
        	justify-content: space-between;
        	align-items: center;
        	padding: 5px;
        }
        
       

        nav a {
            float: left;
            display: block;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            background-color: #3b82f6;
            border-radius: 6px;
        }

        nav a:hover {
            background-color: #93c5fd;
            color: #333;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
        }

        .nav-link {
            font-size: 18px;
        }
        
        footer {
            background-color: #2563eb;
            color: #fff;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
	
	</style>
</head>
<body>
	
	<section class="main">
		<nav class="navbar">
			<div class="navbar-brand">
				<i class="fa fa-users" aria-hidden="true"></i> &nbsp; Users Management
			</div>
			<div>
				<a href="addUser.jsp" class="nav-link">Add User</a>
			</div>
		</nav>
		<div>
		<table border="1">
			    <tr>
			        <th>ID</th>
			        <th>NAME</th>
			        <th>AGE</th>
			        <th>ACTION</th>
			    </tr>
			
			    <%
			    List<User> userList = userModel.getList();
			
			    int usersPerPage = 5;
			    int totalPages = (int) Math.ceil((double) userList.size() / usersPerPage);
			
			    int currentPage = 1;
			    if (request.getParameter("page") != null) {
			        currentPage = Integer.parseInt(request.getParameter("page"));
			    }
			
			    int start = (currentPage - 1) * usersPerPage;
			    int end = Math.min(start + usersPerPage, userList.size());
			
			    Collections.sort(userList.subList(start, end), Comparator.comparingInt(User::getId));
			
			    for (User user : userList.subList(start, end)) {
			    %>
			    <tr>
			        <td><%=user.getId() %></td>
			        <td><%=user.getName() %></td>
			        <td><%=user.getAge() %></td>
			        <td>
			            <a class="delete" href="deleteUserServlet?id=<%=user.getId() %>">DELETE &nbsp;&nbsp; <i class="fa fa-trash"></i></a>
			            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            <a href="updateUserServlet?id=<%=user.getId() %>">UPDATE &nbsp;&nbsp; <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
			        </td>
			    </tr>
			    <%
			    }
			    %>
		</table>

		<div class="pagination">
		    <%
		    for (int i = 1; i <= totalPages; i++) {
		    %>
		    <a class="<%= i == currentPage ? "active" : "" %>" href="?page=<%=i%>"><%=i%></a>
		    <%
		    }
		    %>
		</div>
		</div>
		
	</section>
	<section>
	 	<footer>
        	&copy; MUSTAPHA AIT IGUNAOUN
    	</footer>
    </section>
</body>
</html>