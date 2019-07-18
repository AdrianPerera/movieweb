package io.web.controller;
import domain.Actor;
import domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
        model.addAttribute("message",s1);
        return "home";
    }

    @RequestMapping (value = "/movieForm",method=RequestMethod.GET)
    public String  addMovie(Model model){

        List actorList = restTemplate.getForObject("http://localhost:8081/actor/",List.class);
//        Actor[] s1 = restTemplate.getForObject("http://localhost:8081/actor/", Actor[].class);


        model.addAttribute("actorList",actorList); //sending an array list of actors as message
        model.addAttribute("movie", new MovieBean());
        return "movieForm";
    }

    @RequestMapping (value = "/add" , method=RequestMethod.POST)
    public String saveMovie(@ModelAttribute("movie") MovieBean movieBean,Model model){
            Movie obj= new Movie();
            obj.setName(movieBean.getName());
            obj.setYear(movieBean.getYear());
            obj.setGenere(movieBean.getGenre());
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

             model.addAttribute("message");
             return "showmovie";


    }


}



