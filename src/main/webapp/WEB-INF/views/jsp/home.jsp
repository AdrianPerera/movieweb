<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">




<center><h1><b>  MovieWeb Home Page </b></h1></center>

</head>

    <body>


        <div class="container">
          <ul class="nav nav-tabs nav-justified" role="tablist">
            <li class="active"><a href="#movies"> <h5>MOVIES</h5></a></li>
            <li><a href="#actors"> <h5>ACTORS</h5></a></li>

          </ul>


          <div class="tab-content">
            <div id="movies" class="tab-pane fade in active">
              <h3>Movies</h3>
              <p></p>
                <div class="container">
                    <div class="row">
                        <c:forEach items="${movieList}" var="movieList">
                            <div class="col-md-4 sm-4" >
                                <div class="well well-sm">
                                     <table align="center">
                                          <tr>
                                               <td colspan="2">
                                                <a href="/movieweb/movie/show">
                                                <img src="${movieList.imgurl}" alt="Responsive image" class="img-rounded"  style="width:200px; height:300px;border:3;">
                                                </a>
                                               </td>
                                          </tr>
                                          <tr>
                                            <td> Movie:</td>
                                            <td>${movieList.name}</td>
                                         </tr>
                                         <tr>
                                            <td> Released Year:</td>
                                            <td>${movieList.year}</td>
                                         </tr>
                                         <tr>
                                            <td> Genre:</td>
                                            <td>${movieList.genre}</td>
                                         </tr>
                                     </table>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>



            <div id="actors" class="tab-pane fade">
              <h3>Actors</h3>
                <div class="container">
                      <div class="row">
                           <c:forEach items="${actorList}" var="act">
                                  <div class="col-md-4 sm-4">
                                       <div class="well well-sm">
                                           <table align="center">
                                               <tr>
                                                    <td colspan="2">
                                                       <a href="/movieweb/movie/show">
                                                        <img src="${act.details}" alt="Responsive image" class="img-rounded" style="width:200px;height:200px;border:3;">
                                                       </a>
                                                    </td>
                                                </tr>
                                               <tr>
                                                  <td>Actor:</td>
                                                  <td>${act.name}</td>
                                               </tr>
                                           </table>
                                      </div>
                                  </div>
                            </c:forEach>
                      </div>
                  </div>

            </div>

          </div>
        </div>



<footer class="container-fluid text-center">
    <nav class="navbar navbar-fixed-bottom">
         <div class="container">
                <button class="btn btn-primary" onclick="location.href='/movieweb/movie/movieForm'">ADD MOVIES</button>
                <button class="btn btn-primary" onclick="location.href='/movieweb/actor/actorForm'">ADD ACTORS</button>
         </div>
    </nav>

</footer>
    <spring:url value="/resources/core.js/hello.js" var="coreJs" />
    <spring:url value="/resources/core.js/bootstrap.min.js" var="bootstrapJs" />
    <script src="${coreJs}"></script>
    <script src="${bootstrapJs}"></script>


    <script>
    $(document).ready(function(){
      $(".nav-tabs a").click(function(){
        $(this).tab('show');
      });
    });
    </script>


</body>



</html>




