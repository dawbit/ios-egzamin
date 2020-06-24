import 'package:iosegzamin/dataSources/api_client.dart';
import 'package:iosegzamin/models/example_response.dart';

class ExampleRepository {
  Future<ExampleResponse> getExampleForName(String name) => client.getExampleForName(name);
}
