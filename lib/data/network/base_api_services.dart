abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url, dynamic data);
  Future<dynamic> putApi(String url, dynamic data);
  Future<dynamic> deleteApi(String url);
  Future<dynamic> putApi1(String url);
}
