package tradefx.server;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;

/*
public class BankendSessionServiceImpl {

}*/

public class BankendSessionServiceImpl extends RemoteServiceServlet /*implements WeatherService*/ {

	public static final String partnerID = "";
	public static final String licenseKey = "";
	public static final String ALL_SUCCESSFUL_WEATHER_QUERIES_SO_FAR = "WeatherQueryHistory";

	/**
	 * Returns all the successful weather queries so far
	 * @return  HashMap of successful weather queries so far
	 */
	/*
	public HashMap getAllSuccessfulWeatherQueriesSoFar() {
	       return Utils.getHashMapFromSession(ALL_SUCCESSFUL_WEATHER_QUERIES_SO_FAR, getSession());
	}

	public CurrentWeatherConditions getCurrentWeather(String zipCode) {

		WeatherConfigurationIF config = 
	       	new DefaultWeatherConfigurationBean(DefaultWeatherConfigurationBean.defaultWeatherServer,partnerID, licenseKey);
	       
		weather_service.weatherprovider.WeatherGateway gateway = new WeatherGateway(config);
	       	
		WeatherReport weatherreport = null;
		CurrentWeatherConditions currentweather = null;

		try {
			weatherreport = gateway.getFullForecast(zipCode, 1);

			if (weatherreport == null) {
				System.out.printf("locationID [%s] is not valid or no xml data returned, weather is null\n\n", zipCode);

			}	else {

				System.out.printf(":::: WeatherReport ::::\n%s\n::::\n", weatherreport);
				currentweather = Utils.getCurrentWeatherFromReport(weatherreport);
				Utils.addSuccessfulQueryToSession(ALL_SUCCESSFUL_WEATHER_QUERIES_SO_FAR,
	                                             getSession(), zipCode, currentweather.getLocation());
			}
		} catch (IOException e) {
			System.out.printf("---- Network connection problem or invalid server address, %s ----\n", e);
	       		/ *
	      	} catch (WeatherError weatherError) {
	    	   System.out.printf("---- Exception reported from parsing weather/response, %s ----\n", weatherError);* /
		}
		return currentweather;
	}*/

	private HttpSession getSession() {
	    // Get the current request and then return its session
		return this.getThreadLocalRequest().getSession();
	}
	

	public static HashMap getHashMapFromSession(String key, HttpSession session) {

		if (session.getAttribute(key) == null) {
			session.setAttribute(key, new HashMap());
		}

		return (HashMap) session.getAttribute(key);
	}

	public static void addSuccessfulQueryToSession(String key, HttpSession session, String zipCode, String location) {
		//HashMap mapOfResults = Utils.getHashMapFromSession(key, session);
		//mapOfResults.put(location, zipCode);
	}	
}