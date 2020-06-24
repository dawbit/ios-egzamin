import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:iosegzamin/models/example_response.dart';

part 'api_client.g.dart';

final client = ApiClient(Dio());

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5/weather')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("?q={name}&appid=2121bdef55d2ebe6dae0ec9dfaa4e254")
  Future<ExampleResponse> getExampleForName(@Path() String name);
}
