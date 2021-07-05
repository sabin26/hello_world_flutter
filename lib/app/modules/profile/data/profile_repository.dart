import '../domain/adapters/provider_adapter.dart';
import '../domain/adapters/repository_adapter.dart';
import '../domain/models/profile_model.dart';

class ProfileRepository implements IProfileRepository {
  final IProfileProvider provider;

  ProfileRepository({required this.provider});

  @override
  Future<ProfileModel> functionName() async {
    final response = await provider.functionName('/path_to_function');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
