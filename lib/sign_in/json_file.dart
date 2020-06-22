import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class JsonFile {
  File jsonFile;
  Directory dir;
  String fileName = "realEstateJsonFile.json";

  bool fileExists = false;
  Map<String, String> fileContent;

  bool  checkIfFileExists() {
    try {
      getApplicationDocumentsDirectory().then((Directory directory) {
        dir = directory;
        jsonFile = File(dir.path + '/' + fileName);
        fileExists = jsonFile.existsSync();
        if (fileExists)
          return true;
        else
          return false;
      });
    } on Exception catch (e) {
      throw e;
    }
    return false;
  }

  void createJsonFile(Map<String, String> content) {
    try {
      File file = File(dir.path + '/' + fileName);
      file.createSync();
      fileExists = true;
      file.writeAsStringSync(json.encode(content));
    } on Exception catch (e) {
      throw e;
    }
  }

  void writeToJsonFile(String key, String value) {
    try {
      getApplicationDocumentsDirectory().then((Directory directory) {
        dir = directory;
        jsonFile = File(dir.path + '/' + fileName);

        fileContent = json.decode(jsonFile.readAsStringSync());
        fileContent.update(
          key,
          (existingValue) => value,
          ifAbsent: () => value,
        );
      //Map<String ,String> content = {key:};
        jsonFile.writeAsStringSync(json.encode(fileContent));
      });
    } on Exception catch (e) {
      throw e;
    }
  }

  Map<String,String> getJsonFile(){
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + '/' + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        fileContent = json.decode(jsonFile.readAsStringSync());
        return fileContent;
      }
      else
        return null;
    });
    return null;
  }
}
