import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/core/utils/constants.dart';
import 'package:hello_world/app/global_widgets/responsive.dart';
import 'package:hello_world/app/routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  final Map<String, IconData> icons;
  final int currentIndex;
  final GetDelegate delegate;

  const SideMenu({
    required this.icons,
    required this.currentIndex,
    required this.delegate,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12.0.r),
          ),
          padding: EdgeInsets.all(6.0.w),
          margin: EdgeInsets.only(top: 12.0.w, left: 12.0.w, bottom: 12.0.w),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                final option = icons.entries.elementAt(index);
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0.w),
                  child: _Option(
                    icon: option.value,
                    label: option.key,
                    onTap: () {
                      if (index != currentIndex) {
                        switch (index) {
                          case 0:
                            delegate.until(Routes.HOME);
                            break;
                          case 1:
                            delegate.toNamed(Routes.PROFILE);
                            break;
                          default:
                        }
                      }
                    },
                    isSelected: index == currentIndex,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onTap;
  final bool isSelected;

  const _Option({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.0.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //color: Colors.red,
              width: 8.w,
              height: 8.w,
              child: FittedBox(
                fit: BoxFit.fill,
                child: FaIcon(
                  icon,
                  color: isSelected ? kAccentColor : kIconColor,
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              SizedBox(
                width: 2.0.w,
              ),
            if (Responsive.isDesktop(context))
              Expanded(
                child: Text(
                  label.tr,
                  style: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
