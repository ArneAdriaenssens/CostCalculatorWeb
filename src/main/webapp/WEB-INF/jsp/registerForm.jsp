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
                        <li><a href="<c:url value="/user.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>">Cost Overview</a></li>
                    </ul>
                </nav>
                <h2>
                    Register Form
                </h2>

            </header>
            <main>
                <form:form id="userForm" commandName="newUser" method="post" action="/CostCalculatorWeb/user/save.htm" >
                    <p>
                        <form:errors path="firstName" id="errors"/>
                    </p>
                    <p>
                        <label for="firstName">First name:</label><form:input type="text" path="firstName" id="firstName" name="firstName"/>
                    </p>
                    <p>
                        <form:errors path="lastName" id="errors"/>
                    </p>
                    <p>
                        <label for="lastName">Last name:</label><form:input type="text" id="lastName" path="lastName" name="lastName"/>
                    </p>
                    <p>
                        <form:errors path="email" id="errors"/>
                    </p>
                    <p>
                        <label for="email">Email:</label><form:input type="email" id="email" path="email" name="email"/>
                    </p>
                    <p>
                        <form:errors path="password" id="errors"/>
                    </p>
                    <p>
                        <label for="password">Password:</label><form:input type="password" id="password" path="password" name="password"/>
                    </p>
                    <p>
                        <input type="submit" value="Register">
                    </p>
                </form:form> 
            </main>
        </div>
    </body>
</html>
