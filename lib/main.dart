import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_verification/home.dart';
import 'package:phone_verification/phone.dart';
import 'package:phone_verification/userProfileScreen.dart';
import 'package:phone_verification/verify.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    // initialRoute: 'phone',
     initialRoute: 'register',
    //initialRoute: 'userProfile',
    debugShowCheckedModeBanner: false,
    routes: {
      'register': (context) => Register(userPhone: "9980014232", userCountryCode:"+91"),
      'phone': (context) => const MyPhone(),
      'verify': (context) => const MyVerify(),
      //'userProfile':  (context) => UserProfile(),
      'home': (context) => const MyHome(),
    },
  ));
}