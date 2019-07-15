package io.web.controller;
import domain.Actor;
import domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import ui.MovieBean;

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



}



