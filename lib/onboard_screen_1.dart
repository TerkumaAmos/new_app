// ignore_for_file: unused_element

import 'dart:developer';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';

import 'onboard_screen_3.dart';

class OnboardScreen1 extends StatefulWidget {
  const OnboardScreen1({super.key});

  @override
  State<OnboardScreen1> createState() => _OnboardScreen1State();
}

class _OnboardScreen1State extends State<OnboardScreen1> {
  void getLocation() async {
    Future getCurrentLocation() async {
      bool serviceEnabled;
      LocationPermission permission;

// Check if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
// Open location settings if services are disabled.
        await Geolocator.openLocationSettings();
        return Future.error('Location services are disabled.');
      }

// Check current location permissions.
      permission = await Geolocator.checkPermission();

// If permissions are already granted, proceed to fetch location.
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        final location = await Geolocator.getCurrentPosition();

        log("Location($location)");
      }

// If permissions are denied, request them.
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
// Permissions are denied, open settings and return an error.
          await Geolocator.openLocationSettings();
          return Future.error('Location permissions are denied.');
        }
      }

// If permissions are permanently denied, return an error.
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
          'Location permissions are permanently denied. Please enable them in the app settings.',
        );
      }

// When we reach here, permissions are granted, and we can fetch the location.
    }

    Position position = await Geolocator.getCurrentPosition();
    log("position($position)");
    fetchWeatherData(lat: position.latitude, long: position.longitude);
  }

  fetchWeatherData({lat, long}) async {
    // https:api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final response = await get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${long}&appid=a1f9fbb35063e8d2a9a3e552ef80269b',
      ),
    );
    log('response($response)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7047EB),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 43,
                  width: 159,
                  margin: EdgeInsets.only(left: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xff77750ec,
                      ),
                    ),
                    onPressed: () {
                      getLocation();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(
                          'Lagos, Nigeria',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF7750EC,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(

                        // isScrollControlled: true,

                        context: context,
                        builder: (context) {
                          return Container(
                            width: double.infinity, // Full width
                            // padding: const EdgeInsets.all( 16.0), // Consistent padding
                            decoration: const BoxDecoration(
                              color: Colors.white, // Matches app theme
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 10),
                                  SvgPicture.asset("assets/Vector 9.svg"),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 43,
                                    width: 152,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xFF7047EB),
                                    ),
                                    child: const Center(
                                      child: Text('Your Notifications'),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      'New',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 60),
                                        alignment: Alignment.bottomLeft,
                                        child: const Text(
                                          '10 minutes ago',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: const Image(
                                            image: AssetImage(
                                              'assets/wb_sunny.png',
                                            ),
                                          )),
                                      SizedBox(width: 20),
                                      const Text(
                                        'Its a sunny day in your location',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('Earlier'),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 60),
                                        alignment: Alignment.bottomLeft,
                                        child: const Text(
                                          '1 Day ago',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          child: const Image(
                                            image: AssetImage(
                                              'assets/wb_sunny.png',
                                            ),
                                          )),
                                      SizedBox(width: 20),
                                      const Text(
                                        'Its a sunny day in your location',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 60),
                                        alignment: Alignment.bottomLeft,
                                        child: const Text(
                                          '2 Days ago',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(),
                                          child: const Image(
                                            image: AssetImage(
                                              'assets/wb_sunny.png',
                                            ),
                                          )),
                                      SizedBox(width: 20),
                                      const Text(
                                        'Its a sunny day in your location',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            Container(
              height: 348,
              width: 321,
              decoration: BoxDecoration(
                color: Color(0xFF7750EC),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lagos, Nigeria. 2:00 p.m',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 170),
            Container(
              height: 60,
              width: 323,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    Color(
                      0xFF8862FC,
                    ),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            SvgPicture.asset("assets/Vector 9.svg"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 120),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF7047EB),
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  height: 43,
                                  width: 152,
                                  child: const Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 28.0),
                                        child: Text("Forecast report"),
                                      ),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 40),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFD5C7FF),
                                  width: 2,
                                ),
                              ),
                              height: 106,
                              width: 325,
                              child: const Image(
                                image: AssetImage(
                                  'assets/Group 91.png',
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 40),
                                    child: Text(
                                      'Next forecast',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(width: 100),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFF8862FC)),
                                  height: 36,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Five Days',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 246,
                                width: 314,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFFD5C7FF),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image(
                                  image: AssetImage('assets/Frame 91.png'),
                                )),
                            SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forecast report',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_drop_up,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
