

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CommonFunctions {

  static String getUserProfileFile() {
    //Directory appDocumentsDirectory = getApplicationDocumentsDirectory() as Directory;
    String appDocumentsPath = "";
    getApplicationDocumentsDirectory().then((value) => {appDocumentsPath = value.path});
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