package io.web.controller;

import domain.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;


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
    public String addMovie(ModelMap model){

        model.addAttribute("message",new Movie()); //sending an empty object to the /movieForm
        return "movieForm";
    }




}



