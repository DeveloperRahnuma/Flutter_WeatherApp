import 'dart:convert';

import 'package:http/http.dart';
import '../model/WeatherForcastModel.dart';
import '../utill/Util.dart';

class Network{
  Future<WeatherForcastModel> getWeatherForcast(String cityname) async{
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=${cityname}&appid=${Util.appId}";
    final responce = await get(Uri.parse(finalUrl));
    if(responce.statusCode == 200){
      return WeatherForcastModel.fromJson(json.decode(responce.body));
    }else{
      throw Exception("Error while fetching weather details of ${cityname}");
    }
  }
}