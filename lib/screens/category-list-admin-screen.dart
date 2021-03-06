import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/category-section/category-article-item.dart';
import 'package:makaryo_mobile/components/category-section/category-video-item.dart';
import 'package:makaryo_mobile/providers/kategoriClass.dart';
import 'package:makaryo_mobile/screens/add-post-admin-screen.dart';
import '../color.dart';
import 'dummyData.dart';

class CategoryListAdminScreen extends StatelessWidget {
  Kategori _category;
  var _name, _color, _percentage;

  CategoryListAdminScreen(this._category) {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostAdminScreen()));
        },
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
