import 'package:flutter/material.dart';
import 'package:makaryo_mobile/providers/kontenClass.dart';
import 'package:makaryo_mobile/screens/article-screen.dart';
import 'package:makaryo_mobile/screens/pdf-viewer-screen.dart';
import '../../color.dart';

class CategoryArticleItem extends StatefulWidget {
  Konten konten;

  CategoryArticleItem(this.konten);

  @override
  _CategoryArticleItemState createState() => _CategoryArticleItemState(konten);
}

class _CategoryArticleItemState extends State<CategoryArticleItem> {
  Konten konten;
  var _idKonten, _kategori, _jenis, _bookmark, _judul, _url;

  _CategoryArticleItemState(this.konten) {
    this._idKonten = konten.getIdKonten();
    this._kategori = konten.getKategori();
    this._jenis = konten.getJenis();
    this._bookmark = konten.getBookmark();
    this._judul = konten.getJudul();
    this._url = konten.getUrl();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticleScreen()));
      },
      child: Container(
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
              setState(() {
                konten.setBookmark();
                _bookmark = konten.getBookmark();
              });
            },
          ),
        ),
      ),
    );
  }
}
