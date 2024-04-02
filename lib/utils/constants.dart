import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFFFffff);
const Color blackColor = Color(0xff0B2C3D);
const Color borderColor = Color(0xFFB0D8FF);
const Color greenColor = Color(0xFF34A853);
final Color grayColor = const Color(0xff0B2C3D).withOpacity(.3);
// const Color redColor = Color(0xffFF5200);
const Color redColor = Color(0xFF34A853);
const Color redOrangeColor = Color(0xFFFF5200);
const Color homeBackground = Color(0xFFF1F8E9);

// const Color redColor = Color(0xffFFBB38);
const Color iconGreyColor = Color(0xff85959E);
const Color iconGreyColorBottomTab = Color.fromARGB(255, 142, 147, 150);
const Color paragraphColor = Color(0xff18587A);
const Color bgGreyColor = Color(0xffE8EEF2);
const greenGradient = [redColor, redColor];

// #duration
const kDuration = Duration(milliseconds: 300);

final _borderRadius = BorderRadius.circular(4);

var inputDecorationTheme = InputDecoration(
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  hintStyle: const TextStyle(fontSize: 18, height: 1.667),
  border: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: Colors.white),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: Colors.white),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: _borderRadius,
    borderSide: const BorderSide(color: Colors.white),
  ),
  fillColor: primaryColor,
  filled: true,
  focusColor: primaryColor,
);

final gredientColors = [
  [const Color(0xff0db935), const Color(0xffC70F16)],
  [const Color(0xff019BFE), const Color(0xff0077C1)],
  [const Color(0xff161632), const Color(0xff3D364E)],
  [const Color(0xff0db935), const Color(0xffC70F16)],
  [const Color(0xff019BFE), const Color(0xff0077C1)],
  [const Color(0xff161632), const Color(0xff3D364E)],
];
