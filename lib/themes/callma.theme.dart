import 'package:flutter/material.dart';

const Color PRIMARY_GREEN = Color(0xff2fe0c3);
const Color SECONDARY_GREEN = Color(0xff1dbfa5);
const Color TERTIARY_GREEN = Color(0xff09d6b4);
const Color PRIMARY_GREY = Color(0xff5a6268);
const Color SECONDARY_GREY = Color(0xffdddddd);
const Color TERTIARY_GREY = Color(0xfff4f4f4);
const Color PRIMARY_RED = Color(0xffff4136);
const Color PRIMARY_BLUE = Color(0xff006699);
const Color SECONDARY_BLUE = Color(0xff1B88C8);
const Color TERTIARY_BLUE = Color(0xff6699CC);

ThemeData defaultTheme() {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: SECONDARY_GREEN))));
}
