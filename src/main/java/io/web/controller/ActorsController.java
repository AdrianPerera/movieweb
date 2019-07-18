package io.web.controller;

import domain.Actor;
import domain.Movie;
import facades.MovieFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import ui.ActorBean;
import ui.MovieBean;
import ui.Moviesget;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/actor")
public class ActorsController {

    RestTemplate restTemplate = new RestTemplate();

//    private final MovieFacade movieFacade;
//
//    @Autowired
//    public ActorsController(MovieFacade movieFacade) {
//        this.movieFacade = movieFacade;
//    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String gotoHome(ModelMap model) {
        String s1 = "This is sent by the ActorsController";

        Actor[] L1 = restTemplate.getForObject("http://localhost:8081/actor/",Actor[].class);
        model.addAttribute("actorList",L1);
//        model.addAttribute("movieList",movieFacade.getMovies());
        Moviesget[] L2 = restTemplate.getForObject("http://localhost:8081/actor/", Moviesget[].class);
        model.addAttribute("movieList",L2);
        model.addAttribute("message", s1);
        return "home";                //returns to the home page
    }


    @RequestMapping(value = "/actorForm", method = RequestMethod.GET)
    public String addActor(ModelMap model) {

        model.addAttribute("message", new Actor()); //sending an empty object to the /actorForm
        return "actorForm";
    }

    //Coming back to the controller from actorForm
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String actorsformSubmit(@ModelAttribute("message") Actor actors, Model model) {

        Actor obj = new Actor();                    //calling a new object for pet called obj
        obj.setName(actors.getName());                //Setting all data to the Actors object obj
        obj.setDob(actors.getDob());
        obj.setDetails(actors.getDetails());

        //restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

        Actor addac = restTemplate.postForObject("http://localhost:8081/actor/", obj, Actor.class);
        //sending the data to the API with postForObject
        Actor[] s1 = restTemplate.getForObject("http://localhost:8081/actor/", Actor[].class);

        model.addAttribute("message", s1);
        return "showactor";

    }


    @RequestMapping(value = "delete-actor", method = RequestMethod.GET)
    public String deleteActor(@RequestParam("id") String id, Model model) {
        String uri = "http://localhost:8081/actor/" + id;
        restTemplate.delete(uri);  //this will send the url to the API to delete

        Actor[] s1 = restTemplate.getForObject("http://localhost:8081/actor/", Actor[].class); //calling getall

        model.addAttribute("message", s1);
        return "showactor";
    }

    @RequestMapping(value = "update-actor", method = RequestMethod.GET)
    public String updateActor(@RequestParam("id") String id, Model model) {
        String uri = "http://localhost:8081/actor/get/" + id;

        Actor s1 = restTemplate.getForObject(uri, Actor.class); //recruiting the info of respective id from database

        ActorBean actorBean = new ActorBean();
        actorBean.setId(s1.get_id());
        actorBean.setName(s1.getName());
        actorBean.setDob(s1.getDob());
        actorBean.setDetails(s1.getDetails());

        model.addAttribute("message", actorBean);
        return "updateActor";                       //sending the data to update form to update
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)  //Saving the updated info
    public String editActor(@ModelAttribute("message") ActorBean actorBean, Model model) {
        String upuri = "http://localhost:8081/actor/" + actorBean.getId();

        Actor obj = new Actor();
        obj.set_id(actorBean.getId());
        obj.setName(actorBean.getName());
        obj.setDob(actorBean.getDob());
        obj.setDetails(actorBean.getDetails());

        restTemplate.put(upuri, obj);    //sending data to the put

        Actor[] s1 = restTemplate.getForObject("http://localhost:8081/actor/", Actor[].class);

        model.addAttribute("message", s1);
        return "showactor";

    }

}




