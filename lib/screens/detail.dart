import 'package:deneme/db/dbMobilSettings.dart';
import 'package:deneme/model/mobilSettings.dart';
import 'package:deneme/screens/detailList.dart';
import 'package:flutter/material.dart';

import '../main.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  String adSoyad;
  String telefon;
  String yas;
  String eMail;
  String sehir;

  Details({
    required this.adSoyad,
    required this.eMail,
    required this.sehir,
    required this.telefon,
    required this.yas,
  });
  @override
  _DetailsState createState() => _DetailsState(
        adSoyad: this.adSoyad,
        eMail: this.eMail,
        sehir: this.sehir,
        telefon: this.telefon,
        yas: this.yas,
      );
}

class _DetailsState extends State<Details> {
  String adSoyad;
  String telefon;
  String yas;
  String eMail;
  String sehir;

  _DetailsState(
      {required this.adSoyad,
      required this.eMail,
      required this.sehir,
      required this.telefon,
      required this.yas});
  List<MobilSettings> listModel = new List<MobilSettings>.empty(growable: true);
  DbMobilSettings db = new DbMobilSettings();
  int i = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyApp()));
            });
          },
        ),
        title: Text("Bilgilerim"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.white54,
        margin: EdgeInsets.all(50),
        alignment: Alignment(0.0, 0.0),
        child: Column(
          children: [
            Text("Bilgileriniz:",
                style: TextStyle(
                    backgroundColor: Colors.pink[300],
                    color: Colors.white,
                    height: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
              child: Container(
                color: Colors.pink[300],
              ),
            ),
            Text("Ad Soyad: $adSoyad ",
                style: TextStyle(height: 3, fontSize: 21)),
            Text("Yaş: $yas ", style: TextStyle(fontSize: 21)),
            Text("E-Mail: $eMail ", style: TextStyle(fontSize: 21)),
            Text("Telefon: $telefon ", style: TextStyle(fontSize: 21)),
            Text("Şehir: $sehir ", style: TextStyle(fontSize: 21)),

            /*Text(this.adSoyad, style: TextStyle(fontSize: 23)),
            Text(this.eMail, style: TextStyle(fontSize: 23)),
            Text(this.sehir, style: TextStyle(fontSize: 23)),
            Text(this.telefon, style: TextStyle(fontSize: 23)),
            Text(this.yas, style: TextStyle(fontSize: 23)),*/
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400], padding: EdgeInsets.all(15)),
                onPressed: () {
                  buildUpload();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bilgileri yükle!", style: TextStyle(fontSize: 25)),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void buildUpload() {
    db.mobilSettingsInsert(MobilSettings(
      "${this.adSoyad}",
      "${this.telefon}",
      "${this.yas}",
      "${this.eMail}",
      "${this.sehir}",
    ));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => DetailsList()));
  }
}
