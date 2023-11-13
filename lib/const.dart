import 'package:flutter/material.dart';

Color girisColor = Colors.black;
Color girisFontColor = Colors.white;
Color kayitOlColor = Colors.white;
Color kayitOlFontColor = Colors.black;
Color anaEkranColor = const Color.fromRGBO(33, 36, 41, 1);
Color guncelDurumTitleColor = Color.fromARGB(255, 244, 242, 242);
bool girisVisibility = true;
bool epostaBool = true;
bool sifreBool = true;
bool tekrarSifreBool = false;
bool sifreUnuttumBool = true;
String butonText = "Giriş Yap";
double yapilacakTahsisat = 50.00;
double yapilacakOdeme = 150.00;
String firmaAdi = "Konsis Bilişim Hizmetleri";
Color kismi_tahsil_edildi_color = const Color.fromARGB(251, 254, 162, 2);
Color tahsil_edilmemis_color = const Color.fromARGB(250, 254, 2, 2);
Color tahsil_edilmis_color = const Color.fromARGB(250, 2, 254, 48);
bool geriOkVisibility = false;
bool ileriOkVisibility = true;
bool geriOkVisibilityGider = false;
bool ileriOkVisibilityGider = true;
String faturaBaslik = "Tüm Faturalar";
String faturaBaslikGider = "Tüm Faturalar";
bool tumFaturalarContainer = true;
bool tahsilEdilmemisContainer = false;
bool kismiTahsilEdilmisContainer = false;
bool tahsilEdilmisContainer = false;
bool tumFaturalarGider = true;
bool kismiOdenmisContainer = false;
bool odenmemisContainer = false;
bool odenmisContainer = false;
String tarihTahsilat = "11.10.2021";
String belgeTutariYazi = "Belge Tutarı : $belgeTutari";
int belgeTutari = 900;
String tahsilatDurumu = "Tahsil Edilmiş";
String tahsilatDurumu2 = "Tahsil Edilmemiş";
String tahsilatDurumu3 = "Kısmi Tahsil Edilmiş";
String odemeDurumu = "Ödenmiş";
String musteriDurumu = "Alacağı Yok";
String musteriDurumu2 = "Alacağı var";
String odemetDurumu2 = "Ödenmemiş";
String odemeDurumu3 = "Kısmi Ödenmiş";
String basilk = "Ürün:";
String urunMiktar = "Stok:";
String urunBirim = "Miktar";
String urunBirimFiyat = "Birim fiyat  tutarı : ";
String firma = "Müşteri : Tutar Teknoloji";
String firma2 = "Müşteri : Konsis Bilişim Hizmetleri";
String musteriBelgeTutariYazi = "Belge Tutarı : 49.000,000";
String musteriBelgeTutariYazi2 = "Belge Tutarı : 900,000";
String alacakDurumu = "Alacağı var";
String alacakDurumu2 = "Alacağı yok";
String gelirGiderFaturaBaslik = "";
String hesapTuru = "Kasa";
String dovizCinsi = "Genel";
String hesapIsmi = "TL";
String bakiye = "42.000,000";
String musteriAdi = "Ürün Adı:TUTAR TEKNOLOJİ";
String tarihHizmetler = "Tarih:20.02.2023";
String belgeKodu = "Belge Kodu:54265852456";
String faturaTutari = "Satış Fiyatı : 59.000,000 ₺";
String kategoriler = "Ar-Ge Dışı Projeler";
String kategoriText1 = "Ar-Ge Projeleri";
String kategoriText2 = "Danışmanlık";
String kategoriText3 = "Eğitim";
String kategoriText4 = "Genel Gider";
String kategoriText8 = "Kira";
String kategoriText5 = "Personel Giderleri";
String kategoriText6 = "Yemek";
String kategoriText7 = "Proje Dışı Gelirler";
String butonYazi = "Belge Ekle";
String firma5 = "TUTAR TEKNOLOJİ-RIDVAN TUTAR";
String musteriBelgeTutariYazi5 = "Belge Tutarı:10.000,00  ₺";
String tahsilatTarihi = "12.12.2012";
String VadeDurumu = "Vade Durumu :Gecikmemiş";
String firmaAd = "Konsis Bilişim Hizmetler";
String tutar = "900,00  ₺ ";
String miktarFatura = "Miktar 10.000,00  ₺ ";
String bilgi = "Bilgi:5479525430";
String belgeFatura = "İşlem Türü : Fatura Tahsilatı";
bool checkYuzde = false;
 String? cariDeger;
 int kontrolOdeme=0;
 String firmaninAdi="Konsis Bilişim Hizmetleri Konsis Bilişim Hizmetleri";
 String belgeNumarasi2="Belge Numarası : GIB2023000000006";
 String musteriNo="Telefon : 0(507)589 66 25";
 String urunKodu="Ürün Kodu : ADOP";
 String miktar ="Mikar 1 yıllık";
 String donem="Dönem Mayıs";
 String hesapKDV="Hesaplanan KDV :725,93 ₺";
 String indKDV="İndirilecek KDV 100,93 ₺";
 String netKDvtest="625,00 ₺";
 String belgeTuru="Gelir";
String belgeTuru2="Gider";
String faturaTutariKDV="Fatura Tutarı : 725,93 ₺";
String cariAdi="Cari :Konsis Bilişim Hizmetleri";
String OdemeYapGiris="";
String odemeYapBaslik="";
String odemeYapButtonText="";
String totalFiyat="Total Fiyat:";
String ePosta="E mail : rasit289@gmail.com";
String musteriBakiye="Bakiye:48.546,10 ₺";
String urunKoduTest="Ürün Kodu GIB2023000000006";
String vergiDairesi="Vergi Dairesi : Karapınar";
String tcVergiNo="TC/Vergi No : 457896245";
String miktarRapor="Miktar: ";
String raporTutar="Vergiler Dahil Tutar :725,93 ₺ ";
String tahsilatGecmisiBaslik="Tahsilat Geçmişi";
String odemeGecmisiTarih="";
String odemeGecmisiMiktar="";
String odemeGecmisiKasa="";
String odemeGecmisiTur="";
int belgeKontrol=0;
String containerTitleDeneme="konteynır";
String deviceTitleDeneme="cihaz";




var musteriRaporTest = [
  [firma,musteriNo, ePosta, vergiDairesi,tcVergiNo,musteriBakiye],
  [firma2,musteriNo, ePosta, vergiDairesi,tcVergiNo, musteriBakiye],
  [firma,musteriNo, ePosta, vergiDairesi, tcVergiNo,musteriBakiye],
  [firma2,musteriNo, ePosta, vergiDairesi, tcVergiNo,musteriBakiye],
];
var hizmetRaporTest = [
  [musteriAdi,urunKoduTest, miktarRapor, urunBirimFiyat,musteriBakiye,tahsilatTarihi],
  [musteriAdi,urunKoduTest, miktarRapor, urunBirimFiyat,musteriBakiye, tahsilatTarihi],
  [musteriAdi,urunKoduTest, miktarRapor, urunBirimFiyat, musteriBakiye,tahsilatTarihi],
  [musteriAdi,urunKoduTest, miktarRapor, urunBirimFiyat, musteriBakiye,tahsilatTarihi],
];






enum SampleItem { itemOne, itemTwo, itemThree }

String carilerBaslik = "";
String TMBaslik = "";
String saglananHizmetler = "";
String saglananhizmet = "";

List<String> items2 = [
  'Müşteri',
  'Tedarikçi',
];
List<String> tedarikciDrop = [
  'Tedarikçi',
];
List<String> hesapTuruDrop = [
  'Kasa',
  'Banka',
];
List<String> kasalarDrop = [
  'Tüm Kasalar',
  'Deneme Kasası (47.800,00 ₺)',
];
List<String> bakiyeDurumuDrop = [
  'Borcu Var',
  'Borcu Yok',
];
List<String> paraCinsiDropDown = [
  'TL',
  'Euro',
  'Dolar',
];
List<String> islemTuruDrop = [
  'Para Girişi',
  'Para Çıkışı',
];
List<String> hareketTuruDrop = [
  'Havale/Eft',
  'Kredi Kartı',
  'Kasa(Nakit)',
];
List<String> tevkifatDrop = [
  '1/10',
  '2/10',
  '3/10',
  '4/10',
  '5/10',
];
List<String> paraCinsi = [
  '₺',
  '€',
];
List<String> birimDrop = [
  'Adet',
  'Kilo',
  'Lisans',
  ' Lisans (Aylık)',
  'Lisans (Yıllık)',
  'Lisans (Süresiz)',
  'Hizmet (Günlük)',
  'Hizmet (Haftalık)',
  'Hizmet (Aylık)',
  'Hizmet (Yıllık)',
];

Icon a = Icon(Icons.message, size: 50, color: Colors.red);

List<String> deneme = <String>['One', 'Two', 'Three', 'Four'];

List<String> kdvlist = <String>['Tümü', 'Satışlar', 'Giderler'];

String FaturaNumrasi = "Fatura No:45285645524";
const List<String> list = <String>['Faturalar', 'Müşteriler', 'Hizmet/Ürünler'];

String firma3 = "Konsis Bilişim Hizmetleri";
String musteriBelgeTutariYazi4 = "Belge Tutarı : 900,000 ₺ ";
String tarihTahsilat1 = "Tarih: 11.10.2021";

String giderMuahasebe = "Gider";
String gelirMuhasebeString = "Gelir";
String urunAdi = "Ürün Adı:Gforce Ekran Kartı";
String miktarTedarikci = "Miktar 10 Adet";
String kdvMiktari = "KDV Mikatı :%18";
String satisFiyati = "Alış Fiyatı=2000  ₺  ";
String kategoriAdi = "Deneme";
String adSoyad = "Raşit Karabıyık";
String telefonPersonel = "05374568912";
String eMailPersonel = "karabiyik@gmail.com";
String gorev = "Çalışan";
String TCno = "45689614522";
int faturaCheck=0;
int musteriCheck=0;

var personellerList = [
  [adSoyad, telefonPersonel, eMailPersonel, gorev, TCno],
  [adSoyad, telefonPersonel, eMailPersonel, gorev, TCno],
  [adSoyad, telefonPersonel, eMailPersonel, gorev, TCno],
];

var muhasabeRaporlariGiderTest = [
  [cariAdi,belgeNumarasi2, tutar, giderMuahasebe,tarihTahsilat1,tahsilatTarihi],
  [cariAdi,belgeNumarasi2, tutar, giderMuahasebe,tarihTahsilat1,tahsilatTarihi],
];



var muhasabeRaporlariGelirTest = [
  [cariAdi, belgeNumarasi2,tutar, gelirMuhasebeString,tahsilatTarihi,tahsilatTarihi],
  [cariAdi, belgeNumarasi2,tutar, gelirMuhasebeString,tahsilatTarihi,tahsilatTarihi],
];
var faturaTahsilatiContainer = [
  [belgeFatura,miktarFatura, tahsilatTarihi, bilgi,bilgi],
  [belgeFatura,miktarFatura, tahsilatTarihi, bilgi,bilgi],
  [belgeFatura,miktarFatura, tahsilatTarihi, bilgi,bilgi],
  [belgeFatura,miktarFatura, tahsilatTarihi, bilgi,bilgi],
   [belgeFatura,miktarFatura, tahsilatTarihi, bilgi,bilgi],

];
var tedarikciTest = [
  [urunAdi,urunKoduTest, miktarTedarikci, kdvMiktari, satisFiyati],
 [urunAdi,urunKoduTest, miktarTedarikci, kdvMiktari, satisFiyati],
];

var kdvRaporuTest = [
  [donem, hesapKDV,indKDV, netKDvtest],
  [donem, hesapKDV,indKDV, netKDvtest],
 [donem, hesapKDV,indKDV, netKDvtest],
 [donem, hesapKDV,indKDV, netKDvtest],
 
 
];



var tahsilatRaporuTest = [
  [firma5,belgeNumarasi2, musteriBelgeTutariYazi5, tahsilatTarihi, VadeDurumu],
  [firma5,belgeNumarasi2, musteriBelgeTutariYazi5, tahsilatTarihi, VadeDurumu],
  [firma5,belgeNumarasi2, musteriBelgeTutariYazi5, tahsilatTarihi, VadeDurumu],
  [firma5,belgeNumarasi2, musteriBelgeTutariYazi5, tahsilatTarihi, VadeDurumu],
];

var FaturalarDropDownTest = [
  [firma3, FaturaNumrasi, raporTutar, tarihTahsilat1],
    [firma3, FaturaNumrasi, raporTutar, tarihTahsilat1],
 [firma3, FaturaNumrasi, raporTutar, tarihTahsilat1],
  [firma3, FaturaNumrasi, raporTutar, tarihTahsilat1],
];

//List<int> items = List<int>.generate(10, (int index) => index);

List<String> kategorilerTest = [
  kategoriler,
  kategoriText5,
  kategoriText1,
  kategoriText2,
  kategoriText3,
  kategoriText4,
  kategoriText5,
  kategoriText6,
  kategoriText7,
  kategoriText8,
];


var hizmetlerTest = [
  [musteriAdi, urunKodu, miktar, faturaTutari],
  [musteriAdi, urunKodu, miktar, faturaTutari],
];
var istatistikTest = [
  [firma, belgeNumarasi2, tutar, tahsilatTarihi],
  [firma, belgeNumarasi2, tutar, tahsilatTarihi],
];

