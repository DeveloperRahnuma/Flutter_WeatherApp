import 'package:flutter/material.dart';

Widget getSearchBox(Function(String cityname) onCitySubmitted){

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Enter City Name",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.all(8),
      ),
      onSubmitted: (value){
        onCitySubmitted(value);
      },
    ),
  );
}