package io.web.controller;


import domain.Actors;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;



@Controller
@RequestMapping("/actors")
public class ActorsController {

    RestTemplate restTemplate = new RestTemplate();

    @RequestMapping (value = "/home",method=RequestMethod.GET)
    public String gotoHome(ModelMap model){
        String s1= "This is sent by the ActorsController";
        model.addAttribute("message",s1);
        return "home";                //returns to the home page
    }


    @RequestMapping (value = "/actorForm",method=RequestMethod.GET)
    public String addActor(ModelMap model){

        model.addAttribute("message",new Actors()); //sending an empty object to the /actorForm
        return "actorForm";
    }

    //Coming back to the controller from actorForm
    @RequestMapping(value="/add", method=RequestMethod.POST)
    public String actorsformSubmit(@ModelAttribute("message") Actors actors, Model model)  {

        Actors obj= new Actors();					//calling a new object for pet called obj
        obj.setName(actors.getName());				//Setting all data to the Actors object obj
        obj.setDob(actors.getDob());
        obj.setDetails(actors.getDetails());

        //restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());

       // Actors addac = restTemplate.postForObject("http://localhost:8081/actors",obj, Actors.class);
        //sending the data to the API with postForObject
        //Actors[] s1 = restTemplate.getForObject("http://localhost:8081/actors/get-all", Actors[].class);

//        model.addAttribute("message", obj);		//Gets the message in to the model
        model.addAttribute("message");
        return "show";

    }

//
//    @RequestMapping (value = "delete-actor", method = RequestMethod.GET)
//    public String deletePet(@RequestParam ("id") String id, Model model){
//        String uri="http://localhost:8081/actors/"+id;
//        restTemplate.delete(uri);  //this will send the url to the API to delete
//
//        Object	pets= restTemplate.getForObject("http://localhost:8081/actors/all", Actors[].class);
//        model.addAttribute("message",pets);
//        return "result";


}




