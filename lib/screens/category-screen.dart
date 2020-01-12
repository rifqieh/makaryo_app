import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/category-section/category-article-item.dart';
import 'package:makaryo_mobile/components/category-section/category-video-item.dart';
import '../color.dart';

class CategoryScreen extends StatelessWidget {
  var _category = 'KATEGORI';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          _category,
          style: TextStyle(fontWeight: FontWeight.w600, color: blackColor),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return (index % 4 == 1
                  ? CategoryArticleItem()
                  : CategoryVideoItem());
            },
          ),
        ),
      ),
    );
  }
}
