import 'package:flutter/material.dart';
import 'package:temperature_app/AboutPageWidget.dart';

import 'HomePageWidget.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context)
          ],
        ),
      ),
    );

  Widget buildHeader(BuildContext context) => Container(
    color: Colors.green.shade700,
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top + 24,
    ),
      child: Column(
        children: const [
          Text('Temperature App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
   padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: (){
            Navigator.pop(context); // close drawer before
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePageWidget()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.announcement_outlined),
          title: const Text('About'),
          onTap: (){
            Navigator.pop(context); // close drawer before
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutPageWidget()));
          }
        ),
      ],
    ),
  );

}