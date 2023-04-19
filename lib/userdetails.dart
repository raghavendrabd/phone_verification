
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_verification/commonfunctions.dart';
import 'package:phone_verification/country.dart';
import 'package:phone_verification/gender.dart';
import 'MyNots.dart';
import 'UserData.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);
  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {


  @override
  Widget build(BuildContext context) {
    return const UserDetails();
  }
  @override
  void initState() {
    //loadData();
    super.initState();
    setState(() {});
  }


}


class UserDetails extends StatefulWidget {

  const UserDetails(  {Key? key}) : super(key: key);
  @override
  State<UserDetails> createState() => _UserDetailsState();
}


class _UserDetailsState extends State<UserDetails> {

  DateFormat f = DateFormat("dd-MM-yyyy");

  //Future<void> loadData async()
  Future<UserData> loadData() async {
    var x = await CommonFunctions.getUserProfileFile();
    var y = jsonDecode(CommonFunctions.readDataFromFile(x));
    return UserData.fromJson(y);
  }

  String getGender(String g) {
    return g.replaceAll('Gender.', '');
  }

  String getCountry(String g) {
    return g.replaceAll('Text', '').replaceAll("\"", '')
        .replaceAll('(', '')
        .replaceAll(')', '');
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<UserData>(
  //       future: loadData(),
  //       builder: (context, AsyncSnapshot<UserData> snapshot) {
  //         if (snapshot.hasData) {
  //           var u = snapshot.data;
  //           return Scaffold(
  //             appBar: AppBar(
  //               title: const Text('Profile Details'),
  //             ),
  //             body:  SingleChildScrollView(
  //               child: Column(
  //                 children: <Widget>[
  //                   Row(
  //                     children: <Widget>[
  //                       Column(
  //                         children: const <Widget>[
  //                           Text("Name",
  //                             style: TextStyle(
  //                                 fontSize: 22, fontWeight: FontWeight.bold),)
  //                           ,
  //                         ],),
  //                       Column(
  //                         children: <Widget>[ Text(u!.userName,
  //                           style: const TextStyle(
  //                               fontSize: 22, fontWeight: FontWeight.bold),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Row(
  //                     children: <Widget>[
  //                       Column(
  //                         children: const <Widget>[
  //                           Text("Email",
  //                             style: TextStyle(
  //                                 fontSize: 22, fontWeight: FontWeight.bold),)
  //                           ,
  //                         ],),
  //                       Column(
  //                         children: <Widget>[ Text(u!.userEmail,
  //                           style: const TextStyle(
  //                               fontSize: 22, fontWeight: FontWeight.bold),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Row(
  //                     children: <Widget>[
  //                       Column(
  //                         children: const <Widget>[
  //                           Text("Phone",
  //                             style: TextStyle(
  //                                 fontSize: 22, fontWeight: FontWeight.bold),)
  //                           ,
  //                         ],),
  //                       Column(
  //                         children: <Widget>[ Text('${u!.countryCode} ${u!.phoneno}',
  //                           style: const TextStyle(
  //                               fontSize: 22, fontWeight: FontWeight.bold),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Row(
  //                     children: <Widget>[
  //                       Column(
  //                         children: const <Widget>[
  //                           Text("Birth Date",
  //                             style: TextStyle(
  //                                 fontSize: 22, fontWeight: FontWeight.bold),)
  //                           ,
  //                         ],),
  //                       Column(
  //                         children: <Widget>[ Text(f.format(u!.userBirthDate),
  //                           style: const TextStyle(
  //                               fontSize: 22, fontWeight: FontWeight.bold),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Row(
  //                     children: <Widget>[
  //                       Column(
  //                         children: const <Widget>[
  //                           Text("Gender",
  //                             style: TextStyle(
  //                                 fontSize: 22, fontWeight: FontWeight.bold),)
  //                           ,
  //                         ],),
  //                       Column(
  //                         children: <Widget>[ Text(getGender(u!.userGender.toString()),
  //                           style: const TextStyle(
  //                               fontSize: 22, fontWeight: FontWeight.bold),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(height: 10),
  //                   Row(
  //                     children: <Widget>[
  //                       Column(
  //                         children: const <Widget>[
  //                           Text("Country",
  //                             style: TextStyle(
  //                                 fontSize: 22, fontWeight: FontWeight.bold),)
  //                           ,
  //                         ],),
  //                       Column(
  //                         children: <Widget>[ Text(getCountry(CountryList.country_menu_items
  //             .firstWhere((element) =>
  //         element.value == u!.userCountry)
  //             .child
  //             .toString()),
  //                           style: const TextStyle(
  //                               fontSize: 22, fontWeight: FontWeight.bold),),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //
  //                   ElevatedButton(onPressed: () {
  //                     Navigator.of(context).push(MaterialPageRoute(
  //                         builder: (context) => const MyNots()));
  //                   },
  //                       style: ElevatedButton.styleFrom(
  //                         backgroundColor: Colors.redAccent,
  //                         side: const BorderSide(
  //                           width: 4,
  //                           color: Color(0xffC09E63),
  //                         ),
  //                       ), child: const Text("Proceed")
  //                   ),
  //                 ],
  //               ),
  //             ),
  //
  //           );
  //         } else {
  //           return const CircularProgressIndicator();
  //         }
  //       }
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData>(
        future: loadData(),
        builder: (context, AsyncSnapshot<UserData> snapshot) {
          if (snapshot.hasData) {
            var u = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile Details'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
                          child: Text("Name",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),)
                          ,),
                      ],),
                    Row(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                          child: Text(u!.userName,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),)
                          ,),
                      ],),
                    Row(
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
                          child: Text("Email",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),)
                          ,),
                      ],),
                    Row(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                          child: Text(u!.userEmail,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),)
                          ,),
                      ],),
                    Row(
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
                          child: Text("Phone",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),)
                          ,),
                      ],),
                    Row(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                          child: Text('${u!.countryCode} ${u!
                              .phoneno}',
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),)
                          ,),
                      ],),
                    Row(
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
                          child: Text("Birth Date",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),)
                          ,),
                      ],),
                    Row(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                          child: Text(f.format(u!.userBirthDate),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),)
                          ,),
                      ],),
                    Row(
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
                          child: Text("Gender",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),)
                          ,),
                      ],),
                    Row(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                          child: Text(getGender(
                              u!.userGender.toString()),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),)
                          ,),
                      ],),
                    Row(
                      children: const <Widget>[
                        Padding(padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
                          child: Text("Country",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),)
                          ,),
                      ],),
                    Row(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                          child: Text(getCountry(
                              CountryList.country_menu_items
                                  .firstWhere((element) =>
                              element.value == u!.userCountry)
                                  .child
                                  .toString()),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),)
                          ,),
                      ],),
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyNots()));
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          side: const BorderSide(
                            width: 4,
                            color: Color(0xffC09E63),
                          ),
                        ), child: const Text("Proceed")
                    ),
                  ],
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