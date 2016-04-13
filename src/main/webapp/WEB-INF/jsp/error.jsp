<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="<c:url value="/images/favicon.png"/>">
        <title>Error - CostCalculator</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
    </head>

    <body>
        <div id="container">
            <header>
                <img src="<c:url value="/images/CostBanner.jpg"/>"></img>
                <h2>
                    Error
                </h2>
            </header>
            <main>
                <div id="error">
                    <h3>An error has occured, please try again.</h3>
                    <a href="<c:url value="/user.htm"/>">return</a>
                    <img src="<c:url value="/images/sad piggy.jpg"/>"></img>
                </div>
            </main>
        </div>
    </body>
</html>
