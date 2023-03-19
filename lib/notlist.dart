import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class TempNotList {

  static Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/image.txt');
  }

  static Future<List<NotItem>> loadData() async {
    List<NotItem> notItemList = <NotItem>[];
    String x = await loadAsset();
    //rootBundle.loadString('assets/image.txt').then((value) => x = value);
    final _byteImage = const Base64Decoder().convert(x);

    for (int i = 0; i < 36; i++) {
      if (i % 3 == 0) {
        List<NotAction> naList = [];
        var na = NotAction("Report", Action.writeEmail);
        naList.add(na);
        na = NotAction("call", Action.call);
        naList.add(na);
        na = NotAction("Mark As Read", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "Your account is debited with Rs. 20 on 18-03-2013.", MsgType.text,
            null, '',
            naList));
      }
      else if (i % 3 == 1) {
        List<NotAction> naList = [];
        var na = NotAction("Visit", Action.redirect);
        naList.add(na);
        na = NotAction("Mark As Read", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "CROMA - Ear buds on sale.", MsgType.image, _byteImage, '',
            naList));
      }
      else if (i % 3 == 2) {
        List<NotAction> naList = [];
        var na = NotAction("Visit", Action.redirect);
        naList.add(na);
        na = NotAction("Mark As Read", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "YouTube Link.", MsgType.image, null,
            'https://www.youtube.com/watch?v=bc7_DsyBKWo',
            naList));
      }
      //notItemList[i] = NotItem("We got sale of Ear Buds","View Sale",);
    }
    return notItemList;
  }
}

class NotItem {
  NotItem.empty();
  NotItem(this.msg, this.type, this.bImage, this.vURl,this.actionList);
  String? msg = "";
  Uint8List? bImage;
  String? vURl = "";
  MsgType type = MsgType.text;
  List<NotAction> actionList = [];
}

class NotAction{
  NotAction.empty();
  NotAction(this.ActionName, this.actType);
  String ActionName ="";
  Action? actType;
}

enum ImageType
{
  png,
  gif,
  jpeg,
}

enum MsgType
{
  text,
  image,
  html,
}

enum Action {
  redirect,
  callHttps,
  delete,
  call,
  markAsRead,
  writeEmail
}