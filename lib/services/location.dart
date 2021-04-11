import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double longi;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      lat = position.latitude;
      longi = position.longitude;

      //print(position);
    } catch (e) {
      print(e);
    }
  }
}
