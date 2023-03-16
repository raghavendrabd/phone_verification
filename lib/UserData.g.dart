// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['phoneno'] as String,
      json['countryCode'] as String,
      json['userName'] as String,
      json['userEmail'] as String,
      DateTime.parse(json['userBirthDate'] as String),
      $enumDecodeNullable(_$GenderEnumMap, json['userGender']),
      json['userCountry'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'phoneno': instance.phoneno,
      'countryCode': instance.countryCode,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userBirthDate': instance.userBirthDate.toIso8601String(),
      'userGender': _$GenderEnumMap[instance.userGender],
      'userCountry': instance.userCountry,
    };

const _$GenderEnumMap = {
  Gender.Male: 'male',
  Gender.Female: 'female',
  Gender.Other: 'other',
  Gender.Unknown: 'unknown',
};
