import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/components/my_info.dart';

class MainScreenSkeleton extends StatelessWidget {
  const MainScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        const ApplicationSwitcherDescription(
            label: "Weather | Loading", primaryColor: 0));
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopSearchBarEmpty(),
          SizedBox(height: 20),
          WeatherMainCardEmpty(),
          SizedBox(height: 20),
          WeatherForecastTitleEmpty(),
          SizedBox(height: 6),
          WeatherForecastListViewEmpty(),
          SizedBox(height: 20),
          AddInfoTitleEmpty(),
          SizedBox(height: 8),
          AddInfoViewEmpty(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          SizedBox(height: 10),
          MyInfo(),
        ],
      ),
    );
  }
}

class TopSearchBarEmpty extends StatelessWidget {
  const TopSearchBarEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 20, spreadRadius: 0.0)]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            hintText: 'Search City',
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: const _SearchPrefixIconEmpty(),
            suffixIcon: const _FilterSuffixIconEmpty(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}

class _SearchPrefixIconEmpty extends StatelessWidget {
  const _SearchPrefixIconEmpty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset('assets/icons/Search.svg'),
    );
  }
}

class _FilterSuffixIconEmpty extends StatelessWidget {
  const _FilterSuffixIconEmpty();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            VerticalDivider(
              // color: Color(0xffDDDADA),
              color: Colors.black,
              indent: 10,
              endIndent: 10,
              thickness: 0.1,
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              // child: SvgPicture.asset('assets/icons/Filter.svg'),
              child: Icon(Icons.arrow_circle_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherMainCardEmpty extends StatelessWidget {
  const WeatherMainCardEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: [
                  Text(
                    "",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.autorenew,
                    size: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherForecastTitleEmpty extends StatelessWidget {
  const WeatherForecastTitleEmpty({
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

class WeatherForecastListViewEmpty extends StatelessWidget {
  const WeatherForecastListViewEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int index = 0; index < 7; index++)
            const WeatherForecastHourlyCardEmpty()
        ],
      ),
    );
  }
}

class WeatherForecastHourlyCardEmpty extends StatelessWidget {
  const WeatherForecastHourlyCardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        height: 131,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "",
              maxLines: 1,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.autorenew,
              size: 32,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ]),
        ),
      ),
    );
  }
}

class AddInfoTitleEmpty extends StatelessWidget {
  const AddInfoTitleEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Additional Information',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class AddInfoViewEmpty extends StatelessWidget {
  const AddInfoViewEmpty({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AddInfoItemCardEmpty(icon: Icons.water_drop, label: 'Humidity'),
          AddInfoItemCardEmpty(icon: Icons.air, label: 'Wind Speed'),
          AddInfoItemCardEmpty(
            icon: Icons.beach_access,
            label: 'Pressure',
          ),
        ]);
  }
}

class AddInfoItemCardEmpty extends StatelessWidget {
  final IconData icon;
  final String label;
  const AddInfoItemCardEmpty({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        const Icon(
          Icons.autorenew,
          size: 16,
        )
      ],
    );
  }
}
