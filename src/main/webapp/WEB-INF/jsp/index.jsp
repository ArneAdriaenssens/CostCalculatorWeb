<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - CostCalculator</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    </head>

    <body>
        <div id="container">
            <header>
                <h1><span>Cost Calculator</span></h1>
                <img src="<c:url value="/images/CostBanner.jpg"/>"></img>
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
                    <c:when test="${owner!=null}">
                        <h3>
                            Hello ${owner.firstName}
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <form method="POST" action="<c:url value="/user/login.htm"/>">
                            <p>
                                <label for="email">Email</label><input type="email" name="email"><br>
                                <label for="password">Password</label><input type="password" name="password"><br>
                                <input type="submit" value="Log in">
                            </p>
                        </form> 
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="<c:url value="/user/logout.htm"/>" id="logout">logout</a>
            </main>
        </div>
    </body>
</html>
