<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Maven + Spring MVC</title>

</head>

<body>


  <div class="container">
        <form:form class="form-horizontal" method="post" modelAttribute="message" action="/movieweb/show">
           <div class="form-row">
            <div class="col-md-4 mb-3">
            <label class="col-sm-1 control-label">Name</label>
            <form:input path="name" class="form-control" type="text"/></br>
            </div>
           <div class="col-md-4 mb-3">
            <label class="col-sm-1 control-label">Species</label>
            <form:input path="dob" class="form-control" type="text"/></br>
            </div>
           <div class="col-md-4 mb-3">
            <label class="col-sm-1 control-label">Breed</label>
            <form:input path="details" class="form-control" type="text"/></br>
            </div>
          </div>
             <button type="submit" class="btn btn-primary " >Submit</button>
        </form:form>
    </div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</body>
</html>