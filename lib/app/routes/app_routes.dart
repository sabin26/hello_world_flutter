part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String HOME = _Paths.HOME;
  static const String PROFILE = _Paths.PROFILE;
  static const String AUTHENTICATION = _Paths.AUTHENTICATION;
}

abstract class _Paths {
  static const String AUTHENTICATION = '/authentication';
  static const String HOME = '/';
  static const String PROFILE = '/profile';
}
