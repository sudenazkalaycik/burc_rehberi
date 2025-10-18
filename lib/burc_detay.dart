import 'package:flutter/material.dart';
import 'model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secileBurc;

  const BurcDetay({required this.secileBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.white;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
    print("init state çalıştı");

    // bu yapı build çakışmasını engelelyerek daha güvenli çalıştırır. Yani bir build bitmeden diğeri başlamaz
    WidgetsBinding.instance.addPostFrameCallback((_) => appBarRenginiBul());
  }

  @override
  Widget build(BuildContext context) {
    print("build çalıştı");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            pinned: true,
            expandedHeight: 250,
            backgroundColor: appBarRengi,

            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "${widget.secileBurc.burcAdi} Burcu Özellikleri",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              background: Image.asset(
                "images/${widget.secileBurc.burcBuyukResim}.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Text(
                  widget.secileBurc.burcDetayi,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    print("Build bitti baskın renk bulunacak");
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage('images/${widget.secileBurc.burcBuyukResim}.png'),
    );
    appBarRengi = _generator.dominantColor!.color;
    print("Baskın renk bulundu build methodu tekrar çalıştırılacak");
    setState(() {
      // appBarRengini değiştirdik bunun uygulanması için build methodun uyarıması gerej bunu da setState yapıyor
    });
  }
}
