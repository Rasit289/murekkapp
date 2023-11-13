
import 'const.dart';


var kasaVeBankalarTest = [
  [hesapTuru, dovizCinsi, hesapIsmi,bakiye],
  [hesapTuru, dovizCinsi, hesapIsmi, bakiye],
  [hesapTuru, dovizCinsi, hesapIsmi, bakiye],
  [hesapTuru, dovizCinsi, hesapIsmi, bakiye],
];


var alacagiOlanTedarikciTest = [
  [firma, musteriNo,musteriBelgeTutariYazi, alacakDurumu,tarihTahsilat],
  [firma2, musteriNo,musteriBelgeTutariYazi2, alacakDurumu, tarihTahsilat],
  [firma,musteriNo, musteriBelgeTutariYazi, alacakDurumu, tarihTahsilat],
  [firma2, musteriNo,musteriBelgeTutariYazi2, alacakDurumu, tarihTahsilat],
];

var alacagiOlmayanTedarikciTest = [
  [firma,musteriNo, musteriBelgeTutariYazi, alacakDurumu2,tarihTahsilat],
  [firma2,musteriNo, musteriBelgeTutariYazi2, alacakDurumu2, tarihTahsilat],
  [firma,musteriNo, musteriBelgeTutariYazi, alacakDurumu2, tarihTahsilat],
  [firma2,musteriNo, musteriBelgeTutariYazi2, alacakDurumu2, tarihTahsilat],
];

var KDVdokumuTest = [
  [firma,belgeNumarasi2, faturaTutariKDV, belgeTuru2,tarihTahsilat],
  [firma2,belgeNumarasi2, faturaTutariKDV, belgeTuru2, tarihTahsilat],
  [firma, belgeNumarasi2,faturaTutariKDV, belgeTuru2, tarihTahsilat],
  [firma2, belgeNumarasi2,faturaTutariKDV, belgeTuru2, tarihTahsilat],
];
var borcuOlanMusteriTest = [
  [firma,musteriNo, ePosta, musteriDurumu2,musteriBakiye],
    [firma,musteriNo, ePosta, musteriDurumu2,musteriBakiye],
  [firma,musteriNo, ePosta, musteriDurumu2,musteriBakiye],
  [firma,musteriNo, ePosta, musteriDurumu2,musteriBakiye],
];
var KDVdokumuTest2 = [
  [firma,belgeNumarasi2, faturaTutariKDV, belgeTuru,tarihTahsilat],
  [firma2,belgeNumarasi2, faturaTutariKDV, belgeTuru, tarihTahsilat],
  [firma, belgeNumarasi2,faturaTutariKDV, belgeTuru, tarihTahsilat],
  [firma2, belgeNumarasi2,faturaTutariKDV, belgeTuru, tarihTahsilat],
];

var borcuOlmayanMusteriTest = [
  [firma,musteriNo, ePosta, musteriDurumu,musteriBakiye],
  [firma2,musteriNo, ePosta, musteriDurumu, musteriBakiye],
  [firma,musteriNo, ePosta, musteriDurumu, musteriBakiye],
  [firma2,musteriNo, ePosta, musteriDurumu, musteriBakiye],
];



var urunVeHizmetTest = [
  [basilk, urunMiktar, urunBirim,urunBirimFiyat,totalFiyat],
 [basilk, urunMiktar, urunBirim,urunBirimFiyat,totalFiyat],
  [basilk, urunMiktar, urunBirim,urunBirimFiyat,totalFiyat],
 [basilk, urunMiktar, urunBirim,urunBirimFiyat,totalFiyat],
];


var tahsilEdilmisTest = [
    [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
   [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
 [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
];
var tahsilEdilmisTest1 = [
  [firmaninAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
 [firmaninAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
  [firmaninAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
  [firmaninAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
 [firmaninAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
];
var tumFaturalarTest = [
  [firmaAdi, belgeTutariYazi, tahsilatDurumu,tarihTahsilat],
  [firmaAdi, belgeTutariYazi, tahsilatDurumu2, tarihTahsilat],
  [firmaAdi, belgeTutariYazi, tahsilatDurumu3, tarihTahsilat],
  [firmaAdi, belgeTutariYazi, tahsilatDurumu2, tarihTahsilat],
   [firmaAdi,belgeTutariYazi, tahsilatDurumu2, tarihTahsilat],
  
];
var tahsiEdilmemisTest = [
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu2,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu2,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu2,tarihTahsilat],
   [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu2,tarihTahsilat],
   [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu2,tarihTahsilat],
];
var kismiTahsilEdilmisTest = [
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu3,tarihTahsilat],
   [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu3,tarihTahsilat],
   [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu3,tarihTahsilat],
    [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu3,tarihTahsilat],
     [firmaAdi,belgeNumarasi2, belgeTutariYazi, tahsilatDurumu3,tarihTahsilat],
];



var odenmisTest = [
  [firmaAdi, belgeNumarasi2,belgeTutariYazi, odemeDurumu,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu, tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu, tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu, tarihTahsilat],
    [firmaAdi, belgeNumarasi2,belgeTutariYazi, odemeDurumu, tarihTahsilat],
];
var tumFaturalarOdenmisTest = [
  [firmaAdi, belgeTutariYazi, odemeDurumu,tarihTahsilat],
  [firmaAdi, belgeTutariYazi, odemetDurumu2, tarihTahsilat],
  [firmaAdi, belgeTutariYazi, tahsilatDurumu3, tarihTahsilat],
  [firmaAdi, belgeTutariYazi, tahsilatDurumu2, tarihTahsilat],
   [firmaAdi, belgeTutariYazi, tahsilatDurumu2, tarihTahsilat],
];
var odenmemisTest = [
  [firmaAdi, belgeNumarasi2,belgeTutariYazi, odemetDurumu2,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemetDurumu2, tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemetDurumu2, tarihTahsilat],
  [firmaAdi, belgeNumarasi2,belgeTutariYazi, odemetDurumu2, tarihTahsilat],
   [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemetDurumu2, tarihTahsilat],
];
var kismiOdenmisTest = [
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu3,tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu3, tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu3, tarihTahsilat],
  [firmaAdi, belgeNumarasi2,belgeTutariYazi, odemeDurumu3, tarihTahsilat],
  [firmaAdi,belgeNumarasi2, belgeTutariYazi, odemeDurumu3, tarihTahsilat],
];


