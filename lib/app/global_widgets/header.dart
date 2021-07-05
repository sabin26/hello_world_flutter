import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/core/lang/application_text.dart';
import 'package:hello_world/app/core/utils/constants.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white54),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Container(
          margin: EdgeInsets.only(top: 3.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: kAppLogoAsset,
                createRectTween: (rect1, rect2) => RectTween(
                  begin: rect1,
                  end: rect2,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 12.0.w),
                  width: kToolbarHeight.h / 1.85,
                  height: kToolbarHeight.h / 1.85,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(kAppLogoAsset),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    ApplicationText.APPLICATION_NAME.tr,
                    style: TextStyle(fontSize: 16.0.sp),
                  ),
                ),
              ),
              !kIsWeb && GetPlatform.isDesktop
                  ? Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: Wrap(
                        spacing: 6.0.w,
                        children: <Widget>[
                          MinimizeWindowButton(colors: buttonColors),
                          CloseWindowButton(colors: closeButtonColors),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        elevation: 0.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
