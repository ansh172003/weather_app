import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherForecastListView extends StatelessWidget {
  final dynamic data;
  const WeatherForecastListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          final hourlyForecast = data['list'][index + 2];
          final hourlySkyForecast =
              data['list'][index + 2]['weather'][0]['main'];
          final time = DateTime.parse(hourlyForecast['dt_txt']);
          return WeatherForecastHourlyCard(
            time: DateFormat.j().format(time),
            icon: hourlySkyForecast == 'Clouds' || hourlySkyForecast == 'Rain'
                ? Icons.cloud
                : Icons.sunny,
            temp: (hourlyForecast['main']['temp'] - 273).toStringAsFixed(0),
          );
        },
      ),
    );
  }
}

class WeatherForecastView extends StatelessWidget {
  final dynamic data;
  const WeatherForecastView({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final hourlyForecast = data['list'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int index = 0; index < 7; index++)
            WeatherForecastHourlyCard(
                time: hourlyForecast[index + 1]['dt'].toString(),
                icon: hourlyForecast[index + 1]['weather'][0]['main'] ==
                            'Clouds' ||
                        hourlyForecast[index + 1]['weather'][0]['main'] ==
                            'Rain'
                    ? Icons.cloud
                    : Icons.sunny,
                temp: (hourlyForecast[index + 1]['main']['temp'] - 273)
                    .toStringAsFixed(0))
        ],
      ),
    );
  }
}

class WeatherForecastHourlyCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const WeatherForecastHourlyCard(
      {super.key, required this.time, required this.icon, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              time,
              maxLines: 1,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$temp°C',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ]),
        ),
      ),
    );
  }
}

class WeatherForecastTitle extends StatelessWidget {
  const WeatherForecastTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Weather Forecast',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
