package service.interfaces;

import entity.City;
import entity.Weather;

/**
 * The {@code WeatherService} interface provides the information about the
 * weather
 * 
 * @author Margarita Skokova
 */
public interface WeatherService {

	Weather getWeather(City city);

}
