import 'package:get/get.dart';
import '../models/home_model.dart';

// ignore: one_member_abstracts
abstract class IHomeProvider {
  Future<Response<HomeModel>> functionName(String path);
}
