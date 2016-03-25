<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                        <li id="actual"><a href="<c:url value="/user.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>">Cost Overview</a></li>
                    </ul>
                </nav>
                <h2>
                    Home
                </h2>

            </header>
            <main>
                <c:choose>
                    <c:when test="${owner!=null}">
                        <h3>
                            Hello ${owner.firstName}
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <form:form method="post" commandName="user" action="/CostCalculatorWeb/user/login.htm">
                            <p>
                                <form:errors path="email" id="errors"/>
                            </p>
                            <p>
                                <label for="email">Email</label><form:input type="email" path="email"/>
                            </p>
                            <p>
                                <form:errors path="password" id="errors"/>
                            </p>
                            <p>
                                <label for="password">Password</label><form:password path="password"/>
                            </p>
                            <p>
                                <input type="submit" value="Log in">
                            </p>
                        </form:form> 
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="<c:url value="/user/register.htm"/>" id="register">Register</a>
                <br>
                <a href="<c:url value="/user/logout.htm"/>" id="logout">logout</a>
            </main>
        </div>
    </body>
</html>
