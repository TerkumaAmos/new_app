import 'package:flutter/material.dart';

import 'onboard_screen_1.dart';


class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF7047EB),
         body: Column(
           children: [
             SizedBox(height: 20),
             SafeArea(child:Row(
               children: [
                 Image(image: AssetImage('assets/Group 130.png',),),
                 Container(
                   height: 43,
                   width: 159,
                   decoration: BoxDecoration(
                     color: Color(0xFF7750EC),
                            borderRadius: BorderRadius.circular(20),
                     
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       GestureDetector(
                         onTap: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(
                           builder: (context) => const OnboardScreen1()),);
                 },
                           child: Icon(Icons.location_on,color: Colors.white,)),
                       Text('Abuja, Nigeria',style: TextStyle(color: Colors.white),),
                     ],

                   ),
                 ),
                 SizedBox(height: 150),

               ],
             ),
             ),
             Container(
               height: 348,
               width: 321,
               decoration: BoxDecoration(
                 color: Color(0xFF7750EC),
                 borderRadius: BorderRadius.circular(10,),),
               child: const Column(
                 children: [
                   Row(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(left: 70.0, top: 10),
                         child: Image(
                           image: AssetImage(
                             "assets/Vector (3).png",
                           ),

                         ),
                       ),
                       SizedBox(
                         width: 10,
                       ),
                       Column(
                         children: [
                           Padding(
                             padding: EdgeInsets.only(right: 20.0),
                             child: Text(
                               "Today",
                               style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold),
                             ),
                           ),
                           Text(
                             "Mon,26 Apr",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold),
                           ),
                         ],
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         '20',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 140,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: EdgeInsets.only(bottom: 90.0),
                         child: Text(
                           '°C',
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: 19, // Smaller font size
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ],
                   ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lagos, Nigeria. 2:00 p.m',style: TextStyle(fontSize: 16,color: Colors.white),)
        ],
      ),
                 ],
               ),
             ),
           ],
         ),
    );
  }
}
