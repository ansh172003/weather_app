import 'package:flutter/material.dart';

class AddInfoTitle extends StatelessWidget {
  const AddInfoTitle({
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

class AddInfoView extends StatelessWidget {
  const AddInfoView(
      {super.key,
      required this.pressure,
      required this.humidity,
      required this.windSpeed});
  final String pressure;
  final String humidity;
  final String windSpeed;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      AddInfoItemCard(
          icon: Icons.water_drop, label: 'Humidity', value: humidity),
      AddInfoItemCard(
          icon: Icons.air, label: 'Wind Speed', value: '$windSpeed km/h'),
      AddInfoItemCard(
          icon: Icons.beach_access, label: 'Pressure', value: pressure),
    ]);
  }
}

class AddInfoItemCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AddInfoItemCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

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
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
