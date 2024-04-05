import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherMainCard extends StatelessWidget {
  const WeatherMainCard({
    super.key,
    required this.temp,
    required this.sky,
    
  });
  final String temp;
  final String sky;
  
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
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: [
                  Text(
                    "$temp°C",
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Icon(
                    sky == 'Clouds' || sky == 'Rain'
                        ? Icons.cloud
                        : Icons.sunny,
                    size: 70,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    sky,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w300),
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
