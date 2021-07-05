import 'dart:async' show TimeoutException;
import 'dart:io' show SocketException;
import 'package:get/get.dart';
import 'package:retry/retry.dart';
import 'package:hello_world/app/core/utils/constants.dart';
import '../domain/adapters/provider_adapter.dart';
import '../domain/models/profile_model.dart';

class ProfileProvider extends GetConnect implements IProfileProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => ProfileModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = kAPI;
  }

  @override
  Future<Response<ProfileModel>> functionName(String path) {
    final r = RetryOptions(maxAttempts: 5);
    final response = r.retry(
      () => get<ProfileModel>(path).timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return response;
  }
}
