import 'package:flutter/material.dart';
import 'package:temperature_app/NavigationDrawer.dart';

class AboutPageWidget extends StatelessWidget {
  const AboutPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('About App'),
    ),
    drawer: const NavigationDrawer(),
    body: Container(
      padding: const EdgeInsets.all(24),
      child: const Text('This is demo app developed for learning purposes only. '
      'Temperature data is fake and always the same.')
    )
  );
  
}