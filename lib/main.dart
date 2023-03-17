import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_verification/home.dart';
import 'package:phone_verification/phone.dart';
import 'package:phone_verification/userProfileScreen.dart';
import 'package:phone_verification/userdetails.dart';
import 'package:phone_verification/verify.dart';

import 'UserData.dart';
import 'commonfunctions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AppFirstPage());
}
class AppFirstPage extends StatefulWidget {
  const AppFirstPage({Key? key}) : super(key: key);

  @override
  State<AppFirstPage> createState() => _AppFirstPageState();
}

class _AppFirstPageState extends State<AppFirstPage> {


  Future<UserData> loadData() async {
    var x = await CommonFunctions.getUserProfileFile();
    var y = jsonDecode(CommonFunctions.readDataFromFile(x));
    return UserData.fromJson(y);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<UserData>(
        future: loadData(),
        builder: (context, AsyncSnapshot<UserData> snapshot) {
          if (snapshot.hasData) {
            return const UserInfo();
          }
          else {
            return const MyPhone();
          }
        },
      ),
      routes: {
        'register': (context) =>
            Register(userPhone: "9980014232", userCountryCode: "+91"),
        'phone': (context) => const MyPhone(),
        'verify': (context) => const MyVerify(),
        //'userProfile':  (context) => UserProfile(),
        'home': (context) => const MyHome(),
      },
    );
  }
}
