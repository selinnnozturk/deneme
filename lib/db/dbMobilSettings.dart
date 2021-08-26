import 'package:deneme/model/mobilSettings.dart';
import 'package:sqflite/sqflite.dart';

import 'DbHelper.dart';

class DbMobilSettings {
  String tblMobilSettings = "MobilSettings";
  String colId = "Id";
  //String colId2 = "Id2";
  String adSoyad = "AdSoyad";
  String telefon = "Telefon";
  String yas = "Yas";
  String eMail = "EMail";
  String sehir = "Sehir";
  /*
  String colDeleted = "Deleted";
  String colDescription = "Description";
  String colOskey = "Oskey";
  String colPriority = "Priority";
  String colProxy = "Proxy";
  String colProxyr = "Proxyr";
  String colSchoolName = "SchoolName";*/

  DbHelper dbHelper = new DbHelper();

  Future<int> mobilSettingsInsert(MobilSettings conf) async {
    Database? db = await this.dbHelper.db;
    var result = await db!.insert(tblMobilSettings, conf.toMap());
    return result;
  }

  // Future<int> mobilSettingsUpdate(MobilSettings conf) async {
  //   Database db = await this.dbHelper.db;
  //   var result = await db.update(tblMobilSettings, conf.toMap(),
  //       where: "$colId =?", whereArgs: [conf.id]);
  //   return result;
  // }

  Future<int> mobilSettingsDelete(MobilSettings conf) async {
    Database? db = await this.dbHelper.db;
    var result = await db!.rawDelete("Delete from $tblMobilSettings");
    return result;
  }

  Future<List> getMobilSettings() async {
    Database? db = await this.dbHelper.db;
    var result = await db!.rawQuery("Select * from $tblMobilSettings");
    return result;
  }

  Future<int> isMobilSettings() async {
    Database? db = await this.dbHelper.db;
    var result = await db!.rawQuery("Select * from $tblMobilSettings");
    if (result.isEmpty) {
      return 0;
    } else {
      return 1;
    }
  }
}
