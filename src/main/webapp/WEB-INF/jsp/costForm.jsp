<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
                        <li><a href="<c:url value="/index.htm"/>" >Home</a></li>
                        <li><a href="<c:url value="/cost.htm"/>">Cost Overview</a></li>
                    </ul>
                </nav>
                <h2>
                    Cost Form
                </h2>

            </header>
            <main>
                <c:if test="${not empty error}">
                    <div class="alert-danger">
                        <ul>
                            <c:forEach var="errors" items="${error}">
                                <li><c:out value="${errors}"/></li>
                                </c:forEach>
                        </ul>
                    </div>
                </c:if>

                <form method="POST" action="<c:url value="/cost/save.htm"/>">
                    <p>
                        <label for="price">Price:</label><input type="number" id="price" name="price" value="${newCost.price}">
                    </p>
                    <p>
                        <label for="location">Location:</label><input type="text" id="location" name="location" value="${newCost.location}">
                    </p>
                    <p>
                        <label for="description">Description:</label><input type="text" id="description" name="description" value="${newCost.description}">
                    </p>
                    <p
                        <label for="category">Category:</label>
                        <select name="category" id="category">
                            <option value="FOOD">Food</option>
                            <option value="DRINKS">Drinks</option>
                            <option value="FREETIME">Freetime</option>
                        </select>
                    </p>
                    <p>
                        <input type="hidden" value="${newCost.id}" name="id">
                        <input type="submit" value="Save cost">
                    </p>
                </form> 
            </main>
        </div>
    </body>
</html>
