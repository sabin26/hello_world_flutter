import '../domain/adapters/provider_adapter.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/models/login_model.dart';

class LoginRepository implements ILoginRepository {
  final ILoginProvider provider;

  LoginRepository({required this.provider});

  @override
  Future<LoginModel> functionName() async {
    final response = await provider.functionName('/path_to_function');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
