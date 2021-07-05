import 'package:get/get.dart';
import '../models/login_model.dart';

// ignore: one_member_abstracts
abstract class ILoginProvider {
  Future<Response<LoginModel>> functionName(String path);
}
