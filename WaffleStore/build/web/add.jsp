<%-- 
    Document   : add
    Created on : Jul 19, 2022, 12:47:41 AM
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
        <h1>Add a new Product</h1>
        <h3 style="color: red">${requestScope.error}</h3>
        <form action="add">
            enter ID:<input type="number" name="id" readonly=""><br/>
            enter Name<input type="text" name="name"><br/>
            enter Quantity<input type="number" name="quantity"><br/>
            enter Price<input type="number" name="price"><br/>
            enter Description<input type="text" name="description"><br/>
            enter Image URL<input type="text" name="imageUrl"><br/>
            enter Category Id<input type="number" name="categoryId"><br/>
            <input type="submit" value="SAVE">
        </form>
    </body>
</html>
