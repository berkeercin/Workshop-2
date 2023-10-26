void main() {
  int sayi = 407;
  String sayiString = sayi.toString();
  List<String> basamakListesi = sayiString.split('');
  List<int> basamaklar = basamakAyristir(basamakListesi);
  armstrongHesaplama(basamaklar, 100, sayi);
}

List<int> basamakAyristir(List<String> a) {
  int i = 0;
  List<int> basamaklar = [];
  int basamakSayisi = a.length;
  while (i < basamakSayisi) {
    if (basamakSayisi == 1) {
      dynamic basamak = int.tryParse(a[0]);
      if (basamak == null)
        break;
      else {
        basamaklar.add(basamak);
      }
    } else {
      int iBasamak = basamakSayisi - i;
      iBasamak = iBasamak - 1;
      dynamic basamak = int.tryParse(a[iBasamak]);
      if (basamak == null)
        break;
      else {
        basamaklar.add(basamak);
      }
    }

    i++;
  }
  basamaklar = basamaklar.reversed.toList();
  return basamaklar;
}

void armstrongHesaplama(List<int> list, int donguSayisiGiris, int anaSayi) {
  int i = 0;
  int toplamlar = 0;
  int donguSayisi = donguSayisiGiris - 1;
  List<int> reversedSayilar = [];
  int listeUzunlugu = list.length;
  int indexUzunlugu = listeUzunlugu - 1;
  while (indexUzunlugu > -1) {
    reversedSayilar.add(list[indexUzunlugu]);
    indexUzunlugu--;
  }
  List<int> sayilar = reversedSayilar.reversed.toList();
  String sonuc = anaSayi.toString() + " = ";
  while (i < donguSayisi) {
    int j = 0;
    int listeUzunlugu = list.length;
    int indexUzunlugu = listeUzunlugu - 1;
    while (indexUzunlugu > -1) {
      list[indexUzunlugu] = list[indexUzunlugu] * sayilar[indexUzunlugu];
      indexUzunlugu--;
    }
    while (j < list.length) {
      toplamlar = toplamlar + list[j];
      j++;
    }
    if (toplamlar != anaSayi) {
      toplamlar = 0;
    }
    int k = 0;
    if (toplamlar == anaSayi) {
      print(anaSayi.toString() + " bir Armstrong sayıdır.");
      while (k < listeUzunlugu) {
        sonuc += sayilar[k].toString() + "^" + j.toString() + " + ";
        k++;
      }
      int sonucDuzeltme = sonuc.lastIndexOf("+");
      sonuc = sonuc.replaceFirst(r'+', '', sonucDuzeltme);
      print(sonuc);
      break;
    }
    i++;
  }

  if ((toplamlar != anaSayi)) {
    sonuc = anaSayi.toString() +
        " sayısı " +
        donguSayisiGiris.toString() +
        "e kadar olan katlarında Armstrog sayı değildir.";
    print(sonuc);
  }
}
