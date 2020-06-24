import 'package:json_annotation/json_annotation.dart';

part 'example_response.g.dart';

@JsonSerializable()
class ExampleResponse {
  //List<company> example;
  String name;
  //@JsonKey(name: 'company')
  //Company company;
  ExampleResponse({this.name});

  //https://flutter.dev/docs/development/data-and-backend/json
  factory ExampleResponse.fromJson(Map<String, dynamic> json) => _$ExampleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleResponseToJson(this);
}
