import 'package:flutter/material.dart';

Widget _bottomSheet(BuildContext context,VoidCallback onTap, Widget image){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 312,
      height: 40,
      margin: EdgeInsets.only(left: 10.0,right: 10),
      padding: const EdgeInsets.only(right: 10.0, left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30.0),
      ),
    ),
  );
}