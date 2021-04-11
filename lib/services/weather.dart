import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const apiKey = '7c1a82ae33deb95a297a64037f784d6f';
const urlstart = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double latitude;
  double longitude;

  Future<dynamic> getCityWeather(String city) async {
    String cityurl = '$urlstart?q=$city&appid=$apiKey&units=metric';
    Network network = Network(cityurl);

    var data = await network.getData();

    return data;
  }

  Future<dynamic> getWeather() async {
    Location location = Location();
    await location.getLocation();
    latitude = (location.lat);
    longitude = (location.longi);

    Network network = Network(
        '$urlstart?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await network.getData();

    return weatherData;
  }

  String getWeatherIcon(dynamic condition) {
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
