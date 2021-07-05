import '../domain/adapters/provider_adapter.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/models/home_model.dart';

class HomeRepository implements IHomeRepository {
  final IHomeProvider provider;

  HomeRepository({required this.provider});

  @override
  Future<HomeModel> functionName() async {
    final response = await provider.functionName('/path_to_function');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
