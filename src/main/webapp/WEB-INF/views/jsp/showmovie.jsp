<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Results page</title>

<spring:url value="/resources/core.css/hello.css" var="coreCss" />
<spring:url value="/resources/core.css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>

<h><center>View Movie</center></h>

<div class="container">

        <table class="table table-striped">
        <thead>
        <tr>

            <th>ID</th>
            <th>Name</th>
            <th>Year</th>
            <th>Genre</th>
            <th>Description</th>
            <th>imgurl</th>


            <td>  <button class="btn btn-primary" onclick="location.href='/movieweb/movie/movieForm'">GO BACK</button>
            <td>  <button class="btn btn-dark" onclick="location.href='/movieweb/movie/home'">HOME</button>
            </td>
        </tr>
        </thead class="thead-dark">

                <tr>
                        <td>${movies._id}</td>
                        <td>${movies.name}</td>
                        <td>${movies.year}</td>
                        <td>${movies.genre}</td>
                        <td>${movies.description}</td>
                        <td>${movies.imgurl}</td>
                         <td>
                            <c:forEach var="emp" items="${movies.actors}">

                                        <li>${emp.name}</li>

                            </c:forEach>

                        </td>

                        <td>

                            <button class="btn btn-danger" onclick="location.href='/movieweb/movie/delete-movie?id=${movies._id}'">Delete</button>
                            <button class="btn btn-secondary" onclick="location.href='/movieweb/movie/update-movie?id=${movies._id}'">Edit</button>

                        </td>
                </tr>




        </table>



</div>


<spring:url value="/resources/core.js/hello.js" var="coreJs" />
<spring:url value="/resources/core.js/bootstrap.min.js" var="bootstrapJs" />
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>



