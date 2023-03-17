

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CommonFunctions {

  static Future<String> getUserProfileFile() async{
    //Directory appDocumentsDirectory = getApplicationDocumentsDirectory() as Directory;

    //getApplicationDocumentsDirectory().then((value) => {appDocumentsPath = value.path});
    var x = await getApplicationDocumentsDirectory();
    String appDocumentsPath = x.path;
    return '$appDocumentsPath/userProfileDate.txt';
  }

  static void writeDataToFile(String filePath, String fileData) {
    File f = File(filePath);
    f.writeAsStringSync(fileData);
  }

  static String readDataFromFile(String filePath) {
    File f = File(filePath);
    return f.readAsStringSync();
  }
}