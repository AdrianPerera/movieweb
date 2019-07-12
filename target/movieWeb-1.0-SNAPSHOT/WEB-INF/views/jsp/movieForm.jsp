<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<body>

    <div class="container">
        <form:form class="form-horizontal" method="post" modelAttribute="message" action="/movieweb/movies/add">
           <div class="form-row">
            <div class="col-md-4 mb-3">
            <label class="col-sm-1 control-label">Name</label>
            <form:input path="name" class="form-control" type="text"/></br>
            </div>
           <div class="col-md-4 mb-3">
            <label class="col-sm-1 control-label">Year</label>
            <form:input path="species" class="form-control" type="integer"/></br>
            </div>
           <div class="col-md-4 mb-3">
            <label class="col-sm-1 control-label">Genere</label>
            <form:input path="breed" class="form-control" type="text"/></br>
            </div>
          </div>

          <div>
            <label class="col-sm-1 control-label">description</label>
            <form:input path="name" class="form-control" type="text"/></br>
          </div>
          <div>
               <label class="col-sm-1 control-label">Image_URL</label>
               <form:input path="name" class="form-control" type="text"/></br>
          </div>


             <button type="submit" class="btn btn-primary " >Submit</button>
        </form:form>
    </div>



<spring:url value="/resources/core/css/hello.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />

<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>