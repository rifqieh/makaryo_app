import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/kontenClass.dart';
import '../../color.dart';

class CategoryVideoAdminItem extends StatefulWidget {
  Konten konten;

  CategoryVideoAdminItem(this.konten);

  @override
  _CategoryVideoAdminItemState createState() =>
      _CategoryVideoAdminItemState(konten);
}

class _CategoryVideoAdminItemState extends State<CategoryVideoAdminItem> {
  Konten konten;
  var _idKonten, _kategori, _jenis, _bookmark, _judul, _url;

  _CategoryVideoAdminItemState(this.konten) {
    this._idKonten - konten.getIdKonten();
    this._kategori = konten.getKategori();
    this._jenis = konten.getJenis();
    this._bookmark = konten.getBookmark();
    this._judul = konten.getJudul();
    this._url = konten.getUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(_judul),
        trailing: IconButton(
          icon: Icon(_bookmark ? Icons.favorite : Icons.favorite_border),
          color: primaryColor,
          onPressed: () {
            konten.setBookmark();
            _bookmark = konten.getBookmark();
          },
        ),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 50,
          child: AspectRatio(
            aspectRatio: 2 / 1,
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
