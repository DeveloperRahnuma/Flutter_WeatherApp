import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/network/Network.dart';
import 'package:flutter_weatherapp/ui/ScaffoldBody.dart';

import 'model/WeatherForcastModel.dart';

class WeatherForcast extends StatefulWidget {
  const WeatherForcast({Key? key}) : super(key: key);

  @override
  State<WeatherForcast> createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {

  late Future<WeatherForcastModel> forcastObject;
  String cityName = "mumbai";

  @override
  void initState() {
    super.initState();
    forcastObject = getWeather(cityName: cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Information of $cityName"),
      ),
      body: getScaffoldBody((cityname) {
        setState(() {
          cityName = cityname;
          forcastObject = getWeather(cityName: cityname);
        });
      },forcastObject),
    );
  }

  Future<WeatherForcastModel> getWeather({required String cityName}) => Network().getWeatherForcast(cityName);

}
