import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/category-section/category-article-item.dart';
import 'package:makaryo_mobile/components/category-section/category-video-item.dart';
import 'package:makaryo_mobile/providers/kategoriClass.dart';
import '../color.dart';
import 'dummyData.dart';

class CategoryScreen extends StatelessWidget {
  Kategori _category;
  var _name, _color, _percentage;

  CategoryScreen(this._category) {
    _name = _category.getKategoriName();
    _color = _category.getColor();
    _percentage = _category.getPercentage();
  }

  @override
  Widget build(BuildContext context) {
    var tmpList = kontenList.where((k) => k.getKategori() == _name).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(
          _name,
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return (tmpList[index].getJenis() == "artikel"
                  ? CategoryArticleItem(tmpList[index])
                  : CategoryVideoItem(tmpList[index]));
            },
            itemCount: tmpList.length,
          ),
        ),
      ),
    );
  }
}
