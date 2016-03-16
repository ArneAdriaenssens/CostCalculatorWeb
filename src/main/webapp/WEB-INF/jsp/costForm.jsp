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
                <c:choose>
                    <c:when test="${user!=null}">
                        <h3>
                            Hello ${user.firstName}
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <form method="POST" action="">
                            <p>
                                <label for="price">Price:</label><input type="number" name="price">
                            </p>
                            <p>
                                <label for="location">Location:</label><input type="text" name="location">
                            </p>
                            <p>
                                <label for="description">Description:</label><input type="text" name="description">
                            </p>
                            <p>
                                <label for="category">Category:</label>
                                <select name="category" form="categoryform">
                                    <option value="FOOD">Food</option>
                                    <option value="DRINKS">Drinks</option>
                                    <option value="FREETIME">Freetime</option>
                                </select>
                            </p>
                            <p>
                                <input type="hidden" name="owner" value="${owner}"> 
                            </p>
                            <p>
                                <input type="submit" value="Add cost">
                            </p>
                        </form> 
                    </c:otherwise>
                </c:choose>
            </main>
        </div>
    </body>
</html>
