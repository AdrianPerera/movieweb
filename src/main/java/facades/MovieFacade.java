package facades;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Component
public class MovieFacade {

    RestTemplate restTemplate = new RestTemplate();

    public List getMovies(){
        return restTemplate.getForObject("http://localhost:8081/movie/",List.class);
    }
}
