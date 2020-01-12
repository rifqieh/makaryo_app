import 'package:flutter/material.dart';
import '../../color.dart';

class CategoryArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text('Hello'),
        trailing: Icon(
          Icons.favorite,
          color: primaryColor,
        ),
      ),
    );
  }
}
