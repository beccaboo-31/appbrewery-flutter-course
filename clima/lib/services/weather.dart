import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'a48fcd6eb80b9bfbdcd50517731896bf';
// const weatherURL ='http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper network = new NetworkHelper('http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var cityWeather = await network.getData();
    return cityWeather;
  }
  
  Future<dynamic> getLocationWeather() async {
    Location loc = new Location();
    await loc.getCurrentLocation();

    NetworkHelper network = new NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    
    var locationWeather = await network.getData();
    return locationWeather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
