<%-- 
    Document   : admin
    Created on : Jul 18, 2022, 9:25:38 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are u sure to delete category with id =" + id)) {
                    window.location = "delete?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <h1>MANAGER ACCOUNT</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Display Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listAccounts}" var="A">
                    <tr>
                        <td>${A.id}</td>
                        <td>${A.username}</td>
                        <td>${A.password}</td>
                        <td>${A.displayName}</td>
                        <td>${A.address}</td>
                        <td>${A.email}</td>
                        <td>${A.phone}</td>
                        <td>${A.role}</td>
                        <td><a href="deactive?id=${A.id}"><c:out value="${A.role eq 'USER'?'DEACTIVE':'ACTIVE'}"></c:out></a></td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>

        <h1>MANAGER PRODUCT</h1>
        <h3><a href="add.jsp">Add New</a></h3>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listProducts}" var="P">
                    <c:set var="id" value="${P.id}"/>
                    <tr>
                        <td>${P.id}</td>
                        <td>${P.name}</td>
                        <td>${P.quantity}</td>
                        <td>${P.price}</td>
                        <td>
                            <a href="update?id=${id}">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#" onclick="doDelete('${id}')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> 
    </body>
</html>
