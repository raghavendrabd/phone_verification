import 'package:json_annotation/json_annotation.dart';
import 'gender.dart';
part 'UserData.g.dart';
/// This allows the `userdata` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.


@JsonSerializable()
class UserData
{
  String phoneno ="";
  String countryCode = "";
  String userName = "";
  String userEmail = "";
  DateTime userBirthDate = DateTime.now();
  Gender? userGender;
  String userCountry ="";
  // String _userState = "";
  // May be we need to capture more details like below
  // Whether Employed
  // Whether Self Employed
  // What is education
  // What is his interest like reading, writing, drawing, singing, listening to music

  UserData.empty();
  UserData(this.phoneno, this.countryCode, this.userName, this.userEmail, this.userBirthDate, this.userGender, this.userCountry);
  //UserData(this.phoneno, this.countryCode, this.userName, this.userEmail, this.userBirthDate,   this.userCountry);
  //UserData.full(this.userName, this.userEmail, this.userBirthDate, this.userGender, this.userCountry);

  // String get name => _userName;
  // Gender? get sex => _userGender;
  // String get phone => _phoneno;
  // String get email => _userEmail;
  // DateTime get dob => _userBirthDate;
  // String get country => _userCountry;
  //
  // set name(String n) => _userName = n;
  // set countryCode(String cc) => _countryCode = cc;
  // set phone(String ph) => _phoneno = ph;
  // set sex(Gender? g) => _userGender = g;
  // set email(String e) => _userEmail = e;
  // set dob(DateTime d) => _userBirthDate = d;
  // set country(String c) => _userCountry = c;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}

