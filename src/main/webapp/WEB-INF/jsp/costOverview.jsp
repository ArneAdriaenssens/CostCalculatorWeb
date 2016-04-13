<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CostOverview - CostCalculator</title>
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
                        <li id="actual"><a href="<c:url value="/cost.htm"/>"><spring:message code="lbl.costpage"/></a></li>
                    </ul>
                </nav>
                <h2>
                    <spring:message code="lbl.costpage"/>
                </h2>
            </header>
            <main>
                <span style="float: right">
                    <a href="?lang=en">en</a> 
                    <a href="?lang=nl">nl</a>
                </span>
                <table>
                    <thead>
                    <th><spring:message code="lbl.total"/></th>
                    <th><spring:message code="lbl.totalprice"/></th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                ${total}
                            </td>
                            <td>
                                ${totalPrice}
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <thead>
                    <th><spring:message code="lbl.price"/></th>
                    <th><spring:message code="lbl.dollar"/></th>
                    <th><spring:message code="lbl.location"/></th>
                    <th><spring:message code="lbl.description"/></th>
                    </thead>
                    <tbody>
                    <script>
                        var json = '${exchange}';
                        obj = JSON.parse(json);
                        var dollarkoers = obj.rates.USD;
                    </script>
                    <c:forEach var="cost" items="${costs}">
                        <tr>
                            <td>${cost.price}</td>
                            <td><script>document.write(parseFloat(dollarkoers*${cost.price}).toFixed(2));</script></td>
                            <td>${cost.location}</td><td>${cost.description}</td>
                            <td><a href="<c:url value="/cost/${cost.id}.htm"/>"><spring:message code="lbl.edit"/></a></td>
                        </tr> 
                    </c:forEach>
                    </tbody>
                </table>
                <form action="<c:url value="/cost/new.htm"/>" method="GET">
                    <input type="submit" value="<spring:message code='lbl.new'/> " id="new">
                </form> 
                <br>
                <a href="<c:url value="/user/logout.htm"/>" id="logout"><spring:message code="lbl.logout"/></a>
            </main>
        </div>
    </body>
</html>