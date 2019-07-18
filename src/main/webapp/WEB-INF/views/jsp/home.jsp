<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>

<spring:url value="/resources/core.css/hello.css" var="coreCss" />
<spring:url value="/resources/core.css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />


<h1><b>
MovieWeb Home Page  </p>${message}</p>
</b></h1>

</head>

    <body>

        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->

               <div class="tab">

                     <button class="tablinks" onclick="openCity(event, 'Movies')">MOVIES</button>
                     <button class="tablinks" onclick="openCity(event, 'Actors')">ACTORS</button>
               </div>


               <form class="navbar-form navbar-right" role="search">
                  <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                  </div>
                    <button type="submit" class="btn btn-default">SEARCH</button>
               </form>

            </div><!-- /.navbar-collapse -->

          </div><!-- /.container-fluid -->

        </nav>




  <div id="Movies" class="tabcontent">
      <h3>_MOVIES_</h3>
      <p>This page has the CONTENT OF movies</p>
      <p>${movieList}</p>




  </div>


  <div id="Actors" class="tabcontent">
    <h3>_ACTORS_</h3>
    <p>This page is about the actors</p>
      <p>${actorList}</p>
  </div>

    <nav class="navbar navbar-fixed-bottom">
         <div class="container-fluid">
                <button class="btn btn-primary" onclick="location.href='/movieweb/movie/movieForm'">ADD MOVIES</button>
                <button class="btn btn-primary" onclick="location.href='/movieweb/actor/actorForm'">ADD ACTORS</button>
         </div>
    </nav>


<spring:url value="/resources/core.js/hello.js" var="coreJs" />
<spring:url value="/resources/core.js/bootstrap.min.js" var="bootstrapJs" />
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>


</body>



</html>




