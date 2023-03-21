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

    for (int i = 0; i < 50; i++) {
      if (i % 5 == 0) {
        List<NotAction> naList = [];
        var na = NotAction("Report", 'mailto:raghubd@gmail.com?subject=Not a proper transaction&body=Above transaction is not valid', Action.writeEmail);
        naList.add(na);
        na = NotAction("call", "9980014232", Action.call,);
        naList.add(na);
        na = NotAction("Mark As Read", "", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", "", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "Your account is debited with Rs. 20 on 18-03-2013.", MsgType.text,
            null, '',
            naList));
      }
      else if (i % 5 == 1) {
        List<NotAction> naList = [];
        var na = NotAction("Visit", "https://in.bookmyshow.com/events/punyakoti/ET00354832", Action.redirect);
        naList.add(na);
        na = NotAction("Mark As Read", "com.bt.bms", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", "", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "Sonu Venugopal new show is coming. Book here.", MsgType.image, _byteImage, '',
            naList));
      }
      else if (i % 5 == 2) {
        List<NotAction> naList = [];
        var na = NotAction("Visit", "https://www.youtube.com/watch?v=bc7_DsyBKWo", Action.youtubeLink);
        naList.add(na);
        na = NotAction("Mark As Read", "", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", "", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "YouTube Link.", MsgType.image, null,
            'https://www.youtube.com/watch?v=bc7_DsyBKWo',
            naList));
      }
      else if (i % 5 == 3) {
        List<NotAction> naList = [];
        var na = NotAction("Very Good", "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", Action.playVideo);
        naList.add(na);
        na = NotAction("Good", "", Action.callHttps);
        naList.add(na);
        na = NotAction("Fair", "", Action.callHttps);
        naList.add(na);
        na = NotAction("Poor", "", Action.callHttps);
        naList.add(na);
        na = NotAction("Very Poor", "", Action.callHttps);
        naList.add(na);
        // na = NotAction("Orders", "", Action.callHttps);
        // naList.add(na);
        // na = NotAction("Mark As Read", "", Action.markAsRead);
        // naList.add(na);
        // na = NotAction("Delete", "", Action.delete);
        // naList.add(na);
        notItemList.add(NotItem(
            "Please provide feedback for your last order.", MsgType.text, null,
            'https://www.youtube.com/watch?v=bc7_DsyBKWo',
            naList));
      }
      else if (i % 5 == 4) {
        List<NotAction> naList = [];
        var na = NotAction("Approve", "", Action.callHttps);
        naList.add(na);
        na = NotAction("Reject", "", Action.callHttps);
        naList.add(na);
        na = NotAction("Mark As Read", "", Action.markAsRead);
        naList.add(na);
        na = NotAction("Delete", "", Action.delete);
        naList.add(na);
        notItemList.add(NotItem(
            "Mr x has applied for leave.", MsgType.text, null,
            '',
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
  NotAction(this.actionName, this.actionArgument, this.actType);
  String actionName ="";
  String actionArgument = "";
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
  writeEmail,
  youtubeLink,
  playVideo
}