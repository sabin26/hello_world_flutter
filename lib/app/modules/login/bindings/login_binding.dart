import 'package:get/get.dart';
import '../data/login_repository.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/adapters/provider_adapter.dart';
import '../presentation/controllers/login_controller.dart';
import '../data/login_provider.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginProvider>(() => LoginProvider());
    Get.lazyPut<ILoginRepository>(() => LoginRepository(provider: Get.find()));
    Get.lazyPut(() => LoginController(repository: Get.find()));
  }
}
