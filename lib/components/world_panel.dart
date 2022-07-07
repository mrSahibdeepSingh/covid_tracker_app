import 'package:flutter/material.dart';

import 'status_panel.dart';

class WorldWidePanel extends StatelessWidget {
  const WorldWidePanel({Key? key, required this.worldDate}) : super(key: key);

  final Map<dynamic, dynamic> worldDate;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      children: [
        StatusPanel(
          title: 'NEW CONFIRMED',
          count: worldDate['New Cases_text'].toString(),
          panelColor: Colors.red[100]!,
          textColor: Colors.red,
        ),
        StatusPanel(
          title: 'ACTIVE',
          count: worldDate['Active Cases_text'].toString(),
          panelColor: Colors.blue[100]!,
          textColor: Colors.blue[900]!,
        ),
        StatusPanel(
          title: 'RECOVERED',
          count: worldDate['Total Recovered_text'].toString(),
          panelColor: Colors.green[100]!,
          textColor: Colors.green,
        ),
        StatusPanel(
          title: 'DEATHS',
          count: worldDate['Total Deaths_text'].toString(),
          panelColor: Colors.grey[400]!,
          textColor: Colors.grey[900]!,
        ),
      ],
    );
  }
}
