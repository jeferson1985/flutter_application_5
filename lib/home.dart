import 'package:flutter/material.dart';
import 'dart:convert';
import 'api.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Color.fromARGB(255, 3, 46, 82),
        title: const Center(
          child: Text('Clima Tempo'),
          
          )
      ),
         body: FutureBuilder(
        future: getAPI(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            var data = snapshot.data;
            var weatherList = data['weather'];
            var mainData = data['main'];
            var name = data['name'];

            return ListView.builder(
              itemCount: weatherList.length,
              itemBuilder: (context, index) {
                var weatherData = weatherList[index];
                return ListTile(
                  title: Center(
                    child: Text('Clima: ${weatherData["description"]}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, // Define a espessura da fonte
                        fontSize: 20.0,
                        color: Colors.purple
                         // Define o tamanho da fonte
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temp: ${mainData["temp"]}'),
                      Text('Temp Min: ${mainData["temp_min"]}'),
                      Text('Temp Max: ${mainData["temp_max"]}'),
                      Text('Humidity: ${mainData["humidity"]}'),
                      Text('Name: $name'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
  }
