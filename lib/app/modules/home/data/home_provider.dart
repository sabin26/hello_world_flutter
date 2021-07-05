import 'dart:async' show TimeoutException;
import 'dart:io' show SocketException;
import 'package:get/get.dart';
import 'package:retry/retry.dart';
import 'package:hello_world/app/core/utils/constants.dart';
import '../domain/adapters/provider_adapter.dart';
import '../domain/models/home_model.dart';

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => HomeModel.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = kAPI;
  }

  @override
  Future<Response<HomeModel>> functionName(String path) {
    final r = RetryOptions(maxAttempts: 5);
    final response = r.retry(
      () => get<HomeModel>(path).timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return response;
  }
}
