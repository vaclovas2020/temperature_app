import 'package:flutter/material.dart';
import 'package:temperature_app/HomePageWidget.dart';

import 'TemperatureWidget.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green
        ),
        home: const HomePageWidget()
    );
  }
}
