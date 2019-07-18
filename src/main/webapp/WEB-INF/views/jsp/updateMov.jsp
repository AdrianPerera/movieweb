<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


 <nav class="navbar navbar-default">
         <div class="container-fluid">
                <button class="btn btn-dark" onclick="location.href='/movieweb/movie/home'">HOME</button>
         </div>
 </nav>


</head>

<body>
<h1><b><center>MOVIE UPDATE FORM</center></b></h1>

<p>${movie.id}</p>
<p>${movie.name}</p>

    <div class="container">
        <form:form class="form-horizontal" method="post" modelAttribute="movie" action="/movieweb/movie/edit">

                <form:input path="id" class="form-control" type="hidden" value="${movie.id}"/></br>

                    <div class="form-row">
                       <div >
                           <label class="col-sm-1 control-label">Name</label>
                           <form:input path="name" class="form-control" type="text"/></br>
                       </div>
                       <div>
                            <label class="col-sm-1 control-label">Year</label>
                            <form:input path="year" class="form-control" type="integer" placeholder="1996"/></br>
                       </div>
                       <div>
                           <label class="col-sm-1 control-label">Genre</label>
                           <form:input path="genre" class="form-control" type="text"/></br>
                       </div>

                       <div>
                              <label class="col-sm-1 control-label">Actors</label>
                              <form:select path="actorIds" id="lstActors"  multiple="multiple">
                                        <c:forEach items="${oldList}" var="old">
                                           <option value="${old._id}" selected>
                                               ${old.name}
                                           </option>
                                       </c:forEach>
                                       <c:forEach items="${actorList}" var="actor">
                                           <option value="${actor._id}" >
                                               ${actor.name}
                                           </option>
                                       </c:forEach>
                               </form:select>

                       </div>

                       <div>
                           <label class="col-sm-1 control-label">description</label>
                           <form:input path="description" class="form-control" type="text"/></br>
                       </div>
                       <div>
                           <label class="col-sm-1 control-label">Image_URL</label>
                           <form:input path="imgurl" class="form-control" type="text"/></br>
                       </div>
                       <div>
                        <button type="submit" class="btn btn-Success " >Edit Save</button>
                       <div>
                    </div>




               </form:form>

    </div>



<spring:url value="/resources/core.js/hello.js" var="coreJs" />
<spring:url value="/resources/core.js/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>



</body>
</html>

