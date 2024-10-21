import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class UiConfig {
  static const Color primaryColor = Color(0xffb67352);
  static const Color primaryColorSurface = Color(0xffECB159);
  static const Color buttonColor = Color(0xffFFDC7C);
  static const Color secondaryColor = Color.fromRGBO(114, 186, 192, 1);
  static const Color secondaryTextColor = Color.fromARGB(255, 67, 190, 201);
  static const Color backgroundColor = Color(0xFFFEFBF6);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greyColor = Colors.black26;

  static const MaterialColor black = MaterialColor(0xff282828, color);
  static const Map<int, Color> color = {
    100: Color(0xffFFFFFF),
    200: Color(0xffe2e8f0),
    500: Color(0xffF5F5F5),
    600: Color(0xffE9E9E9),
    700: Color(0xff828282),
    800: Color(0xff424242),
    900: Color(0xff282828),
  };

  static TextStyle largeStyle = TextStyle(fontSize: 32.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle h1Style = TextStyle(fontSize: 24.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle h2Style = TextStyle(fontSize: 20.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle h3Style = TextStyle(fontSize: 18.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle h4Style = TextStyle(fontSize: 16.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle bodyStyle = TextStyle(fontSize: 14.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle smallStyle = TextStyle(fontSize: 12.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle extraSmallStyle = TextStyle(fontSize: 10.sp, letterSpacing: -0.3, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Inter');
  static TextStyle numberStyle = TextStyle(fontSize: 20.sp, letterSpacing: 0.5, fontWeight: FontWeight.w400, color: const Color(0xFF282828), fontFamily: 'Digital');

  static const FontWeight regularFont = FontWeight.w400;
  static const FontWeight semiBoldFont = FontWeight.w600;
}
