part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String HOME = _Paths.HOME;
  static const String PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  static const String HOME = '/';
  static const String PROFILE = '/profile';
}
