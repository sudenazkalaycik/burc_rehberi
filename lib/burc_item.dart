import 'package:burc_rehberi/burc_detay.dart';
import 'package:flutter/material.dart';
import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;

  const BurcItem({required this.listelenenBurc, super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            onTap: () {
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  // yukarıda aldığımız listelenenBurç aslında o anda seçilen burçtur.
                  builder: (context) => BurcDetay(secileBurc: listelenenBurc),
                ),
              );*/
              Navigator.pushNamed(context, '/burcDetay', arguments: listelenenBurc);
            },
            leading: Image.asset("images/" + listelenenBurc.burcKucukResim),
            title: Text(
              listelenenBurc.burcAdi,
              style: myTextStyle.headlineMedium,
            ),
            subtitle: Text(
              listelenenBurc.burcTarihi,
              style: myTextStyle.titleLarge,
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.pink),
          ),
        ),
      ),
    );
  }
}
