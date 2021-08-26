class MobilSettings {
  late String _adSoyad;
  late String _telefon;
  late String _yas;
  late String _eMail;
  late String _sehir;

  MobilSettings(
    this._adSoyad,
    this._telefon,
    this._yas,
    this._eMail,
    this._sehir,
  );

  String get adSoyad => _adSoyad;
  String get telefon => _telefon;
  String get yas => _yas;
  String get eMail => _eMail;
  String get sehir => _sehir;

  set adSoyad(String value) => value;
  set telefon(String value) => value;
  set yas(String value) => value;
  set eMail(String value) => value;
  set sehir(String value) => value;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["AdSoyad"] = _adSoyad;
    map["Telefon"] = _telefon;
    map["Yas"] = _yas;
    map["EMail"] = _eMail;
    map["Sehir"] = _sehir;

    return map;
  }

  //DB  deki ile aynı isimde olması gerek büyük-küçük harfe dikkat et
  MobilSettings.fromObject(dynamic o) {
    this._adSoyad = o["AdSoyad"];
    this._telefon = o["Telefon"];
    this._yas = o["Yas"];
    this._eMail = o["EMail"];
    this._sehir = o["Sehir"];
  }

  // MobilSettings.fromJson(Map o) {
  //   this._id = o["id"];
  //   this._adSoyad = o["adSoyad"];
  //   this._telefon = o["telefon"];
  //   this._yas = o["yas"];
  //   this._eMail = o["eMail"];
  //   this._sehir = o["sehir"];
  // }

  Map toJson() {
    return {
      //"id": _id2,
      "adSoyad": _adSoyad,
      "telefon": _telefon,
      "yas": _yas,
      "eMail": _eMail,
      "sehir": _sehir,
    };
  }
}
