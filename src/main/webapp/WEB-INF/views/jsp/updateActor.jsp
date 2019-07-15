<!--this is the update page -->

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

<nav class="navbar navbar-fixed-bottom">
         <div class="container-fluid">
                <button class="btn btn-primary" onclick="location.href='/movieweb/actor/home'">HOME</button>
         </div>
</nav>


</head>

<body>
<p>${message}</p>

  <div class="container">
        <form:form class="form-horizontal" method="post" modelAttribute="message" action="/movieweb/actor/edit?id=${message._id}">
           <div class="form-row">
            <div class="col-md-4 ">
                <label class="col-sm-1 control-label">Name</label>
                <form:input path="name" class="form-control" type="text"/></br>
            </div>
            <div class="col-md-4 ">
                <label class="col-sm-1 control-label">Date_Of_Birth</label>
                <form:input path="dob" class="form-control" type="text"/></br>
            </div>
            <div class="col-md-4 ">
                <label class="col-sm-1 control-label">Details</label>
                <form:input path="details" class="form-control" type="text"/></br>
            </div>
          </div>
             <button type="submit" class="btn btn-primary" >Edit Save</button>
        </form:form>
    </div>

<p>${message._id}</p




<spring:url value="/resources/core.js/hello.js" var="coreJs" />
<spring:url value="/resources/core.js/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</body>
</html>


