// import 'package:clima/services/location.dart';
// import 'package:clima/services/networking.dart';

// const apiKey = 'a48fcd6eb80b9bfbdcd50517731896bf';
// const weatherURL ='http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  // Future<dynamic> getLocationWeather() async {
  //   Location loc = new Location();
  //   await loc.getCurrentLocation();

  //   NetworkHelper network = new NetworkHelper(
  //       'http://api.openweathermap.org/data/2.5/weather?=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
  //   var weatherData = await network.getData();
  //   print('Weather.dart file. getLocationWeather method');
  //   print(weatherData);
  //   return weatherData;
  // }

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
