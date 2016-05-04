<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CostOverview - CostCalculator</title>
        <link rel="icon" type="image/png" href="<c:url value="/images/favicon.png"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    </head>
    <body>
        <div id="container">
            <header>
                <h1><span><spring:message code="lbl.index"/></span></h1>
                <%@include file="/WEB-INF/jsp/header.jsp" %>
                <h2>
                    <spring:message code="lbl.costpage"/>
                </h2>
            </header>
            <main>
                <%@include file="/WEB-INF/jsp/changeLanguage.jsp" %>
                <table>
                    <thead>
                    <th><spring:message code="lbl.total"/></th>
                    <th><spring:message code="lbl.totalpriceeuro"/></th>
                    <th><spring:message code="lbl.totalpricedollar"/> ${currency} </th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                ${total}
                            </td>
                            <td>
                                ${totalPrice}
                            </td>
                            <td>
                                ${totalPrice * exchange}
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <thead>
                    <th><spring:message code="lbl.price"/></th>
                    <th><spring:message code="lbl.dollar"/> ${currency}</th>
                    <th><spring:message code="lbl.location"/></th>
                    <th><spring:message code="lbl.description"/></th>
                    </thead>
                    <tbody>
                        <c:forEach var="cost" items="${costs}">
                            <tr>
                                <td>${cost.price}</td>
                                <td>${cost.price * exchange}</td>
                                <td>${cost.location}</td><td>${cost.description}</td>
                                <td><a href="<c:url value="/cost/${cost.id}.htm"/>"><spring:message code="lbl.edit"/></a></td>
                                <td><a href="<c:url value="/cost/deletecost/${cost.id}.htm"/>"><spring:message code="lbl.delete"/></td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
                <form action="<c:url value="/cost/new.htm"/>" method="GET">
                    <input type="submit" value="<spring:message code='lbl.new'/> " id="new">
                </form> 
                <br>


                <form action="<c:url value="/cost/rate.htm"/>" method="POST">
                    <label for="rate"><spring:message code="lbl.rate"/>:</label>
                    <select name="rate">
                        <c:forEach var="current" items="${rates}">
                            <option value="${current}">${current}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Save rate"/>
                </form>

                <br>
                <a href="<c:url value="/user/logout.htm"/>" id="logout"><spring:message code="lbl.logout"/></a>
            </main>
        </div>
    </body>
</html>