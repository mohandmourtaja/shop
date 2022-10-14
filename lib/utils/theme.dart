import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xff121212);
const Color pinkClr = Color(0xffff4667);
const Color kColor1 = Color(0xff685959);
const Color kColor2 = Color(0xffada79b);
const Color kColor3 = Color(0xffa5947f);
const Color kColor4 = Color(0xff738b71);
const Color kColor5 = Color(0xff6d454d);
const Color darkSettings = Color(0xff6132e4);
const Color accountSetting = Color(0xff73bc65);
const Color logOutSetting = Color(0xff5f95ef);
const Color notiSrtting = Color(0xffdf5862);
const Color languageSetting = Color(0xffCB256C);

class ThemesData {
  static final light = ThemeData(
      primaryColor: mainColor,
      backgroundColor: Colors.white,
      brightness: Brightness.light);

  static final dark = ThemeData(
      primaryColor: darkGreyClr,
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark);
}
