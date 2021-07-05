import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

const Color kScaffoldBackgroundColor = Color.fromARGB(255, 4, 42, 73);
const Color kBackgroundColor = Color.fromARGB(255, 4, 42, 73);
const Color kPrimaryColor = Color.fromARGB(255, 4, 42, 73);
const Color kAccentColor = Color(0xFF76CF95);
const Color kAppBarBackgroundColor = Color.fromARGB(255, 4, 42, 73);
const Color kIconColor = Colors.white;

double kDesktopMaxWidth = 1000.0;
double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) => Get.size.width * .8;

String kAPI = dotenv.env['API_LINK'] as String;
const String kAppLogoAsset = 'assets/app_logo.png';

final buttonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: Colors.grey,
  mouseDown: Colors.grey,
  iconMouseOver: Colors.white,
  iconMouseDown: Colors.white,
);

final closeButtonColors = WindowButtonColors(
  iconNormal: Colors.white,
  mouseOver: Colors.red,
  mouseDown: Colors.red,
  iconMouseOver: Colors.white,
  iconMouseDown: Colors.white,
);
