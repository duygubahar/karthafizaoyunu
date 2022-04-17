import 'package:kart_oyunu/Veriler.dart';
import 'package:kart_oyunu/VeritabaniYardimcisi.dart';

class Verilerdao {
  Future<List<Veriler>> tumVeriler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM veriler ");

    return List.generate(maps.length, (i) {
      var satir = maps[1];
      return Veriler(satir["id"], satir["skor"], satir["zaman"]);
    });
  }


  Future<void> veriEkle(int skor, int zaman) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["skor"] = skor;
    bilgiler["zaman"] = zaman;
    await db.insert("veriler", bilgiler);
  }
}
