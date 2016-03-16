<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CostOverview - CostCalculator</title>
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
                        <li id="actual"><a href="<c:url value="/cost.htm"/>">Cost Overview</a></li>
                    </ul>
                </nav>
                <h2>
                    Cost Overview
                </h2>
            </header>
            <main>
                <c:if test="${not empty error}">
                    <div 