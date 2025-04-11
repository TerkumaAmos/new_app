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




// showModalBottomSheet(
// isScrollControlled: true,
// context: context,
// builder: (context) {
// return SingleChildScrollView(
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// SvgPicture.asset("assets/Vector 9.svg"),
// SizedBox(
// height: 10,
// ),
// Row(
// // mainAxisAlignment: MainAxisAlignment.center,
//
// children: [
// Container(
// margin: EdgeInsets.only(left: 120),
// decoration: BoxDecoration(
// color: Color(0xFF7047EB),
// borderRadius: BorderRadius.circular(20,),),
// height: 43,
// width: 152,
// child: const Row(
// children: [
// Padding(
// padding: EdgeInsets.only(left: 28.0),
// child: Text("Forecast report"),
// ),
// Icon(Icons.arrow_drop_down)
// ],
// ),
// ),
// ],
//),