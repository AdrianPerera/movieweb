package io.web.controller;
import domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import ui.MovieBean;
import ui.Moviesget;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/movie")
public class MoviesController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping (value = "/home",method= RequestMethod.GET)
    public String gotoHome(ModelMap model){
        String s1= "This is sent by the MoviesController";

        List L1 = restTemplate.getForObject("http://localhost:8081/actor/",List.class);
        model.addAttribute("actorList",L1);
        List L2 = restTemplate.getForObject("http://localhost:8081/movie/",List.class);
        model.addAttribute("movieList",L2);

        model.addAttribute("message",s1);
        return "home";
    }

    @RequestMapping (value = "/movieForm",method=RequestMethod.GET)
    public String  addMovie(Model model){

        List actorList = restTemplate.getForObject("http://localhost:8081/actor/",List.class);


        model.addAttribute("actorList",actorList); //sending an array list of actors as message
        model.addAttribute("movie", new MovieBean());
        return "movieForm";
    }

    @RequestMapping (value = "/add" , method=RequestMethod.POST)
    public String saveMovie(@ModelAttribute("movie") MovieBean movieBean,Model model){
            Movie obj= new Movie();
            obj.setName(movieBean.getName());
            obj.setYear(movieBean.getYear());
            obj.setGenre(movieBean.getGenre());
            obj.setDescription(movieBean.getDescription());
            obj.setImgurl(movieBean.getImgurl());

             List<String> actorsIdList = new ArrayList<String >();
             String[] idArray = movieBean.getActorIds().split(",");
             for (String id : idArray){
                actorsIdList.add(id);
             }

             obj.setActorIds(actorsIdList);

             String url="http://localhost:8081/movie/" ;

             Movie movies=restTemplate.postForObject(url,obj,Movie.class);
             String id= movies.get_id();

             Moviesget nowobj=restTemplate.getForObject("http://localhost:8081/movie/"+id,Moviesget.class);
             model.addAttribute("movies",nowobj);

//             model.addAttribute("message");
             return "showmovie";
    }

    @RequestMapping(value = "/update-movie", method = RequestMethod.GET)
    public String updateMovie(@RequestParam("id") String id, Model model) {
        String uri = "http://localhost:8081/movie/" + id;


        Moviesget mvg = restTemplate.getForObject(uri, Moviesget.class); //recruiting the info of respective id from database

        MovieBean movieBean=new MovieBean();

        movieBean.setId(mvg.get_id());
        movieBean.setName(mvg.getName());
        movieBean.setYear(mvg.getYear());
        movieBean.setDescription(mvg.getDescription());
        movieBean.setGenre(mvg.getGenre());
        movieBean.setImgurl(mvg.getImgurl());

        List s2=mvg.getActors();  //previously selected list of actors
        List actorList = restTemplate.getForObject("http://localhost:8081/actor/",List.class); //new list of actors

        model.addAttribute("oldList",s2);
        model.addAttribute("actorList",actorList);
        model.addAttribute("movie",movieBean);
        return "updateMov";                       //sending the data to update form to update
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)  //Saving the updated info
    public String editMovie(@ModelAttribute("movie") MovieBean movieBean, Model model) {
        String upuri = "http://localhost:8081/movie/" + movieBean.getId();

        Movie obj= new Movie();
        obj.set_id(movieBean.getId());
        obj.setName(movieBean.getName());
        obj.setYear(movieBean.getYear());
        obj.setGenre(movieBean.getGenre());
        obj.setDescription(movieBean.getDescription());
        obj.setImgurl(movieBean.getImgurl());

        List<String> actorsIdList = new ArrayList<String >();
        String[] idArray = movieBean.getActorIds().split(",");
        for (String id : idArray){
            actorsIdList.add(id);
        }

        obj.setActorIds(actorsIdList);


        restTemplate.put(upuri, obj);    //sending data to the put

        Moviesget[] s1 = restTemplate.getForObject("http://localhost:8081/movies/", Moviesget[].class); //calling getall

        model.addAttribute("listMovies", s1);
        return "showmovies";


    }


    @RequestMapping(value = "/delete-movie", method = RequestMethod.GET)
    public String deleteMovie(@RequestParam("id") String id, Model model) {
        String uri = "http://localhost:8081/movie/" + id;
        restTemplate.delete(uri);  //this will send the url to the API to delete

        Moviesget[] s1 = restTemplate.getForObject("http://localhost:8081/movie/", Moviesget[].class); //calling getall

        model.addAttribute("message", s1);
        return "showmovies";
    }


    @RequestMapping(value="/show",method=RequestMethod.GET)
    public String show(Model model){

        Moviesget[] s1 = restTemplate.getForObject("http://localhost:8081/movie/", Moviesget[].class); //calling getall

        model.addAttribute("listMovies", s1);  //showmovies is expecting a listMovies model
        return "showmovies";
    }

}



