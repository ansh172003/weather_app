import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/components/additional_info.dart';
import 'package:weather_app/components/main_card.dart';
import 'package:weather_app/components/my_info.dart';
import 'package:weather_app/components/search_bar.dart';
import 'package:weather_app/components/weather_forecast.dart';

class BodyElement extends StatelessWidget {
  final GestureTapCallback onTap;
  final TextEditingController textEditingController;
  const BodyElement({
    super.key,
    required this.temp,
    required this.sky,
    required this.textEditingController,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.data,
    required this.onTap,
  });
  final String temp;
  final String sky;
  final String pressure;
  final String humidity;
  final String windSpeed;
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
            label: "Weather | ${textEditingController.text}", primaryColor: 0));
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSearchBar(onTap: onTap, textEditing: textEditingController),
          const SizedBox(height: 20),
          WeatherMainCard(
            temp: temp,
            sky: sky,
          ),
          const SizedBox(height: 20),
          const WeatherForecastTitle(),
          const SizedBox(height: 6),
          WeatherForecastListView(data: data),
          const SizedBox(height: 20),
          const AddInfoTitle(),
          const SizedBox(height: 8),
          AddInfoView(
              pressure: pressure, humidity: humidity, windSpeed: windSpeed),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          const SizedBox(height: 10),
          const MyInfo(),
        ],
      ),
    );
  }
}
