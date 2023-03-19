import 'package:flutter/material.dart';
import 'notlist.dart';

//var s = TempNotList.loadData();
class MyNots extends StatefulWidget {
  const MyNots({Key? key}) : super(key: key);

  @override
  State<MyNots> createState() => _MyNotsState();
}

class _MyNotsState extends State<MyNots> {
  List<NotItem> allLists = <NotItem>[];

  Future<List<NotItem>> getData() async {
    return TempNotList.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NotItem>>(
        future: getData(),
        builder: (context, AsyncSnapshot<List<NotItem>> snapshot) {
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

  List<Widget> getWidget(List<NotAction> actionList) {
    List<Widget> btnList = <Widget>[];
    for (var x in actionList) {
      ElevatedButton btn = ElevatedButton(
          onPressed: () => {debugPrint('${x.ActionName} Button is pressed.')},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),

          child: Text(x.ActionName));
      btnList.add(btn);
    }
    return btnList;
  }

}