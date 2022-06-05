import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'Temperature.dart';
import 'TemperatureWidget.dart';

class TemperatureState extends State<TemperatureWidget> {
  List<Temperature> temperatureList = [];
  late Future<List<Temperature>> futureTemp;

  @override
  void initState(){
    super.initState();
    futureTemp = fetchTemperature();
  }

  Future<List<Temperature>> fetchTemperature() async {
    try {
      final client = http.Client();
      final response = await client.get(
          Uri.parse('https://weblang.dev/citytemp.json')).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        List<Temperature> list = (json.decode(response.body) as List).map((i) =>
            Temperature.fromJson(i)).toList();
        return list;
      }
      else {
        throw Exception('Cannot load temperature!');
      }
    } catch (e) {
      return Future.error('Cannot load temperature!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Temperature>>(
        future: futureTemp,
        builder: (context, snapshot){
          if (snapshot.hasData) {
            temperatureList = snapshot.data!;
            return ListView.builder(
                itemCount: temperatureList.length,
                itemBuilder: (context, i){
                  return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  print(context);
                                },
                                child: const Text("Test"),
                              style: TextButton.styleFrom(primary: const Color.fromARGB(255, 255,255,255), backgroundColor: Colors.black38)
                            ),
                            Text(temperatureList[i].city),
                            Text('${temperatureList[i].temperature} °${temperatureList[i].scale}')
                          ]
                      ));
                }
            );
          }
          else if (snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const Center( child: CircularProgressIndicator());
        }
    );
  }
}