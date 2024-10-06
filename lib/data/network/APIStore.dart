import 'package:dio/dio.dart';
import 'package:jammer_mobile_app/res/app_url/static_variables.dart';

Dio httpClient() {
  final options = BaseOptions(
      baseUrl: StaticVariables.url,
      headers: {"Content-Type": "application/json", ...getAuthHeader()});

  return Dio(options);
}

Dio httpClientNoToken() {
  final options = BaseOptions(baseUrl: StaticVariables.url, headers: {
    "Content-Type": "application/json",
  });

  return Dio(options);
}

Dio httpFormDataClient() {
  final options = BaseOptions(
      baseUrl: StaticVariables.url,
      headers: {"Content-Type": "multipart/form-data", ...getAuthHeader()});
  return Dio(options);
}

Dio httpSignup() {
  final options = BaseOptions(baseUrl: StaticVariables.url, headers: {
    "Content-Type": "multipart/form-data",
  });
  return Dio(options);
}

Map<String, String> getAuthHeader() {
  // print("Tokken${StaticVariables.tokenid}");
  return {
    "Authorization": "Bearer ${StaticVariables.tokenid}",
  };
}
