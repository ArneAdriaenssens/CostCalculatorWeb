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
                        <li><a href="<c:url value="/index.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>">Cost Overview</a></li>
                    </ul>
                </nav>
                <h2>
                    Register Form
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

                <form method="POST" action="<c:url value="/user/save.htm"/>">
                    <p>
                        <label for="firstName">First name:</label><input type="text" id="firstName" name="firstName">
                    </p>
                    <p>
                        <label for="lastName">Last name:</label><input type="text" id="lastName" name="lastName">
                    </p>
                    <p>
                        <label for="email">Email:</label><input type="email" id="email" name="email">
                    </p>
                    <p>
                        <label for="password">Password:</label><input type="password" id="password" name="password">
                    </p>
                    <p>
                        <input type="submit" value="Register">
                    </p>
                </form> 
            </main>
        </div>
    </body>
</html>
