import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hello_world/app/core/lang/application_text.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/core/utils/constants.dart';
import 'app/routes/app_pages.dart';
import 'app/core/lang/translation_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  if (!kIsWeb && GetPlatform.isDesktop) {
    await DesktopWindow.setFullScreen(true);
  } else {
    setPathUrlStrategy();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      key: GlobalKey(),
      title: ApplicationText.APPLICATION_NAME.tr,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarBackgroundColor),
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        backgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        iconTheme: const IconThemeData().copyWith(color: kIconColor),
        fontFamily: 'Montserrat',
      ),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      builder: (context, widget) => ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: ScreenUtilInit(
          key: GlobalKey(),
          builder: () => widget!,
        ),
      ),
      getPages: AppPages.pages,
      routeInformationParser: GetInformationParser(
        initialRoute: Routes.HOME,
      ),
      routerDelegate: GetDelegate(
        backButtonPopMode: PopMode.History,
        preventDuplicateHandlingMode:
            PreventDuplicateHandlingMode.PopUntilOriginalRoute,
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const NeverScrollableScrollPhysics();
  }
}
