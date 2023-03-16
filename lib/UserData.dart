


import 'gender.dart';

class UserData
{
  String _phoneno ="";
  String _countryCode = "";
  String _userName = "";
  String _userEmail = "";
  DateTime _userBirthDate = DateTime.now();
  Gender? _userGender;
  String _userCountry ="";
  // String _userState = "";
  // May be we need to capture more details like below
  // Whether Employed
  // Whether Self Employed
  // What is education
  // What is his interest like reading, writing, drawing, singing, listening to music

  UserData.empty();
  UserData(this._phoneno, this._countryCode);
  UserData.full(this._userName, this._userEmail, this._userBirthDate, this._userGender, this._userCountry);

  String get name => _userName;
  Gender? get sex => _userGender;
  String get phone => _phoneno;
  String get email => _userEmail;
  DateTime get dob => _userBirthDate;
  String get country => _userCountry;

  set name(String n) => _userName = n;
  set countryCode(String cc) => _countryCode = cc;
  set phone(String ph) => _phoneno = ph;
  set sex(Gender? g) => _userGender = g;
  set email(String e) => _userEmail = e;
  set dob(DateTime d) => _userBirthDate = d;
  set country(String c) => _userCountry = c;
}

