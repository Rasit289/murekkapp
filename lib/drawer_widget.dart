import 'package:flutter/material.dart';
import 'package:murekkapp/pages/GelirFaturaRaporu.dart';
import 'package:murekkapp/pages/GiderFaturaRaporu.dart';
import 'package:murekkapp/pages/KDVRaporu.dart';
import 'package:murekkapp/pages/MuhasabeRaporlari.dart';
import 'package:murekkapp/pages/Musteriler.dart';
import 'package:murekkapp/pages/OdemelerRaporu.dart';
import 'package:murekkapp/pages/PersonelEkle.dart';
import 'package:murekkapp/pages/TahsilatRaporu.dart';
import 'package:murekkapp/pages/etiketHavuzu.dart';
import 'package:murekkapp/pages/gelirFaturalari.dart';
import 'package:murekkapp/pages/giderFatura.dart';
import 'package:murekkapp/pages/guncel_durumum.dart';
import 'package:murekkapp/pages/hizmetveUrunler.dart';
import 'package:murekkapp/pages/kasaVeBankalar.dart';
import 'package:murekkapp/pages/kategoriDagilimlari.dart';
import 'package:murekkapp/pages/tedarikciler.dart';
import 'package:murekkapp/widgets/ecxelDownload.dart';
import 'const.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget _createDrawerHeader() {
    // DrawerHeader döndüren fonksiyon
    return DrawerHeader(
        decoration: BoxDecoration(
          color: anaEkranColor,
          
          
          image: const DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('images/main_logo.jpg'),
            scale: 3,
            
          ),
        ),
        child: const Column());
  }

  Widget createDrawItem(
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return ListTile(
      title: Row(
        // İkon ve yazıyı tutan row
        children: <Widget>[
          Icon(
            icon, // Drawer ikonu
            
            color: Colors.white, //DrawerItem İkon rengi
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              text, // DrawerItem Yazısı
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ), // DrawerItem Yazı rengi
            ),
          )
        ],
      ),
      onTap: onPressed, // Tıklandığında çalışacak fonksiyon
    );
  }

  //Aşağıya doğru popup mönü kolay yapımı
  ExpansionTile cariler(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        "Cariler",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          //fontWeight: FontWeight.bold
        ),
      ),
      leading: const Icon(Icons.account_box_rounded, color: Colors.white),
      children: [
        ListTile(
            title: const Text(
              "Müşteriler",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              carilerBaslik = "Müşteri Ekle";

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Musteriler()));
            }),
        ListTile(
          title: const Text(
            "Tedarikçiler",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            carilerBaslik = "Tedarikçi Ekle";

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Tedarikciler()));
          },
        ),
      ],
    );
  }

  ExpansionTile ayarlar(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        "Ayarlar",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          //fontWeight: FontWeight.bold
        ),
      ),
      leading: const Icon(Icons.settings, color: Colors.white),
      children: [
        ListTile(
          title: const Text(
            "Etiket Havuzu",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const EtiketHavuzu()));
          },
        ),
        ListTile(
          title: const Text(
            "Personel İşlemleri",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const PersonelEkle()));
          },
        ),
      ],
    );
  }

  ExpansionTile raporlar(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        "Raporlar",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          //fontWeight: FontWeight.bold
        ),
      ),
      leading: const Icon(Icons.attachment_outlined, color: Colors.white),
      children: [
        ListTile(
            title: const Text(
              "Gelir Fatura Raporu",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GelirFaturaRaporu()));
            }),
        ListTile(
          title: const Text(
            "Gider Fatura Raporu",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const GiderFaturaRaaporu()));
          },
        ),
        ListTile(
            title: const Text(
              "Tahsilat Raporu",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                //fontWeight: FontWeight.bold
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TahsilatRaporu()));
            }),
        ListTile(
          title: const Text(
            "Ödemeler Raporu",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const OdemelerRaporu()));
          },
        ),
        ListTile(
          title: const Text(
            "KDV Raporu",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const KDVRaporu()));
           
          },
        ),
        ListTile(
          title: const Text(
            "Muhasebe Raporları",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>  MuhasabeRaporlari(containerTitle:containerTitleDeneme,deviceTitle: deviceTitleDeneme,)));
          },
        ),
           ListTile(
          title: const Text(
         "Kategori Dağılımları",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              //fontWeight: FontWeight.bold
            ),
          ),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const KataegoriDagilimlari()));
          },
        ),
       
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(color: Colors.blue),

        //canvasColor:Colors.amber,
      ),
      child: SizedBox(
        width: 220, // Drawerın genişliğini belirleyen property
        child: Drawer(
          backgroundColor: anaEkranColor,
          child: ListView(children: [
            _createDrawerHeader(), // DrawerHeader
            createDrawItem(
                icon: Icons.home,
                text: "Guncel Durumum",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GuncelDurumum()));
                }),
            createDrawItem(
                icon: Icons.add_circle_outline_sharp,
                text: "Gelir Faturaları",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const gelirFaturalari()));
                }),

            createDrawItem(
                icon: Icons.do_disturb_on_outlined,
                text: "Gider Faturaları",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const giderFatura()));
                }),
            raporlar(context),
            cariler(context),

            createDrawItem(
                icon: Icons.account_balance_wallet_rounded,
                text: "Kasa ve Bankalar",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const kasaVeBankalar()));
                }),
            createDrawItem(
                icon: Icons.design_services_outlined,
                text: "Hizmet ve Ürünler",
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HizmetVeUrunler()));
                }),

           
         
            ayarlar(context),
          ]),
        ),
      ),
    );
  }
}
