import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
          latitude=position.latitude;
          longitude=position.longitude;
          // print(latitude);
          // print(longitude);
    } catch (e) {
      print(e);
    }
  }
}
