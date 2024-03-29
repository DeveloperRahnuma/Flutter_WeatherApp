import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/model/WeatherForcastModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utill/Util.dart';
import '../utill/convert_icon.dart';

Widget forecastCard(AsyncSnapshot<WeatherForcastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            // If it doesn't show (Font awesome icons are not showing)

            /*
                Please try:

                  Stopping the app
                  Running flutter clean in your app directory
                  Deleting the app from your simulator / emulator / device
                  Rebuild & Deploy the app.

                 */
            //source: https://github.com/brianegan/font_awesome_flutter/issues/28#issuecomment-460109786
            child: getWeatherIcon(
                weatherDescription: forecastList![index].weather![0].main.toString(),
                color: Colors.pinkAccent,
                size: 45),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].main?.tempMin?.toStringAsFixed(0)} °F"),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].main?.tempMax?.toStringAsFixed(0)} °F"),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.white,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Hum:${forecastList[index].main?.humidity?.toStringAsFixed(0)} %"),
//                     Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
//                       size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Win:${forecastList[index].wind?.speed?.toStringAsFixed(1)} mi/h"),
//                     Icon(FontAwesomeIcons.wind, color: Colors.white,
//                       size: 17,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ],
  );
}
