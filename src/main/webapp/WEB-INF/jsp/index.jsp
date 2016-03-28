<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - CostCalculator</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    </head>

    <body>
        <div id="container">
            <header>
                <h1><span><spring:message code="lbl.index"/></span></h1>
                <img src="<c:url value="/images/CostBanner.jpg"/>"></img>
                <nav>
                    <ul>
                        <li id="actual"><a href="<c:url value="/user.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>"><spring:message code="lbl.costpage"/></a></li>
                    </ul>
                </nav>
                <h2>
                    Home
                </h2>
            </header>
            <main>
                <span style="float: right">
                    <a href="?lang=en">en</a> 
                    <a href="?lang=nl">nl</a>
                </span>
                <c:choose>
                    <c:when test="${owner!=null}">
                        <h3>
                            <spring:message code="lbl.hello"/> ${owner.firstName}
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <form:form method="post" commandName="user" action="/CostCalculatorWeb/user/login.htm">
                            <p>
                                <form:errors path="email" id="errors"/>
                            </p>
                            <p>
                                <label for="email"><spring:message code="lbl.email"/></label><form:input type="email" path="email"/>
                            </p>
                            <p>
                                <form:errors path="password" id="errors"/>
                            </p>
                            <p>
                                <label for="password"><spring:message code="lbl.password"/></label><form:password path="password"/>
                            </p>
                            <p>
                                <input type="submit" value="<spring:message code="lbl.login"/>">
                            </p>
                        </form:form> 
                    </c:otherwise>
                </c:choose>
                <br>
                <a href="<c:url value="/user/register.htm"/>" id="register" style="float:right"><spring:message code="lbl.register"/></a>
                <br>
                <a href="<c:url value="/user/logout.htm"/>" id="logout"><spring:message code="lbl.logout"/></a>
            </main>
        </div>
    </body>
</html>
