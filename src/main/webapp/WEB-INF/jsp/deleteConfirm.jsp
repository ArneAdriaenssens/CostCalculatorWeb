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
                <img src="<c:url value="/images/CostBanner.jpg"/>"></img>
                <nav>
                    <ul>
                        <li><a href="<c:url value="/user.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>"><spring:message code="lbl.costpage"/></a></li>
                    </ul>
                </nav>
                <h2>
                    <spring:message code="lbl.costform"/>
                </h2>

            </header>
            <main>
                <h2><spring:message code="lbl.deletemessage"/></h2>
                <form action="<c:url value="/cost/deletecost/${id}.htm"/>" method="POST">
                    <input type="submit" value="<spring:message code="lbl.yes"/>"/>
                </form>
                <form action="<c:url value="/cost.htm"/>" method="GET">
                    <input type="submit" value="<spring:message code="lbl.no"/>"/>
                </form>
            </main>
        </div>
    </body>
</html>
