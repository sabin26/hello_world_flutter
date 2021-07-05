import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/core/utils/constants.dart';

class BottomBar extends StatelessWidget {
  final Map<String, IconData> icons;
  final int currentIndex;
  final void Function(int)? onTap;

  const BottomBar({
    required this.icons,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white54),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kBackgroundColor,
        onTap: onTap,
        items: icons
            .map(
              (String title, IconData icon) => MapEntry(
                title.tr,
                BottomNavigationBarItem(
                  icon: FaIcon(icon, size: 30.0.sp),
                  label: title.tr,
                ),
              ),
            )
            .values
            .toList(),
        currentIndex: currentIndex,
        selectedIconTheme: const IconThemeData().copyWith(color: kAccentColor),
        unselectedIconTheme: Theme.of(context).iconTheme,
      ),
    );
  }
}
