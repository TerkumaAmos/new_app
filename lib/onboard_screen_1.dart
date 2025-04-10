import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Color(0xFF7047EB),
      body:SafeArea(
        child: Column(
          children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 43,
                width:159,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color:  Color(0xFF7750EC),

                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.location_on,color: Colors.white,),
                  Text('Lagos, Nigeria',
                    style: TextStyle(
                      color: Colors.white,),),
                  ],

                ),
              ),
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 43,
              width: 44,
              decoration: BoxDecoration(
                color: Color(0xFF7750EC),

                borderRadius: BorderRadius.circular(10),
              ),
              child:const  Icon(Icons.notifications,color: Colors.white,),
            ),

            ],
          ),
            SizedBox(height: 90),
            Container(

              height: 348,
              width: 321,
              decoration: BoxDecoration(
                  color: Color(0xFF7750EC),

                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Column(
                children: [
                  Row(

                    children: [
                    Padding(
                      padding: EdgeInsets.only(left: 70.0,top: 10),
                      child: Image(image: AssetImage("assets/vector (3).png",),width: 90,height: 50,),
                    ),
                      SizedBox(width: 10,),
                      Column(

                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text("Today",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.bold),),
                          ),
                          Text("Mon,26 Apr",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ],

                      ),
                    ],
                  ),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        '28',
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
                    children: [

                    ],
                  )
                ],
             

                
              ),

            ),
          SizedBox(height: 170),

          Container(
            height: 60,
            width: 323,
            decoration:BoxDecoration(
                color:  Color(0xFF8862FC),
              borderRadius: BorderRadius.circular(10),
              ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Forecast report',style: TextStyle(
                    color: Colors.white,fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(width: 30,),
                Icon(Icons.arrow_drop_up,color: Colors.white,)
              ],
            ),
          ),
          ],

        ),
      ),
    );
  }
}
