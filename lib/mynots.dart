import 'package:flutter/material.dart';
import 'package:phone_verification/playvideo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:phone_verification/notlist.dart' as mynotlist;
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/extra.dart' as android_extra;
import 'package:intent/typedExtra.dart' as android_typedExtra;
import 'package:intent/action.dart' as android_action;

//var s = TempNotList.loadData();
class MyNots extends StatefulWidget {
  const MyNots({Key? key}) : super(key: key);

  @override
  State<MyNots> createState() => _MyNotsState();
}

class _MyNotsState extends State<MyNots> {
  List<mynotlist.NotItem> allLists = <mynotlist.NotItem>[];


  Future<List<mynotlist.NotItem>> getData() async {
    return mynotlist.TempNotList.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<mynotlist.NotItem>>(
        future: getData(),
        builder: (context, AsyncSnapshot<List<mynotlist.NotItem>> snapshot) {
          if (snapshot.hasData) {
            allLists = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text("My Notifications"),
              ),
              body: ListView.builder(
                // Let the ListView know how many items it needs to build.
                itemCount: allLists.length,
                //itemCount: 10,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  final item = allLists[index];
                  return Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 25,
                      ),
                      Text(item.msg!,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),),
                      Row(
                        children: getWidget(item.actionList),
                      )
                    ],
                  );
                  //final item = null;
                  // return ListTile(
                  //   title: Text(item.msg!),
                  //   //subtitle: item.buildSubtitle(context),
                  // );
                },
              ),
            );
          }
          else {
            return const Text("Error Occurred");
          }
        }
    );
  }

  List<Widget> getWidget(List<mynotlist.NotAction> actionList) {
    List<Widget> btnList = <Widget>[];
    for (var x in actionList) {
      ElevatedButton btn = ElevatedButton(
          onPressed: () async {
            if (x.actType == mynotlist.Action.call) {
              final url = Uri.parse('tel:=${x.actionArgument}');
              try {
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  debugPrint("Can't launch $url");
                }
              }
              catch(error) {
                debugPrint("Can't launch $error.toString()");
              }
            }

            else if (x.actType == mynotlist.Action.writeEmail) {
              final url = Uri.parse(x.actionArgument);
              try {
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  debugPrint("Can't launch $url");
                }
              }
              catch(error) {
                debugPrint("Can't launch $error.toString()");
              }
            }
            else if (x.actType == mynotlist.Action.youtubeLink) {
              final url = Uri.parse(x.actionArgument);
              try {
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  debugPrint("Can't launch $url");
                }
              }
              catch(error) {
                debugPrint("Can't launch $error.toString()");
              }
            }
            else if (x.actType == mynotlist.Action.playVideo) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => VideoPlayerScreen(x.actionArgument)));
              // final url = Uri.parse('${x.actionArgument}');
              // try {
              //   if (await canLaunchUrl(url)) {
              //     launchUrl(url);
              //   } else {
              //     // ignore: avoid_print
              //     debugPrint("Can't launch $url");
              //   }
              // }
              // catch(error) {
              //   debugPrint("Can't launch $error.toString()");
              // }
            }
            else if (x.actType == mynotlist.Action.redirect) {
              final url = Uri.parse(x.actionArgument);
              try {
                if (await canLaunchUrl(url)) {
                  launchUrl(url);
                } else {
                  // ignore: avoid_print
                  debugPrint("Can't launch $url");
                }
              }
              catch(error) {
                debugPrint("Can't launch $error.toString()");
              }
            }
            else if (x.actType == mynotlist.Action.markAsRead) {
              android_intent.Intent()
                ..setAction(android_action.Action.ACTION_VIEW)
                ..setPackage("com.bt.bms")
                ..setData(Uri.parse("https://in.bookmyshow.com/bengaluru/movies/kabzaa/ET00315054"))
                ..startActivity().catchError((e) => debugPrint(e));
              //Intent intent = getPackageManager().getLaunchIntentForPackage("com.google.android.youtube");
              // final url = Uri.parse(x.actionArgument);
              // try {
              //   if (await canLaunchUrl(url)) {
              //     launchUrl(url);
              //   } else {
              //     // ignore: avoid_print
              //     debugPrint("Can't launch $url");
              //   }
              // }
              // catch(error) {
              //   debugPrint("Can't launch $error.toString()");
              // }
            }
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),

          child: Text(x.actionName));
      btnList.add(btn);
    }
    return btnList;
  }

}