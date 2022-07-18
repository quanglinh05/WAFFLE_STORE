<%-- 
    Document   : update
    Created on : Jul 19, 2022, 1:34:00 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update a Product</h1>
        <c:set var="p" value="${requestScope.product}"/>
        <form action="update" method="post">
            enter ID:<input type="number" name="id" readonly="" value="${p.id}"><br/>
            enter Name<input type="text" name="name" value="${p.name}"><br/>
            enter Quantity<input type="number" name="quantity" value="${p.quantity}"><br/>
            enter Price<input type="number" name="price" value="${p.price}"><br/>
            enter Description<input type="text" name="description" value="${p.description}"><br/>
            enter Image URL<input type="text" name="imageUrl" value="${p.imageUrl}"><br/>
            enter Category Id<input type="number" name="categoryId" value="${p.categoryId}"><br/>
            <input type="submit" value="UPDATE">
        </form>
    </body>
</html>
