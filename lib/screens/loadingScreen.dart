import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:climate/screens/locationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel model = WeatherModel();
    var weatherData = await model.getWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: CupertinoColors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
