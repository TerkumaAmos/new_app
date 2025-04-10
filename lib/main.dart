import 'package:flutter/material.dart';
import 'package:weather_app/onboard_screen_1.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const OnboardScreen1(),
    );
  }
}
