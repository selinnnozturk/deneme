import 'package:deneme/db/dbMobilSettings.dart';
import 'package:deneme/model/mobilSettings.dart';

import 'package:flutter/material.dart';

import '../main.dart';

// ignore: must_be_immutable
class DetailsList extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<DetailsList> {
  List<MobilSettings> listModel = new List<MobilSettings>.empty(growable: true);
  DbMobilSettings db = new DbMobilSettings();
  int i = 1;

  @override
  void initState() {
    super.initState();
    getData();
  }

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
        title: Text("Bilgi Listeleme"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        color: Colors.white54,
        margin: EdgeInsets.all(20),
        alignment: Alignment(5, 5),
        child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, right: 5, left: 5),
            itemCount: this.listModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(3),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Ad Soyad : "),
                        Text(listModel[index].adSoyad),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Yaş : "),
                        Text(listModel[index].yas),
                      ],
                    ),
                    Row(
                      children: [
                        Text("E-Mail : "),
                        Text(listModel[index].eMail),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Telefon : "),
                        Text(listModel[index].telefon),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Şehir : "),
                        Text(listModel[index].sehir),
                      ],
                    ),

                    //eleveted
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[300],
                            side: BorderSide(color: Colors.red, width: 9),
                            padding: EdgeInsets.all(10)),
                        onPressed: () {
                          //buildUpload();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sil"),
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[300],
                            side: BorderSide(color: Colors.green, width: 7),
                            padding: EdgeInsets.all(10)),
                        onPressed: () {
                          //buildUpload();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Düzenle"),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                      child: Container(
                        color: Colors.pink[400],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  void getData() {
    db.getMobilSettings().then((value) {
      for (var i = 0; i < value.length; i++) {
        setState(() {
          listModel.add(MobilSettings.fromObject(value[i]));
        });
      }
    });
  }
}
