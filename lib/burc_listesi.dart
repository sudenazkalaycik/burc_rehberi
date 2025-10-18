import 'package:burc_rehberi/burc_item.dart';
import 'package:flutter/material.dart';
import 'model/burc.dart';
import 'data/strings.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        title: Text("Burçlar Listesi", style: TextStyle(color: Colors.white, fontSize: 25),),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: ListView.builder(itemBuilder:(context, index){
          return BurcItem(listelenenBurc: tumBurclar[index]);
        }, itemCount: tumBurclar.length,),
      )
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 10; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      // akrep8.png değerini oluşturmak için Akrep --> akrep{}.png
      var burcKucukResim = burcAdi.toLowerCase() + '${i + 1}.png';
      // akrep_buyuk8.png değerini oluşturmak için Akrep --> akrep + _buyuk{}.png
      var burcBuyukResim = burcAdi.toLowerCase() + '_buyuk${i + 1}';
      Burc eklenecekBurc = Burc(
          burcAdi, burcTarihi, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
