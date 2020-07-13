import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'a48fcd6eb80b9bfbdcd50517731896bf';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location loc = new Location();
    await loc.getCurrentLocation();

    NetworkHelper network = new NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await network.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100,
    ));
  }
}
