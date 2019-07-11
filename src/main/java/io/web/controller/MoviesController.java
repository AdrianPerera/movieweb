package io.web.controller;

import domain.Movies;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;


@Controller
@RequestMapping("/movies")
public class MoviesController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping (value = "/home",method= RequestMethod.GET)
    public String gotoHome(ModelMap model){
        String s1= "This is sent by the MoviesController";
        model.addAttribute("message",s1);
        return "home";
    }


}







