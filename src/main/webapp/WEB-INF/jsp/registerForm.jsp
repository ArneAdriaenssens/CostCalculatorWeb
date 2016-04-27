<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="<c:url value="/images/favicon.png"/>">
        <title>Home - CostCalculator</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    </head>

    <body>
        <div id="container">
            <header>
                <h1><span><spring:message code="lbl.index"/></span></h1>
                <img src="<c:url value="/images/CostBanner.jpg"/>">
                <nav>
                    <ul>
                        <li><a href="<c:url value="/user.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>"><spring:message code="lbl.costpage"/></a></li>
                    </ul>
                </nav>
                <h2>
                    <spring:message code="lbl.registerform"/>
                </h2>

            </header>
            <main>
                <form:form id="userForm" commandName="user" method="post" action="${pageContext.request.contextPath}/user/save.htm" >
                    <p>
                        <form:errors path="firstName" id="errors"/>
                    </p>
                    <p>
                        <label for="firstName"><spring:message code="lbl.firstname"/>:</label><form:input type="text" path="firstName" id="firstName" name="firstName"/>
                    </p>
                    <p>
                        <form:errors path="lastName" id="errors"/>
                    </p>
                    <p>
                        <label for="lastName"><spring:message code="lbl.lastname"/>:</label><form:input type="text" id="lastName" path="lastName" name="lastName"/>
                    </p>
                    <p>
                        <form:errors path="email" id="errors"/>
                    </p>
                    <p>
                        <label for="email"><spring:message code="lbl.email"/>:</label><form:input type="email" id="email" path="email" name="email"/>
                    </p>
                    <p>
                        <form:errors path="password" id="errors"/>
                    </p>
                    <p>
                        <label for="password"><spring:message code="lbl.password"/>:</label><form:input type="password" id="password" path="password" name="password"/>
                    </p>
                    <p>
                        <input type="submit" value="<spring:message code="lbl.register"/>">
                    </p>
                </form:form> 
            </main>
        </div>
    </body>
</html>
