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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(
          _name,
          style: TextStyle(fontWeight: FontWeight.w600, color: blackColor),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemCount: kontenList.length,
            itemBuilder: (context, index) {
              return (kontenList[index].getJenis() == "artikel"
                  ? CategoryArticleItem(kontenList[index])
                  : CategoryVideoItem(kontenList[index]));
            },
          ),
        ),
      ),
    );
  }
}
