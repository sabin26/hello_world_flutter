import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello_world/app/core/lang/application_text.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ApplicationText.HOME.tr,
        style: TextStyle(fontSize: 16.0.sp),
      ),
    );
  }
}
