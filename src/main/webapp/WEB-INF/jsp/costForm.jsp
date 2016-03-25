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
                    Cost Form
                </h2>

            </header>
            <main>
                <form:form id="costForm" commandName="cost" method="post" action="/CostCalculatorWeb/cost/save.htm" >
                    <p>
                        <form:errors path="price" id="errors"/>
                    </p>
                    <p>
                        <label for="price">Price:</label><form:input type="number" id="price" path="price" value="${cost.price}" />
                    </p>
                    <p>
                        <form:errors path="location" id="errors"/>
                    </p>
                    <p>
                        <label for="location">Location:</label><form:input type="text" id="location" path="location" value="${cost.location}"/>
                    </p>
                    <p>
                        <form:errors path="description" id="errors"/>
                    </p>
                    <p>
                        <label for="description">Description:</label><form:input type="text" id="description" path="description" value="${cost.description}"/>
                    </p>
                    <p>
                        <form:select path="category" items="${categories}"/>
                        <form:hidden value="${cost.id}" path="id"/>
                        <form:hidden value="${owner.email}" path="owner"/>
                        <input type="submit" value="Save cost"/>
                    </p>
                </form:form> 
            </main>
        </div>
    </body>
</html>
