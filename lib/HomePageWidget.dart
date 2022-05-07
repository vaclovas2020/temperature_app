import 'package:flutter/material.dart';
import 'package:temperature_app/NavigationDrawer.dart';

import 'TemperatureWidget.dart';

class HomePageWidget extends StatelessWidget{
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: const Text('Temperature App')
      ),
      body: const TemperatureWidget(),
    drawer: const NavigationDrawer(),
  );

}