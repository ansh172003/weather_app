import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/components/main_elements.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/components/main_screen_skeleton.dart';
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController textEditingController = TextEditingController();
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather(String cityName) async {
    try {
      // String cityName = 'Delhi, IN';
      final res = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPI"));
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'Unexpected error, click the above refresh button to go back';
      }

      return data;
      // temp = ((data['list'][0]['main']['temp'] - 273.15).toStringAsFixed(2));
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather("Delhi,IN");
    textEditingController.text = "Delhi,IN";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topAppBar(),
        body: FutureBuilder(
            future: weather,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: MainScreenSkeleton());
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              final data = snapshot.data!;
              final currWeather = data['list'][0];
              final currTemp =
                  (currWeather['main']['temp'] - 273.15).toStringAsFixed(0);
              final currSky = currWeather['weather'][0]['main'];
              final currPressure = currWeather['main']['pressure'].toString();
              final currHumidity = currWeather['main']['humidity'].toString();
              final currWindSpeed =
                  currWeather['wind']['speed'].toStringAsFixed(0);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: BodyElement(
                  onTap: () {
                    setState(() {
                      weather = getCurrentWeather(textEditingController.text);
                    });
                  },
                  textEditingController: textEditingController,
                  temp: currTemp,
                  sky: currSky,
                  windSpeed: currWindSpeed,
                  humidity: currHumidity,
                  pressure: currPressure,
                  data: data,
                ),
              );
            }));
  }

  AppBar topAppBar() {
    return AppBar(
      title: const Text(
        "Weather App",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              weather = getCurrentWeather("Delhi,IN");
              textEditingController.text = "Delhi,IN";
            });
          },
          icon: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
