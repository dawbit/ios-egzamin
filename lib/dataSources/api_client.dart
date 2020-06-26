import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:iosegzamin/models/example_response.dart';

part 'api_client.g.dart';

final client = ApiClient(Dio());

@RestApi(baseUrl: 'http://sroczynski.pl/iosexamrest/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/examresult/{result}")
  Future<ExampleResponse> getExampleForName(@Path() String result);
}
