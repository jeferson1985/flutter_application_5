import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    theme: ThemeData(
      primaryColor: Colors.blue, // Define a cor primária do aplicativo
      scaffoldBackgroundColor: Color.fromARGB(255, 78, 151, 210), // Define a cor de destaque do aplicativo
      fontFamily: 'Roboto', // Define a família de fontes do aplicativo
    ),
  ));
}