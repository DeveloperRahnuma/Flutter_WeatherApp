import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/model/WeatherForcastModel.dart';
import 'package:flutter_weatherapp/ui/BottomView.dart';
import 'package:flutter_weatherapp/ui/MidView.dart';
import 'SearchBox.dart';


Widget getScaffoldBody(Function(String cityname) citySubmitted, Future<WeatherForcastModel> forcastObject){
  return SingleChildScrollView(
    child: Column(
      children: [
        getSearchBox((cityname) => citySubmitted(cityname)),
        Container(
          child: FutureBuilder<WeatherForcastModel>(
            future: forcastObject,
            builder: (BuildContext context, AsyncSnapshot<WeatherForcastModel> snapshot){
              if(snapshot.hasData){
                return Column(
                  children: [
                    MidView(snapshot: snapshot),
                    BottomView(snapshot: snapshot)
                  ],
                );
              }else{
                return Container(
                  child: const Center(
                    child:  CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        )
      ],
    ),
  );
}
