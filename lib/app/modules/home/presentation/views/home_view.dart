import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/core/lang/application_text.dart';
import 'package:hello_world/app/core/utils/globals.dart';
import 'package:hello_world/app/global_widgets/global_widgets.dart';
import '../components/home_screen.dart';
import 'package:hello_world/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final Map<String, IconData> _icons = const <String, IconData>{
    ApplicationText.HOME: FontAwesomeIcons.home,
    ApplicationText.PROFILE: FontAwesomeIcons.userCircle,
  };

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        var _currentIndex = 0;
        final currentLocation = currentRoute?.location;
        if (currentLocation?.startsWith(Routes.PROFILE) == true) {
          _currentIndex = 1;
        }
        return SafeArea(
          child: Scaffold(
            key: Globals.scaffoldKey,
            appBar: Header(),
            body: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      if (!Responsive.isMobile(context))
                        SideMenu(
                          currentIndex: _currentIndex,
                          delegate: delegate,
                          icons: _icons,
                        ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.all(12.0.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0.r),
                          ),
                          child: GetRouterOutlet(
                            name: Routes.HOME,
                            emptyWidget: (delegate) => HomeScreen(),
                            pickPages: (currentNavStack) {
                              final res = currentNavStack.currentTreeBranch
                                  .pickAfterRoute(Routes.HOME);
                              return res;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar:
                Responsive.isMobile(context) && Get.height > 690.0
                    ? BottomBar(
                        icons: _icons,
                        currentIndex: _currentIndex,
                        onTap: (index) {
                          if (index != _currentIndex) {
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
                      )
                    : null,
          ),
        );
      },
    );
  }
}
