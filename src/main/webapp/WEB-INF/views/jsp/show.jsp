<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>

<spring:url value="/resources/core.css/hello.css" var="coreCss" />
<spring:url value="/resources/core.css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>
<p>The show page</p>

<div class="container">

        <table class="table table-striped">
        <thead>
        <tr>
            <th>Name</th>
            <th>DOB</th>
            <th>Details</th>
          <td>  <button class="btn btn-primary" onclick="location.href='/home'">GO BACK</button>
            <th>Breed</th>
            </td>
        </tr>
        </thead class="thead-dark">
        <c:forEach items="${message}" var="result" varStatus="loop">
                    <tr>

                    		<td>${result.name}</td>
                    		<td>${result.dob}</td>
                    		<td>${result.details}</td>

                    		<td>
                                 <button class="btn btn-danger" onclick="location.href='/movieweb/delete-actor?id=${result._id}'">Delete</button>
                            </td>
                    </tr>

        </c:forEach>


        </table>



</div>






<spring:url value="/resources/core.js/hello.js" var="coreJs" />
<spring:url value="/resources/core.js/bootstrap.min.js" var="bootstrapJs" />
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>



