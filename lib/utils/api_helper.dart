import 'package:http/http.dart';

class ApiHelper {
  late Client _httpClient;

  static final ApiHelper _instance = ApiHelper._private();

  ApiHelper._private() {
    _httpClient = Client();
  }

  static ApiHelper get instance => _instance;

  Future<Response> get(Uri api, {Map<String, String>? headers}) async => await instance._httpClient.get(api, headers: headers);

  Future<Response> post(Uri api, {Map<String, String>? headers, dynamic body}) async => await instance._httpClient.post(api, headers: headers, body: body);

  Future<Response> delete(Uri api, {Map<String, String>? headers}) async => await instance._httpClient.delete(api, headers: headers);
}
