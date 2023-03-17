
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_verification/commonfunctions.dart';
import 'UserData.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  DateFormat f = DateFormat("dd-MM-yyyy");
  @override
  Widget build(BuildContext context) {
    return const UserDetails();
  }
  @override
  void initState() {
    //loadData();
    super.initState();
    setState(() {

    });
  }


}


class UserDetails extends StatefulWidget {

  const UserDetails(  {Key? key}) : super(key: key);
  @override
  State<UserDetails> createState() => _UserDetailsState();
}


class _UserDetailsState extends State<UserDetails> {

  //Future<void> loadData async()
  Future<UserData> loadData() async {
    var x = await CommonFunctions.getUserProfileFile();
    var y = jsonDecode(CommonFunctions.readDataFromFile(x));
    return UserData.fromJson(y);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData>(
        future: loadData(),
        builder: (context, AsyncSnapshot<UserData> snapshot) {
          if (snapshot.hasData) {
            var u = snapshot.data;
            return Scaffold(
              body: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                alignment: Alignment.center, child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    Text(u!.userName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(u!.userEmail,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 25,
                    ),
                    Text('${u!.countryCode} ${u!.phoneno}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(u!.userBirthDate.toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(u!.userGender.toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(u!.userCountry,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),),
                    ElevatedButton(onPressed: () {
                      return;
                    },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.redAccent,
                          side: const BorderSide(
                            width: 4,
                            color: Color(0xffC09E63),
                          ),
                      ), child:const Text("Proceed")
                    ),
                  ],
                ),
              ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }
}