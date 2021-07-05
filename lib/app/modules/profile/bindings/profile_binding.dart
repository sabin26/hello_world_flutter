import 'package:get/get.dart';
import '../data/profile_repository.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/adapters/provider_adapter.dart';
import '../presentation/controllers/profile_controller.dart';
import '../data/profile_provider.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileProvider>(() => ProfileProvider());
    Get.lazyPut<IProfileRepository>(
        () => ProfileRepository(provider: Get.find()));
    Get.lazyPut(() => ProfileController(repository: Get.find()));
  }
}
