import 'package:flutter/material.dart';
import 'package:makaryo_mobile/components/home-section/home-category-item.dart';
import '../color.dart';
import 'dummyData.dart';

class CategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KATEGORI",
          style: TextStyle(fontWeight: FontWeight.w600, color: blackColor),
        ),
        leading: BackButton(),
      ),
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return (HomeCategoryItem(kategoriList[index]));
            },
            itemCount: kategoriList.length,
          ),
        ),
      ),
    );
  }
}
