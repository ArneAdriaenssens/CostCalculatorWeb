<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - CostCalculator</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>

    <body>
        <div id="container">
            <header>
                <h1><span>Cost Calculator</span></h1>
                <img src="images/CostBanner.jpg"></img>
                <nav>
                    <ul>
                        <li id="actual"><a href="<c:url value="/index.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>">Cost Overview</a></li>
                    </ul>
                </nav>
                <h2>
                    Home
                </h2>

            </header>
            <main>
                <c:if test="${not empty error}">
                    <div class="alert-danger">
                        <ul>
                            <c:forEach var="errors" items="${error}">
                                <li><c:out value="${errors}"/></li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <c:choose>
                    <c:when test="${user!=null}">
                        <h3>
                            Hello ${user.firstName}
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <form method="POST" action="">
                            <p>
                                <label for="email">Email</label><input type="email" name="email"><br>
                                <label for="password">Password</label><input type="password" name="password"><br>
                                <input type="submit" value="Log in">
                            </p>
                        </form> 
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="" id="logout">logout</a>
            </main>
        </div>
    </body>
</html>
