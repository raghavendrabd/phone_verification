import 'package:json_annotation/json_annotation.dart';


enum Gender
{
  @JsonValue("male") Male,
  @JsonValue("female") Female,
  @JsonValue("other") Other,
  @JsonValue("unknown") Unknown,

}