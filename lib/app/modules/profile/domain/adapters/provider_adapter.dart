import 'package:get/get.dart';
import '../models/profile_model.dart';

// ignore: one_member_abstracts
abstract class IProfileProvider {
  Future<Response<ProfileModel>> functionName(String path);
}
