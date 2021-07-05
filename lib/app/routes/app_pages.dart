import 'package:get/get.dart';
import 'package:hello_world/app/core/lang/application_text.dart';
import 'package:hello_world/app/modules/home/bindings/home_binding.dart';
import 'package:hello_world/app/modules/login/bindings/login_binding.dart';
import 'package:hello_world/app/modules/profile/bindings/profile_binding.dart';
import 'package:hello_world/app/modules/modules.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => LoginView(),
      title: ApplicationText.AUTHENTICATION.tr,
      transition: Transition.fade,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      transition: Transition.fade,
      page: () => HomeView(),
      middlewares: [
        RouterOutletContainerMiddleWare('/'),
      ],
      binding: HomeBinding(),
      children: [
        GetPage(
          name: Routes.PROFILE,
          page: () => ProfileView(),
          title: ApplicationText.PROFILE.tr,
          transition: Transition.size,
          binding: ProfileBinding(),
        ),
      ],
    ),
  ];
}
