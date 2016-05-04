<%-- 
    Document   : header
    Created on : 4-mei-2016, 11:56:03
    Author     : arnea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <body>
        <img src="<c:url value="/images/CostBanner.jpg"/>"></img>
        <nav>
            <ul>
                <li id="actual"><a href="<c:url value="/user.htm"/>" >Home</a></li>
                <li><a href="<c:url value="/cost.htm"/>"><spring:message code="lbl.costpage"/></a></li>
            </ul>
        </nav>
    </body>
</html>
