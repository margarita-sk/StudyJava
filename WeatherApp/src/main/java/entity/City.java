package entity;

import lombok.Data;

/**
 * The {@code City} class describes the city with name, latitude and longitude
 * fields.
 * 
 * @author Margarita Skokova
 */
@Data
public class City {

	private String name;
	private String latitude;
	private String longitude;

}
