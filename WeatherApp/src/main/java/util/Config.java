package util;

import java.io.FileInputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * The {@code Config} is an utility class which provides properties
 * 
 * @author Margarita Skokova
 */
public class Config {
	private static final Logger log = Logger.getLogger(Config.class);
	private static String rootPath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
	private static String rootPathWebDB = System.getProperty("user.home");

	private static Properties properties;

	public enum Key {
		JDBC_DRIVER("driver"), DB_URL("host"), DB_USER("username"), DB_PASSWORD("password"), DB_TYPE("db.type"),
		GEOCODER_URL("geocoder.url"), GEOCODER_KEY("geocoder.key"), GEOCODER_VALUE("geocoder.value"),
		GEOCODER_OUTPUT_FORMAT("geocoder.format"), GEOCODER_LANG("geocoder.language"), WEATHER_URL("weather.url"),
		WEATHER_KEY("weather.key"), WEATHER_VALUE("weather.value"), DB_LANG("db.lang"),;
		String name;

		Key(String name) {
			this.name = name;
		}
	}

	public static String getConfig(Key key) {
		return connectToProperties(key, rootPath + "config.properties");
	}

	public static String getConfigDB(Key key) {
		String pathToConfig = null;
		switch (getConfig(Key.DB_TYPE)) {
		case "local":
			pathToConfig = rootPath + "config.properties";
			break;
		case "webhosting":
			pathToConfig = rootPathWebDB + "/mydb.cfg";
			break;
		}
		return connectToProperties(key, pathToConfig);
	}

	private static String connectToProperties(Key key, String pathToConfig) {
		try (FileInputStream file = new FileInputStream(pathToConfig)) {
			properties = new Properties();
			properties.load(file);
		} catch (Exception e) {
			log.error(e);
			e.printStackTrace();
		}
		if (properties.get(key.name) != null) {
			return properties.get(key.name).toString();
		} else {
			return null;
		}
	}

}
