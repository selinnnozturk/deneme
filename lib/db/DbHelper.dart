import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Database? _db;

  Future<Database?> get db async {
    // ignore: unnecessary_null_comparison
    if (_db == null) {
      _db = await initializeDb();
    }

    return _db;
  }

  Future<Database> initializeDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "kisi.db";

    var dbKisi = await openDatabase(path, version: 2, onCreate: _createDb);
    return dbKisi;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "Create table MobilSettings(AdSoyad text,Telefon text,Yas text,EMail text, Sehir text)");
    /*await db.execute(
        "Create table MobilSettings(Id integer primary key,Id2 text," +
            "Abbrevation text,Active text,ConfigClass text,DatabaseId text," +
            "DbName text,Deleted text,Description text,Oskey text," +
            "Priority text,Proxy text,Proxyr text,SchoolName text)");
    await db.execute(
        "Create table UserMainPage(Id integer primary key,PageName text)");
    await db.execute(
        "Create table ParentUser(Id integer primary key, Adi text,AdiSoyadi text,Soyadi text," +
            "CinsiyetId text,DersYiliId text,Eposta text,Fotograf text,KisiID text,Numarasi text," +
            "OgrenciId text,OgrenciOkulBilgiId text,OgrenciSeviyeId text,OkulId text,SinifAdi text,SinifId text,SinifKodu text,TcKimlikNo text)");
    await db.execute(
        "Create table UserTheme(Id integer primary key,ThemeName text,Active text)");*/
  }
}
