import 'package:get/get.dart';
import '../../data/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository repository;
  ProfileController({required this.repository});
}
