import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/core/lang/application_text.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        ApplicationText.PROFILE.tr,
        style: TextStyle(fontSize: 16.0.sp),
      ),
    );
  }
}
