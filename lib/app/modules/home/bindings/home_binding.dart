import 'package:get/get.dart';
import '../data/home_repository.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/adapters/provider_adapter.dart';
import '../presentation/controllers/home_controller.dart';
import '../data/home_provider.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeProvider>(() => HomeProvider());
    Get.lazyPut<IHomeRepository>(() => HomeRepository(provider: Get.find()));
    Get.lazyPut(() => HomeController(repository: Get.find()));
  }
}
